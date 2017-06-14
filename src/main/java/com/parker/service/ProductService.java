package com.parker.service;

import java.util.List;

import com.parker.vo.ProductVO;

public interface ProductService {

	public int productListCnt(ProductVO pvo);

	public List<ProductVO> productList(ProductVO pvo);

}
