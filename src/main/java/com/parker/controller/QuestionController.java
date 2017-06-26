package com.parker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parker.service.QuestionService;
import com.parker.vo.QuestionVO;
import com.parker.vo.UserVO;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@RequestMapping("/questionlist")
	public ModelAndView questionList(ModelAndView mav) {
		List<QuestionVO> questionList = questionService.questionList();
		mav.addObject("questionList", questionList);
		mav.setViewName("/user/userlist");

		return mav;

	}
}
