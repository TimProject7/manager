package com.parker.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.vo.ProductVO;
import com.parker.vo.QuestionVO;
import com.parker.vo.UserVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<QuestionVO> questionList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("questionList");
	}

	@Override
	public QuestionVO questionDetail(int question_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("questionDetail", question_number);
	}

	@Override
	public UserVO userInfo(int user_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfo",user_number);
	}

	@Override
	public int questionReply(int question_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("questionReplySuccess",question_number);
	}

}
