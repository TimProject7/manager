package com.parker.dao;

import java.util.List;

import com.parker.vo.QuestionVO;
import com.parker.vo.UserVO;

public interface QuestionDao {

	public List<QuestionVO> questionList();

	public QuestionVO questionDetail(int question_number);

	public UserVO userInfo(int user_number);

}
