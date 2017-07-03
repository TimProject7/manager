package com.parker.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.QuestionReplyVO;

@Repository
public class QuestionReplyDaoImpe implements QuestionReplyDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int questionReply(QuestionReplyVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("questionReply", qvo);
	}

	@Override
	public int questionUpdate(QuestionReplyVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("questionUpdate", qvo);
	}

	@Override
	public QuestionReplyVO questionReplyDetail(int question_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("questionReplyDetail", question_number);
	}

}
