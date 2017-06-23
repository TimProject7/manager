package com.parker.dao;

import java.util.List;

import com.parker.vo.ProductVO;

public interface ProductDao {

	public List<ProductVO> listProduct();

	public ProductVO detailProduct(int product_number);

	public void insertProduct(ProductVO pvo);

	public int salesProduct(int product_number);

	public int salesStopProduct(int product_number);

	public int updateProduct(ProductVO pvo);

	public int productName(ProductVO pvo);

	public int nameChkProduct(ProductVO pvo);

}
