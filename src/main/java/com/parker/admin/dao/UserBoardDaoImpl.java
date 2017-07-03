package com.parker.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.UserBoardVO;

@Repository
public class UserBoardDaoImpl implements UserBoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserBoardVO> userBoardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userBoardList");
	}

}
