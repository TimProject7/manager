package com.parker.admin.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.parker.admin.paging.Paging;
import com.parker.admin.paging.Util;
import com.parker.admin.service.ProductService;
import com.parker.admin.vo.ProductQnaReplyVO;
import com.parker.admin.vo.ProductQnaVO;
import com.parker.admin.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	// 1. 상품 목록보기
	@RequestMapping("/productlist")
	public ModelAndView productList(ModelAndView mav, ProductVO pvo, HttpServletRequest request) {
		logger.info("productList 호출 성공");
		Paging.set(pvo);
		List<ProductVO> productList = productService.listProduct(pvo);
		int total = productService.productListCnt(pvo);
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		mav.addObject("count", count);
		mav.addObject("data", pvo);
		mav.addObject("total", total);

		mav.addObject("productList", productList);
		mav.setViewName("product/productlist");

		return mav;
	}

	// 2. 상품 상세보기
	@RequestMapping("/productdetail/{product_number}")
	public ModelAndView productDetail(@PathVariable int product_number, ModelAndView mav, RedirectAttributes red) {
		logger.info("productDetail 호출 성공");
		List<ProductQnaVO> productQnaList = productService.listProductQna(product_number);
		mav.setViewName("product/productdetail");
		mav.addObject("ProductQnaList", productQnaList);
		mav.addObject("productDetail", productService.detailProduct(product_number));
		return mav;
	}

	// 3. 상품 등록
	@RequestMapping("/productwrite")
	public String write() {
		return "product/productwrite";
	}

	// 4. 상품 이름 중복 검색용(ajax return 용)
	@RequestMapping(value = "/productNameChk", method = RequestMethod.POST)
	public String productNameChk(@ModelAttribute ProductVO pvo, Model model) {
		logger.info("productNameChk 호출 성공");

		int result;
		result = productService.nameChkProduct(pvo);
		model.addAttribute("result", result);
		return "product/productNameChk";
	}

	// 5. 상품 등록
	@RequestMapping("/productinsert")
	public String productInsert(@ModelAttribute ProductVO pvo, @RequestParam("product_photo") MultipartFile file,
			HttpServletRequest request) {
		logger.info("productinsert 호출 성공");
		String filename = "";
		if (!pvo.getProduct_photo().isEmpty()) {
			filename = file.getOriginalFilename();

			String path = request.getSession().getServletContext().getRealPath("/resources/images/");
			try {
				new File(path).mkdirs();
				pvo.getProduct_photo().transferTo(new File(path + filename));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			pvo.setProduct_image(filename);
			productService.insertProduct(pvo);
		}

		return "redirect:/product/productlist";

	}

	// 6. 상품 판매 & 판매중지
	@RequestMapping("/productsalesmanagement")
	public String productDelete(@RequestParam int product_number, @RequestParam String product_status) {
		int result = 0;
		if (product_status.equals("N")) {
			System.out.println("상품 판매");
			result = productService.salesProduct(product_number);
			if (result != 0) {

				System.out.println("상품 상태값 Y으로 변경 성공");
			} else {
				System.out.println("상품 상태 변경 실패");
			}
			return "redirect:/product/productlist";
		} else if (product_status.equals("Y")) {
			System.out.println("상품 판매중지");
			result = productService.salesStopProduct(product_number);
			if (result != 0) {
				System.out.println("상품 상태값 N으로 변경 성공");
			} else {
				System.out.println("상품 상태 변경 실패");
			}
			return "redirect:/product/productlist";
		} else {
			return "redirect:/product/productlist";

		}
	}

	@RequestMapping("/productQnaDetail/{productQna_number}")
	public ModelAndView productQnaDetail(ModelAndView mav, @PathVariable int productQna_number) {
		mav.addObject("productQnaDetail", productService.qnaDetailProduct(productQna_number));
		mav.addObject("productQnaReplyDetail", productService.qnaReplyProduct(productQna_number));
		mav.setViewName("product/productQnaDetail");

		return mav;
	}

	@RequestMapping("/productqnareply")
	public String productQnaReplyInsert(@ModelAttribute ProductQnaReplyVO pqrvo, RedirectAttributes red) {
		int result = 0;
		result = productService.productQnaReplyInsert(pqrvo);
		System.out.println("asdasdasdasd" + pqrvo.getProduct_number());
		if (result != 0) {
			System.out.println("성공!!");
			productService.productQnaStatusUpdate(pqrvo);
			return "redirect:/product/productdetail/" + pqrvo.getProduct_number();
		} else {
			return "redirect:/product/productdetail/" + pqrvo.getProduct_number();
		}

	}

	/*
	 * @RequestMapping("/productedit/{product_number}") public ModelAndView
	 * productEdit(@PathVariable int product_number, ModelAndView mav) {
	 * logger.info("productEdit 호출 성공"); mav.addObject("productEdit",
	 * productService.productEdit(product_number));
	 * mav.setViewName("product/productedit"); return mav; }
	 * 
	 * @RequestMapping("/productreg") public String productReg(@ModelAttribute
	 * ProductVO pvo1, @RequestParam("product_photo") MultipartFile file,
	 * HttpServletRequest request) { logger.info("productReg 호출 성공"); String
	 * filename = ""; System.out.println("asdasdasd : " +
	 * pvo1.getProduct_image()); try { if (!pvo1.getProduct_image().isEmpty()) {
	 * filename = pvo1.getProduct_photo().getOriginalFilename(); String path =
	 * request.getSession().getServletContext().getRealPath("/resources/images/"
	 * ); try { new File(path).mkdirs(); pvo1.getProduct_photo().transferTo(new
	 * File(path + filename)); } catch (Exception e) { // TODO: handle exception
	 * e.printStackTrace(); } pvo1.setProduct_image(filename); } else {
	 * ProductVO pvo2 = productService.detailProduct(pvo1.getProduct_number());
	 * pvo1.setProduct_image(pvo2.getProduct_image()); } } catch (Exception e) {
	 * // TODO: handle exception e.printStackTrace(); ProductVO pvo2 =
	 * productService.detailProduct(pvo1.getProduct_number());
	 * pvo1.setProduct_image(pvo2.getProduct_image());
	 * System.out.println("아아 에러다"); } productService.updateProduct(pvo1);
	 * return "redirect:product/productlist";
	 * 
	 * }
	 */
}
