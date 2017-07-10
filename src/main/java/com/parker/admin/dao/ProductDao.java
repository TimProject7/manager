package com.parker.admin.dao;

import java.util.List;

import com.parker.admin.vo.ProductQnaReplyVO;
import com.parker.admin.vo.ProductQnaVO;
import com.parker.admin.vo.ProductVO;

public interface ProductDao {

	public List<ProductVO> listProduct(ProductVO pvo);

	public ProductVO detailProduct(int product_number);

	public void insertProduct(ProductVO pvo);

	public int salesProduct(int product_number);

	public int salesStopProduct(int product_number);

	public int updateProduct(ProductVO pvo);

	public int productName(ProductVO pvo);

	public int nameChkProduct(ProductVO pvo);

	public int listProductCnt(ProductVO pvo);

	public ProductVO editProduct(int product_number);

	public List<ProductQnaVO> listProductQna(int product_number);

	public ProductQnaVO qnaDetailProduct(int productQna_number);

	public ProductQnaReplyVO qnaReplyProduct(int productQna_number);

	public int productQnaReplyInsert(ProductQnaReplyVO pqrvo);

	public int productQnaStatusUpdate(ProductQnaReplyVO pqrvo);

}
