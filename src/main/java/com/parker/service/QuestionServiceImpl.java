package com.parker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.dao.QuestionDao;
import com.parker.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	@Override
	public List<QuestionVO> questionList() {
		// TODO Auto-generated method stub
		return questionDao.questionList();
	}

}