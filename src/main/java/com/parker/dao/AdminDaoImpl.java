package com.parker.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.vo.AdminVO;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession session;

	@Override
	public int selectLogin(AdminVO avo) {
		// TODO Auto-generated method stub

		return (Integer) session.selectOne("selectLogin", avo);
	}

}
