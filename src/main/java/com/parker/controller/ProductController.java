package com.parker.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parker.paging.ProductPaging;
import com.parker.paging.Util;
import com.parker.service.ProductService;
import com.parker.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		logger.info("productList 호출 성공");

		// 정렬에 대한 기본값 설정
		if (pvo.getOrder_by() == null) {
			pvo.setOrder_by("product_number");
		}
		if (pvo.getOrder_sc() == null) {
			pvo.setOrder_sc("DESC");
		}
		// 정렬에 대한 데이터 확인
		logger.info("order_by = " + pvo.getOrder_by());
		logger.info("order_sc = " + pvo.getOrder_sc());

		// 검색에 대한 데이터 확인
		logger.info("search = " + pvo.getSearch());
		logger.info("keyword = " + pvo.getKeyword());

		// 페이징 세팅
		ProductPaging.set(pvo);

		// 전체 레코드 수 구하기
		int total = productService.productListCnt(pvo);
		logger.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());

		List<ProductVO> productList = productService.productList(pvo);

		model.addAttribute("productList", productList);
		model.addAttribute("count",count);
		model.addAttribute("productData",pvo);
		model.addAttribute("total",total);

		return null;

	}

}
