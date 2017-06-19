package com.parker.service;

import java.util.List;

import com.parker.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> listProduct();

	public ProductVO detailProduct(int productId);

}
