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
import com.parker.admin.service.UserBoardService;
import com.parker.admin.vo.UserBoardVO;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {
	Logger logger = Logger.getLogger(UserBoardController.class);

	@Autowired
	UserBoardService userBoardService;

	// 1. 회원 게시판 리스트
	@RequestMapping("/userboardlist")
	public ModelAndView userBoardList(ModelAndView mav, UserBoardVO ubvo) {
		Paging.set(ubvo);
		List<UserBoardVO> userBoardList = userBoardService.userBoardList(ubvo);
		int total = userBoardService.userBoardListCnt(ubvo);
		int count = total - (Util.nvl(ubvo.getPage()) - 1) * Util.nvl(ubvo.getPageSize());
		mav.addObject("count", count);
		mav.addObject("data", ubvo);
		mav.addObject("total", total);
		mav.addObject("userBoardList", userBoardList);
		mav.setViewName("userboard/userboardlist");
		return mav;

	}

	// 2. 회원 게시판 상세보기
	@RequestMapping("/userboarddetail/{userboard_number}")
	public ModelAndView userBoardDetail(@PathVariable int userboard_number, ModelAndView mav) {
		logger.info("userBoardDetail 호출 성공");
		mav.setViewName("userboard/userboarddetail");
		mav.addObject("userBoardReply", userBoardService.userBoardReply(userboard_number));
		mav.addObject("userBoardDetail", userBoardService.userBoardDetail(userboard_number));
		return mav;
	}

	@RequestMapping("/userboarddelete")
	public String userBoardDelete(int userboard_number) {
		int result = 0;
		result = userBoardService.userBoardDelete(userboard_number);
		return "redirect:/userboard/userboardlist";

		
	
	}

}
