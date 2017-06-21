package com.parker.service;

import java.util.List;

import com.parker.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> listProduct();

	public ProductVO detailProduct(int product_number);

	public void insertProduct(ProductVO pvo);

	public int deleteProduct(int product_number);

	public int updateProduct(ProductVO pvo);

}
