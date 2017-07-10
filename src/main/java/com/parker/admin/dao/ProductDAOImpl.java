package com.parker.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.ProductQnaReplyVO;
import com.parker.admin.vo.ProductQnaVO;
import com.parker.admin.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDao {

	@Autowired
	SqlSession sqlSession;

	// 01. 상품목록
	@Override
	public List<ProductVO> listProduct(ProductVO pvo) {
		return sqlSession.selectList("listProduct", pvo);
	}

	@Override
	public ProductVO detailProduct(int product_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("detailProduct", product_number);
	}

	@Override
	public void insertProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		sqlSession.insert("insertProduct", pvo);
	}

	@Override
	public int salesProduct(int product_number) {
		// TODO Auto-generated method stub
		return sqlSession.update("salesProduct", product_number);
	}

	@Override
	public int salesStopProduct(int product_number) {
		// TODO Auto-generated method stub
		return sqlSession.update("salesStopProduct", product_number);
	}

	@Override
	public int updateProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("updateProduct", pvo);
	}

	@Override
	public int productName(ProductVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productName", pvo);
	}

	@Override
	public int nameChkProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("productNameChk", pvo);

	}

	@Override
	public int listProductCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("listProductCnt", pvo);
	}

	@Override
	public ProductVO editProduct(int product_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("editProduct", product_number);
	}

	@Override
	public List<ProductQnaVO> listProductQna(int product_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("listProductQna", product_number);
	}

	@Override
	public ProductQnaVO qnaDetailProduct(int productQna_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaDetailProduct", productQna_number);
	}

	@Override
	public ProductQnaReplyVO qnaReplyProduct(int productQna_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaReplyProduct", productQna_number);
	}

	@Override
	public int productQnaReplyInsert(ProductQnaReplyVO pqrvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaReplyInsertProduct", pqrvo);
	}

	@Override
	public int productQnaStatusUpdate(ProductQnaReplyVO pqrvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("productQnaStatusUpdate", pqrvo);
	}

}
