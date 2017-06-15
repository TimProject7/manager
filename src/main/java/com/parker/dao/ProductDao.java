package com.parker.dao;

import java.util.List;

import com.parker.vo.ProductVO;

public interface ProductDao {

	public List<ProductVO> listProduct();

	public ProductVO detailProduct(int product_number);


}
