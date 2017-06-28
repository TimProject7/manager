package com.parker.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.vo.QuestionReplyVO;

@Repository
public class QuestionReplyDaoImpe implements QuestionReplyDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int questionReply(QuestionReplyVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("questionReply", qvo);
	}

}
