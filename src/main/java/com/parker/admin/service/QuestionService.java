package com.parker.admin.service;

import java.util.List;

import com.parker.admin.vo.QuestionVO;
import com.parker.admin.vo.UserVO;

public interface QuestionService {

	public List<QuestionVO> questionList(QuestionVO qvo);

	public QuestionVO questionDetail(int question_number);

	public UserVO questionUserInfo(int usernumber);

	public int questionListCnt(QuestionVO qvo);

}
