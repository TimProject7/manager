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
import com.parker.admin.service.BuyService;
import com.parker.admin.service.UserService;
import com.parker.admin.vo.BuyVO;
import com.parker.admin.vo.UserVO;

@Controller
@RequestMapping("/status")
public class StatusController {

	Logger logger = Logger.getLogger(StatusController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private BuyService buyService;

	@RequestMapping(value = "/statususer", method = RequestMethod.GET)
	public ModelAndView stautsUser(@ModelAttribute UserVO uvo, ModelAndView mav, @ModelAttribute BuyVO bvo) {
		logger.info("stautsUser 호출 설공");
		Paging.set(uvo);

		List<UserVO> statusUserList = userService.userList(uvo);

		int yongho = userService.userStatisticeY(uvo);
		int yongho1 = userService.userStatisticeN(uvo);
		int total = userService.userListCnt(uvo);
		int count = total - (Util.nvl(uvo.getPage()) - 1) * Util.nvl(uvo.getPageSize());

		int to = buyService.today(bvo);
		int to1 = buyService.today1(bvo);
		int to2 = buyService.today2(bvo);
		int to3 = buyService.today3(bvo);
		int to4 = buyService.today4(bvo);
		int to5 = buyService.today5(bvo);
		int to6 = buyService.today6(bvo);
		int to7 = buyService.today7(bvo);
		int to8 = buyService.today8(bvo);
		int to9 = buyService.today9(bvo);
		int to10 = buyService.today10(bvo);
		int to11 = buyService.today11(bvo);
		int to12 = buyService.today12(bvo);
		int to13 = buyService.today13(bvo);
		int to14 = buyService.today14(bvo);

		mav.addObject("to", to);
		mav.addObject("to1", to1);
		mav.addObject("to2", to2);
		mav.addObject("to3", to3);
		mav.addObject("to4", to4);
		mav.addObject("to5", to5);
		mav.addObject("to6", to6);
		mav.addObject("to7", to7);
		mav.addObject("to8", to8);
		mav.addObject("to9", to9);
		mav.addObject("to10", to10);
		mav.addObject("to11", to11);
		mav.addObject("to12", to12);
		mav.addObject("to13", to13);
		mav.addObject("to14", to14);

		/* int yongyong = buyService.today(bvo); */

		/* mav.addObject("yongyong", yongyong); */
		/* mav.addObject("buy", buyTotal); */

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
