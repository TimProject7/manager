package com.parker.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDao {

	@Autowired
	SqlSession sqlSession;

	// 01. 상품목록
	@Override
	public List<ProductVO> listProduct() {
		return sqlSession.selectList("listProduct");
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
	public void deleteProduct(int product_number) {
		// TODO Auto-generated method stub
		sqlSession.delete("deleteProduct", product_number);
	}

}
