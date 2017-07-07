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
	public DeliveryVO deliveryDetail(int delivery_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("deliveryDetail", delivery_number);
	}

	@Override
	public int deliveryListCnt(DeliveryVO dvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("deliveryListCnt", dvo);
	}

	@Override
	public List<DeliveryVO> deliveryList(DeliveryVO dvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("deliveryList", dvo);
	}

	@Override
	public int deliveryDelete(int buynumber) {
		// TODO Auto-generated method stub
		return sqlSession.delete("deliveryDelete", buynumber);
	}

}
