package com.parker.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	// 1. 상품 전체 목록
	@RequestMapping("/productlist")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/product/productList");
		mav.addObject("list", productService.listProduct());
		return mav;
	}

	// 2. 상품 상세보기
	@RequestMapping("/productdetail/{product_number}")
	public ModelAndView detail(@PathVariable("productId") int product_number, ModelAndView mav) {
		mav.setViewName("/shop/productDetail");
		mav.addObject("pvo", productService.detailProduct(product_number));
		return mav;
	}

}
