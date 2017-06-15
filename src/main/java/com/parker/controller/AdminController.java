package com.parker.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.parker.service.AdminService;
import com.parker.vo.AdminVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	Logger logger = Logger.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/adminmain", method = RequestMethod.GET)
	public String loginGet(@ModelAttribute AdminVO avo, Model model, HttpSession session) {
		logger.info("loginGet 호출 설공");

		return "admin/adminmain";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, AdminVO avo) {
		session.setAttribute("avo", null);
		return "redirect:/";
	}

	@RequestMapping("/adminmain")
	public ModelAndView loginCheck(HttpSession session, AdminVO avo, ModelAndView mav) {
		String Avo = adminService.loginCheck(avo);

		// 로그인 성공
		if (Avo != null) {
			session.setAttribute("avo", avo.getAdmin_id());
			mav.setViewName("/admin/adminmain"); // 관리자 페이지 이동
			mav.addObject("msg", "success");
			// 로그인 실패
		} else {
			mav.setViewName("redirect:/"); // 로그인 페이지 이동
			mav.addObject("msg", "failure");
		}
		return mav;
	}

}
