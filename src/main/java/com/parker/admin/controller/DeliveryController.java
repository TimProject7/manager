package com.parker.admin.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.service.DeliveryService;
import com.parker.admin.vo.DeliveryVO;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {
	Logger logger = Logger.getLogger(DeliveryController.class);
	@Autowired
	DeliveryService deliveryService;

	@RequestMapping("/deliverylist")
	public ModelAndView deliveryList(ModelAndView mav) {
		logger.info("deliverlist 호출 성공");
		List<DeliveryVO> deliveryList = deliveryService.deliveryList();
		mav.addObject("deliveryList", deliveryList);
		mav.setViewName("delivery/deliverylist");
		return mav;
	}

	@RequestMapping("/deliverydetail/{delivery_number}")
	public ModelAndView deliveryList(ModelAndView mav, @PathVariable("delivery_number") int delivery_number) {
		logger.info("deliverDetail 호출 성공");
		mav.addObject("deliveryDetail", deliveryService.deliveryDetail(delivery_number));
		mav.setViewName("delivery/deliverydetail");
		return mav;
	}
}