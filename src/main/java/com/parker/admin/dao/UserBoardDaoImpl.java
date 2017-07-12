package com.parker.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.UserBoardReplyVO;
import com.parker.admin.vo.UserBoardVO;

@Repository
public class UserBoardDaoImpl implements UserBoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserBoardVO> userBoardList(UserBoardVO ubvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userBoardList", ubvo);
	}

	@Override
	public int userBoardListCnt(UserBoardVO ubvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userBoardListCnt", ubvo);
	}

	@Override
	public UserBoardVO userBoardDetail(int userboard_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userBoardDetail", userboard_number);
	}

	@Override
	public UserBoardReplyVO userBoardReply(int userboard_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userBoardReply", userboard_number);
	}

	@Override
	public int userBoardDelete(int userboard_number) {
		// TODO Auto-generated method stub
		return sqlSession.update("userBoardDelete", userboard_number);
	}

}
