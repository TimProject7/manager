package com.parker.admin.service;

import java.util.List;
import javax.servlet.http.HttpSession;

import com.parker.admin.vo.NoticeVO;

public interface NoticeService {

	// 01. 게시글 작성
	public void create(NoticeVO No) throws Exception;

	// 02. 게시글 상세보기
	public NoticeVO read(int notice_no) throws Exception;

	// 03. 게시글 수정
	public void update(NoticeVO No) throws Exception;

	// 04. 게시글 삭제
	public void delete(int notice_no) throws Exception;

	// 05. 게시글 전체 목록
	public List<NoticeVO> listAll(NoticeVO nvo) throws Exception;

	// 06. 게시글 조회
	public void increaseViewcnt(int notice_no, HttpSession session) throws Exception;

	// 07. 게시글 갯수
	public int noticeListCnt(NoticeVO nvo);

}
