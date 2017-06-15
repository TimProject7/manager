package com.parker.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.service.ProductService;
import com.parker.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	// 1. 상품 전체 목록
	@RequestMapping("/productlist")
	public ModelAndView productList(ModelAndView mav) {
		logger.info("productList 호출 성공");

		List<ProductVO> productList = productService.listProduct();
		mav.setViewName("/product/productlist");
		mav.addObject("productList", productList);

		return mav;
	}

	/*
	 * @RequestMapping(value = "/productlist", method = RequestMethod.GET)
	 * public String productList() {
	 * 
	 * return "product/productlist"; }
	 */

	// 2. 상품 상세보기
	@RequestMapping("/productdetail/{product_number}")
	public ModelAndView productDetail(@PathVariable("product_number") int product_number, ModelAndView mav) {
		logger.info("productDetail 호출 성공");
		mav.setViewName("/product/productDetail");
		mav.addObject("productDetail", productService.detailProduct(product_number));
		return mav;
	}

}
