package com.parker.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.service.UserBoardService;
import com.parker.admin.vo.UserBoardVO;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {

	@Autowired
	UserBoardService userBoardService;

	@RequestMapping("/userboardlist")
	public ModelAndView userBoardList(ModelAndView mav) {
		List<UserBoardVO> userBoardList = userBoardService.userBoardList();
		mav.addObject("userBoardList", userBoardList);
		mav.setViewName("userboard/userboardlist");
		return mav;

	}
}
