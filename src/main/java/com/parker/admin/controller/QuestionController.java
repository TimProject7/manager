package com.parker.admin.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.paging.Paging;
import com.parker.admin.paging.Util;
import com.parker.admin.service.QuestionReplyService;
import com.parker.admin.service.QuestionService;
import com.parker.admin.vo.QuestionReplyVO;
import com.parker.admin.vo.QuestionVO;

@Controller
@RequestMapping("/question")
public class QuestionController {

	Logger logger = Logger.getLogger(QuestionController.class);

	@Autowired
	QuestionService questionService;

	@Autowired
	QuestionReplyService questionReplyService;

	@RequestMapping("/questionlist")
	public ModelAndView questionList(ModelAndView mav, QuestionVO qvo) {
		logger.info("1:1문의 리스트 호출 성공");
		Paging.set(qvo);
		List<QuestionVO> questionList = questionService.questionList(qvo);
		int total = questionService.questionListCnt(qvo);
		int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());
		mav.addObject("count", count);
		mav.addObject("data", qvo);
		mav.addObject("total", total);
		mav.addObject("questionList", questionList);
		mav.setViewName("/question/questionlist");

		return mav;

	}

	@RequestMapping("/questiondetail/{question_number}")
	public ModelAndView questionDetail(ModelAndView mav, @PathVariable("question_number") int question_number,
			@RequestParam int usernumber) {
		logger.info("1:1문의 상세 호출 성공");

		mav.addObject("questionDetail", questionService.questionDetail(question_number));
		mav.addObject("userInfo", questionService.questionUserInfo(usernumber));
		System.out.println(usernumber);
		mav.addObject("questionReplyDetail", questionReplyService.questionReplyDetail(question_number));
		mav.setViewName("question/questiondetail");

		return mav;

	}

	@RequestMapping("/questionreply")
	public String questionReply(@ModelAttribute QuestionReplyVO qvo, Model model,
			@RequestParam("questionReply_photo") MultipartFile file, HttpServletRequest request) {
		logger.info("1:1문의 답변 호출 성공");
		String filename = "";
		int result = 0;
		if (!qvo.getQuestionReply_photo().isEmpty()) {
			filename = file.getOriginalFilename();

			String path = request.getSession().getServletContext().getRealPath("/resources/images/");
			try {
				new File(path).mkdirs();
				qvo.getQuestionReply_photo().transferTo(new File(path + filename));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			qvo.setQuestionReply_image(filename);
			result = questionReplyService.questionReply(qvo);
			System.out.println("questionReply1 : " + result);
			if (result == 1) {
				System.out.println("questionReply2 : " + result);
				result = questionReplyService.questionUpdate(qvo);
				if (result == 1) {
					System.out.println("questionReply3 : " + result);
					model.addAttribute("msg", true);
				}
			} else {
				model.addAttribute("msg", false);
			}

		}
		return "redirect:/question/questionlist";
	}
}
