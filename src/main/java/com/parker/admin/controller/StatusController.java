package com.parker.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.service.StatusService;
import com.parker.admin.vo.DeliveryVO;

@Controller
@RequestMapping("/status")
public class StatusController {

	@Autowired
	StatusService statusService;

	@RequestMapping("/salesstatus")
	public ModelAndView salesStatus(ModelAndView mav) {
		List<DeliveryVO> salesStatus = statusService.salesStatus();
		mav.addObject("salesStatus", salesStatus);

		return mav;
	}
}
