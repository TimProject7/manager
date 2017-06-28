package com.parker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.dao.QuestionReplyDao;
import com.parker.vo.QuestionReplyVO;

@Service
public class QuestionReplyServiceImpl implements QuestionReplyService {

	@Autowired
	QuestionReplyDao questionReplyDao;

	@Override
	public int questionReply(QuestionReplyVO qvo) {
		return questionReplyDao.questionReply(qvo);

	}

}
