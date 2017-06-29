package com.parker.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.parker.admin.service.FAQService;
import com.parker.admin.vo.FAQVO;

@Controller
@RequestMapping("/faq/*")
public class FAQController {

	// 의존관계 주입 => BoardServiceImpl 생성
	// IoC 의존관계 역전
	@Inject
	FAQService faqService;
	Logger logger = Logger.getLogger(FAQController.class);

	// 01. 게시글 목록
	@RequestMapping("/FAQ_list")
	public ModelAndView list() throws Exception {
		logger.info("FAQ 리스트 호출 성공");
		List<FAQVO> list = faqService.listAll();
		System.out.println(list.toString());
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/FAQlist"); // 뷰를 list.jsp로 설정
		mav.addObject("faq_list", list); // 데이터를 저장

		return mav; // list.jsp로 List가 전달된다.
	}

	// 02_01. 게시글 작성화면
	// @RequestMapping("board/write.do")
	// value="", method="전송방식"
	@RequestMapping(value = "FAQ_write", method = RequestMethod.GET)
	public String write() {
		return "faq/FAQ_write"; // write.jsp로 이동
	}

	// 02_02. 게시글 작성처리
	@RequestMapping(value = "FAQ_insert", method = RequestMethod.POST)
	public String insertFAQ(@ModelAttribute FAQVO vo) throws Exception {
		faqService.create(vo);
		return "redirect:FAQ_list";
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션객체
	@RequestMapping(value = "FAQ_view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int faq_no, HttpSession session) throws Exception {
		// 조회수 증가 처리
		faqService.increaseViewcnt(faq_no, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("faq/FAQview");
		// 뷰에 전달할 데이터
		mav.addObject("dto", faqService.read(faq_no));
		return mav;

	}

	// 04. 게시글 수정
	// 폼에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
	@RequestMapping(value = "FAQ_update", method = RequestMethod.POST)
	public String update(@ModelAttribute FAQVO vo) throws Exception {
		faqService.update(vo);
		return "redirect:FAQlist";
	}

	// 05. 게시글 삭제
	@RequestMapping("FAQ_delete")
	public String delete(@RequestParam int faq_no) throws Exception {
		faqService.delete(faq_no);
		return "redirect:FAQlist";
	}

}
