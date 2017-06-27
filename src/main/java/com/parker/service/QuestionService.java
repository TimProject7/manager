package com.parker.service;

import java.util.List;

import com.parker.vo.QuestionVO;
import com.parker.vo.UserVO;

public interface QuestionService {

	public List<QuestionVO> questionList();

	public QuestionVO questionDetail(int question_number);

	public UserVO questionUserInfo(int user_number);

}
