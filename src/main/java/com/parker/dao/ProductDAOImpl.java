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

	// 02. 상품상세
	@Override
	public ProductVO detailProduct(int product_number) {
		return sqlSession.selectOne("detailProduct", product_number);
	}

}
