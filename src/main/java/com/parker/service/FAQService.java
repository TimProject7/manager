package com.parker.service;

import java.util.List;
import javax.servlet.http.HttpSession;

import com.parker.vo.FAQVO;

public interface FAQService {

	// 01. 게시글 작성
    public void create(FAQVO fo) throws Exception;
    // 02. 게시글 상세보기
    public FAQVO read(int faq_no) throws Exception;
    // 03. 게시글 수정
    public void update(FAQVO fo) throws Exception;
    // 04. 게시글 삭제
    public void delete(int faq_no) throws Exception;
    // 05. 게시글 전체 목록
    public List<FAQVO> listAll() throws Exception;
    // 06. 게시글 조회
    public void increaseViewcnt(int faq_no, HttpSession session) throws Exception;
	
}
