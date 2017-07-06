package com.parker.admin.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.service.AdminService;
import com.parker.admin.vo.AdminVO;

@Controller

public class AdminController {
	Logger logger = Logger.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginGet(@ModelAttribute AdminVO avo) {
		logger.info("loginGet 호출 설공");

		return "/admin/adminlogin";
	}

	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public String adminlogin(@ModelAttribute AdminVO avo) {
		logger.info("adminlogin 호출 설공");

		return "/admin/adminlogin";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, AdminVO avo) {
		session.setAttribute("avo", null);
		return "/admin/adminlogin";
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public ModelAndView loginCheck(HttpSession session, @ModelAttribute AdminVO avo, ModelAndView mav) {

		// 로그인 성공
		
		if (adminService.loginCheck(avo) != null) {
			session.setAttribute("avo", adminService.loginCheck(avo));
			mav.setViewName("/admin/adminmain"); // 관리자 페이지 이동
			mav.addObject("msg", "success");
			// 로그인 실패
		} else {
			mav.setViewName("/admin/adminlogin"); // 로그인 페이지 이동
			mav.addObject("msg", "failure");
		}

		return mav;
	}

}
