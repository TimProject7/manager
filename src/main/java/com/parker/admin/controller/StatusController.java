package com.parker.admin.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.paging.Paging;
import com.parker.admin.paging.Util;
import com.parker.admin.service.StatusService;
import com.parker.admin.service.UserService;
import com.parker.admin.vo.DeliveryVO;
import com.parker.admin.vo.UserVO;

@Controller
@RequestMapping("/status")
public class StatusController {
	Logger logger = Logger.getLogger(StatusController.class);
	@Autowired
	StatusService statusService;
	@Autowired
	private UserService userService;

	@RequestMapping("/salesstatus")
	public ModelAndView salesStatus(ModelAndView mav) {
		List<DeliveryVO> salesStatus = statusService.salesStatus();
		mav.addObject("salesStatus", salesStatus);

		return mav;
	}

	@RequestMapping(value = "/statususer", method = RequestMethod.GET)
	public ModelAndView stautsUser(@ModelAttribute UserVO uvo, ModelAndView mav) {
		logger.info("stautsUser 호출 설공");
		Paging.set(uvo);

		List<UserVO> statusUserList = userService.userList(uvo);

		int yongho = userService.userStatisticeY(uvo);
		int yongho1 = userService.userStatisticeN(uvo);
		int total = userService.userListCnt(uvo);
		int count = total - (Util.nvl(uvo.getPage()) - 1) * Util.nvl(uvo.getPageSize());

		mav.addObject("yongho", yongho);
		mav.addObject("yongho1", yongho1);
		mav.addObject("count", count);
		mav.addObject("data", uvo);
		mav.addObject("total", total);
		mav.addObject("statusUserList", statusUserList);
		mav.setViewName("status/statususer");

		return mav;
	}
}
