package com.parker.admin.service;

import com.parker.admin.vo.QuestionReplyVO;

public interface QuestionReplyService {

	public int questionReply(QuestionReplyVO qvo);

	public int questionUpdate(QuestionReplyVO qvo);

	public QuestionReplyVO questionReplyDetail(int question_number);

}
