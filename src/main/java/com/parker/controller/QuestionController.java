package com.parker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.parker.service.QuestionService;
import com.parker.vo.QuestionVO;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@RequestMapping("/questionlist")
	public ModelAndView questionList(ModelAndView mav) {
		List<QuestionVO> questionList = questionService.questionList();
		mav.addObject("questionList", questionList);
		mav.setViewName("/question/questionlist");

		return mav;

	}

	@RequestMapping("/questiondetail/{question_number}")
	public ModelAndView questionDetail(ModelAndView mav, @PathVariable("question_number") int question_number,
			@RequestParam int user_number) {
		mav.addObject("questionDetail", questionService.questionDetail(question_number));
		mav.addObject("userInfo", questionService.questionUserInfo(user_number));
		mav.setViewName("/question/questiondetail");

		return mav;

	}
}
