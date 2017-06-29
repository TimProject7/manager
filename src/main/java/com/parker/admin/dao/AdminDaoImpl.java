package com.parker.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.AdminVO;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession Session;

	// 관리자 로그인체크
	@Override
	public AdminVO loginCheck(AdminVO avo) {
		return Session.selectOne("loginCheck", avo);
	}

}
