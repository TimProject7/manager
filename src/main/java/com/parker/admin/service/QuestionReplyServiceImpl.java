package com.parker.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.QuestionReplyDao;
import com.parker.admin.vo.QuestionReplyVO;

@Service
public class QuestionReplyServiceImpl implements QuestionReplyService {

	@Autowired
	QuestionReplyDao questionReplyDao;

	@Override
	public int questionReply(QuestionReplyVO qvo) {
		return questionReplyDao.questionReply(qvo);

	}

}
