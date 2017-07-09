package com.parker.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.DeliveryVO;

@Repository
public class StatusDaoImpl implements StatusDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<DeliveryVO> salesStatus() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("salesStatus");
	}

}
