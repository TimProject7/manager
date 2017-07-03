package com.parker.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.ProductVO;
import com.parker.admin.vo.QuestionVO;
import com.parker.admin.vo.UserVO;

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
	public UserVO userInfo(int usernumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfo",usernumber);
	}


}
