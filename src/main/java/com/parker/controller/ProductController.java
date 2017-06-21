package com.parker.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.parker.service.ProductService;
import com.parker.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	// 1. 상품 목록보기
	@RequestMapping("/productlist")
	public ModelAndView productList(ModelAndView mav) {
		logger.info("productList 호출 성공");

		List<ProductVO> productList = productService.listProduct();
		mav.addObject("productList", productList);
		mav.setViewName("/product/productlist");

		return mav;
	}

	// 2. 상품 상세보기

	@RequestMapping("/productdetail/{product_number}")
	public ModelAndView productDetail(@PathVariable("product_number") int product_number, ModelAndView mav) {
		logger.info("productDetail 호출 성공");
		mav.setViewName("/product/productdetail");
		mav.addObject("productDetail", productService.detailProduct(product_number));
		return mav;
	}

	// 3. 상품 등록
	@RequestMapping("/productwrite")
	public String write() {
		return "/product/productwrite";
	}

	@RequestMapping("/productinsert")
	public String productInsert(@ModelAttribute ProductVO pvo, @RequestParam("product_photo") MultipartFile file,
			HttpServletRequest request, Model model) {
		logger.info("productinsert 호출 성공");
		String filename = "";

		if (!pvo.getProduct_photo().isEmpty()) {
			filename = file.getOriginalFilename();
			System.out.println("sys :" + filename);

			String path = "D:\\sts\\github\\manager\\src\\main\\webapp\\resources\\images\\";

			/* String path = "C:\\Temp\\"; */
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

	@RequestMapping("/productdelete")
	public String productDelete(@RequestParam int product_number) {
		productService.deleteProduct(product_number);
		int result = 0;
		result = productService.deleteProduct(product_number);
		if (result != 0) {
			System.out.println("상품 상태값 N으로 변경 성공");
		} else {
			System.out.println("상품 상태 변경 실패");
		}
		return "redirect:/product/productlist";

	}

	@RequestMapping("/productedit")
	public String productEdit(@ModelAttribute ProductVO pvo) {

		String filename = "";

		if (!pvo.getProduct_image().isEmpty()) {
			filename = pvo.getProduct_photo().getOriginalFilename();

			String path = "D:\\sts\\github\\manager\\src\\main\\webapp\\resources\\images\\";
			try {
				new File(path).mkdirs();
				pvo.getProduct_photo().transferTo(new File(path + filename));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			pvo.setProduct_image(filename);
		} else {
			ProductVO pvo2 = productService.detailProduct(pvo.getProduct_number());
			pvo.setProduct_image(pvo2.getProduct_image());
		}
		productService.updateProduct(pvo);
		return "redirect:/product/productlist";

	}
}
