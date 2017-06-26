package com.parker.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.vo.ProductVO;
import com.parker.vo.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userList");
	}

	@Override
	public UserVO userDetail(int user_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userDetail", user_number);
	}

	@Override
	public int userRestoration(int user_number) {
		// TODO Auto-generated method stub
		return sqlSession.update("userRestoration",user_number);
	}

	@Override
	public int userDropOut(int user_number) {
		// TODO Auto-generated method stub
		return  sqlSession.update("userDropOut",user_number);
	}

}