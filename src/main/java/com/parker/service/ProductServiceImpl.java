package com.parker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.dao.ProductDao;
import com.parker.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;

	// 01. 상품목록
	@Override
	public List<ProductVO> listProduct() {
		return productDao.listProduct();
	}

	// 02. 상품상세
	@Override
	public ProductVO detailProduct(int product_number) {
		return productDao.detailProduct(product_number);
	}

	

}