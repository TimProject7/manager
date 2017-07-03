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

import com.parker.admin.service.NoticeService;
import com.parker.admin.vo.NoticeVO;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {

	// 의존관계 주입 => BoardServiceImpl 생성
	// IoC 의존관계 역전
	@Inject
	NoticeService noticeService;
	Logger logger = Logger.getLogger(NoticeController.class);

	// 01. 게시글 목록
	@RequestMapping("/noticelist")
	public ModelAndView list() throws Exception {
		logger.info("Notice 리스트 호출 성공");
		List<NoticeVO> list = noticeService.listAll();
		System.out.println(list.toString());
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/noticelist"); // 뷰를 list.jsp로 설정
		mav.addObject("noticelist", list); // 데이터를 저장

		return mav; // list.jsp로 List가 전달된다.
	}

	// 02_01. 게시글 작성화면
	// @RequestMapping("board/write.do")
	// value="", method="전송방식"
	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public String write() {
		return "notice/noticewrite"; // write.jsp로 이동
	}

	// 02_02. 게시글 작성처리
	@RequestMapping(value = "/noticeinsert", method = RequestMethod.POST)
	public String insertNotice(@ModelAttribute NoticeVO No) throws Exception {
		logger.info("Notice 00호출 성공");
		noticeService.create(No);
		return "redirect:noticelist";
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션객체
	@RequestMapping(value = "/noticeview", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int notice_no, HttpSession session) throws Exception {
		// 조회수 증가 처리
		noticeService.increaseViewcnt(notice_no, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/notice/noticeview");
		// 뷰에 전달할 데이터
		mav.addObject("dto", noticeService.read(notice_no));
		return mav;

	}

	// 04. 게시글 수정
	// 폼에서 입력한 내용들은 @ModelAttribute BoardVO vo로 전달됨
	@RequestMapping(value = "/noticeupdate", method = RequestMethod.POST)
	public String update(@ModelAttribute NoticeVO No) throws Exception {
		noticeService.update(No);
		return "redirect:noticelist";
	}

	// 05. 게시글 삭제
	@RequestMapping("/noticedelete")
	public String delete(@RequestParam int notice_no) throws Exception {
		noticeService.delete(notice_no);
		return "redirect:noticelist";
	}

}
