package com.parker.admin.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.paging.Paging;
import com.parker.admin.paging.Util;
import com.parker.admin.service.UserService;
import com.parker.admin.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	UserService userService;

	// 1. 회원 목록
	@RequestMapping("/userlist")
	public ModelAndView userList(ModelAndView mav, UserVO uvo) {
		Paging.set(uvo);
		List<UserVO> userList = userService.userList(uvo);
		int total = userService.userListCnt(uvo);
		int count = total - (Util.nvl(uvo.getPage()) - 1) * Util.nvl(uvo.getPageSize());
		mav.addObject("count", count);
		mav.addObject("data", uvo);
		mav.addObject("total", total);
		mav.addObject("userList", userList);
		mav.setViewName("user/userlist");

		return mav;

	}

	// 2. 회원 정보 상세보기
	@RequestMapping("/userdetail/{user_number}")
	public ModelAndView userDetail(@PathVariable("user_number") int user_number, ModelAndView mav) {

		mav.addObject("userDetail", userService.userDetail(user_number));
		mav.setViewName("user/userdetail");
		return mav;

	}

	// 3. 회원 삭제 , 복구
	@RequestMapping("/userrnd")
	public String userDropOut(@RequestParam int user_number, @RequestParam String user_status) {
		logger.info("userrnd 호출 성공");
		int result = 0;
		if (user_status.equals("D")) {
			System.out.println("회원 복구");
			result = userService.userRestoration(user_number);
			if (result != 0) {

				System.out.println("회원 상태값 Y으로 변경 성공");
			} else {
				System.out.println("회원 상태 변경 실패");
			}
			return "redirect:/user/userlist";
		} else if (user_status.equals("Y")) {
			System.out.println("회원 탈퇴");
			result = userService.userDropOut(user_number);
			if (result != 0) {
				System.out.println("회원 상태값 D으로 변경 성공");
			} else {
				System.out.println("회원 상태 변경 실패");
			}
			return "redirect:/user/userlist";
		} else {
			System.out.println("뭘 잘못누른거냐?");
			return "redirect:/user/userlist";

		}

	}

}
