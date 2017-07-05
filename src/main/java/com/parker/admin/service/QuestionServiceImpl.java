package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.QuestionDao;
import com.parker.admin.vo.QuestionVO;
import com.parker.admin.vo.UserVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		// TODO Auto-generated method stub
		return questionDao.questionList(qvo);
	}

	@Override
	public QuestionVO questionDetail(int question_number) {
		// TODO Auto-generated method stub
		return questionDao.questionDetail(question_number);
	}

	@Override
	public UserVO questionUserInfo(int usernumber) {
		// TODO Auto-generated method stub
		return questionDao.userInfo(usernumber);
	}

	@Override
	public int questionListCnt(QuestionVO qvo) {
		// TODO Auto-generated method stub
		return questionDao.questionListCnt(qvo);
	}

}