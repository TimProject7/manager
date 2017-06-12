package com.parker.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.service.AdminService;
import com.parker.vo.AdminVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	Logger logger = Logger.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/adminmain", method = RequestMethod.POST)
	public String login(@ModelAttribute AdminVO avo, Model model, HttpSession session) {
		logger.info("adminmain 호출 설공");
		int result = 0;
		result = adminService.selectLogin(avo);
		System.out.println("result= " + result);
		String url = "";

		if (result == 1) {
			url = "admin/adminmain";
			session.setAttribute("avo", avo);
		} else {
			System.out.println("실패");
			url = "";
		}
		return url;
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, AdminVO avo) {
		session.setAttribute("avo", null);
		return "redirect:/";
	}
}
