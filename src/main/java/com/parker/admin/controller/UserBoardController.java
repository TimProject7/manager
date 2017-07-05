package com.parker.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.paging.Paging;
import com.parker.admin.paging.Util;
import com.parker.admin.service.UserBoardService;
import com.parker.admin.vo.UserBoardVO;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {

	@Autowired
	UserBoardService userBoardService;

	@RequestMapping("/userboardlist")
	public ModelAndView userBoardList(ModelAndView mav,UserBoardVO ubvo) {
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
}
