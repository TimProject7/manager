package com.parker.admin.service;

import java.util.List;

import com.parker.admin.vo.QuestionVO;
import com.parker.admin.vo.UserVO;

public interface QuestionService {

	public List<QuestionVO> questionList();

	public QuestionVO questionDetail(int question_number);

	public UserVO questionUserInfo(int user_number);

	public int questionReply(int question_number);

}
