package com.parker.admin.dao;

import java.util.List;

import com.parker.admin.vo.QuestionVO;
import com.parker.admin.vo.UserVO;

public interface QuestionDao {

	public List<QuestionVO> questionList();

	public QuestionVO questionDetail(int question_number);

	public UserVO userInfo(int user_number);

	
}
