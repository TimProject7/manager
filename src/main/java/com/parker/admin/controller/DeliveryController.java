package com.parker.admin.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.parker.admin.paging.Paging;
import com.parker.admin.paging.Util;
import com.parker.admin.service.DeliveryService;
import com.parker.admin.vo.DeliveryVO;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {
	Logger logger = Logger.getLogger(DeliveryController.class);
	@Autowired
	DeliveryService deliveryService;

	@RequestMapping("/deliverylist")
	public ModelAndView deliveryList(ModelAndView mav, @ModelAttribute DeliveryVO dvo) {
		logger.info("deliverlist 호출 성공");
		Paging.set(dvo);
		int total = deliveryService.deliveryListCnt(dvo);

		int count = total - (Util.nvl(dvo.getPage()) - 1) * Util.nvl(dvo.getPageSize());
		List<DeliveryVO> deliveryList = deliveryService.deliveryList(dvo);
		mav.addObject("count", count);
		mav.addObject("deliveryList", deliveryList);
		mav.addObject("data", dvo);
		mav.addObject("total", total);
		mav.setViewName("delivery/deliverylist");

		return mav;
	}

	// 여러개 삭제
	@RequestMapping(value = "/deliverydelete", method = RequestMethod.POST)
	public String deliveryDeletePOST(@RequestParam("chk") int[] buy_number, Model model) {
		logger.info("deliverydelete 호출 성공");

		int result = 0;

		for (int buynumber : buy_number) {
			result = deliveryService.deliveryDelete(buynumber);

			if (result == 0) {
				model.addAttribute("result", result);
				return "delivery/deliveryenter";
			}

		}
		if (result != 0) {
			model.addAttribute("result", result);
			System.out.println("좋아~ 지워지고있어~ 굿~");
			return "delivery/deliveryenter";
		}

		return "delivery/deliveryenter";
	}

	// 여러개 배송
	@RequestMapping(value = "/delivery", method = RequestMethod.POST)
	public String delivery(@RequestParam("chk") int[] buy_number, Model model) {
		logger.info("delivery 호출 성공");

		int result = 0;

		for (int buynumber : buy_number) {
			result = deliveryService.delivery(buynumber);

			if (result == 0) {
				model.addAttribute("result", result);
				return "delivery/deliveryenter";
			}

		}
		if (result != 0) {
			model.addAttribute("result", result);
			return "delivery/deliveryenter";
		}

		return "redirect:delivery/deliverylist";
	}

}
