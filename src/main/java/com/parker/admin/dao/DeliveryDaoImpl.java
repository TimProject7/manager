package com.parker.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.DeliveryVO;

@Repository
public class DeliveryDaoImpl implements DeliveryDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DeliveryVO> deliveryList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("deliveryList");
	}

	@Override
	public DeliveryVO deliveryDetail(int delivery_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("deliveryDetail", delivery_number);
	}

}
