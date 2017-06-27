package com.parker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.dao.QuestionDao;
import com.parker.vo.QuestionVO;
import com.parker.vo.UserVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	@Override
	public List<QuestionVO> questionList() {
		// TODO Auto-generated method stub
		return questionDao.questionList();
	}

	@Override
	public QuestionVO questionDetail(int question_number) {
		// TODO Auto-generated method stub
		return questionDao.questionDetail(question_number);
	}

	@Override
	public UserVO questionUserInfo(int user_number) {
		// TODO Auto-generated method stub
		return questionDao.userInfo(user_number);
	}

}