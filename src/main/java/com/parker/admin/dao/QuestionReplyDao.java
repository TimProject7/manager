package com.parker.admin.dao;

import com.parker.admin.vo.QuestionReplyVO;

public interface QuestionReplyDao {

	public int questionReply(QuestionReplyVO qvo);

	public int questionUpdate(QuestionReplyVO qvo);

	public QuestionReplyVO questionReplyDetail(int question_number);

}
