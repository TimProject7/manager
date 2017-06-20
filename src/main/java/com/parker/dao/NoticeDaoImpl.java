package com.parker.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.parker.vo.NoticeVO;

@Repository
@Transactional
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession SqlSession;

	// 01. 게시글 작성
	@Override
	public void create(NoticeVO No) throws Exception {
		
		SqlSession.insert("noticeinsert", No);
	}
	// 02. 게시글 상세보기
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		return SqlSession.selectOne("noticeview", notice_no);
	}
	// 03. 게시글 수정
	@Override
	public void update(NoticeVO No) throws Exception {
		SqlSession.update("noticeupdateArticle", No);
		
	}
    // 04. 게시글 삭제
	@Override
	public void delete(int notice_no) throws Exception {
		SqlSession.delete("noticedeleteArticle",notice_no);
		
	}
    // 05. 게시글 전체 목록
	@Override
	public List<NoticeVO> listAll() throws Exception {
		return SqlSession.selectList("noticelistAll");
	}
    // 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int notice_no) throws Exception {
		SqlSession.update("noticeincreaseViewcnt", notice_no);		
	}
	
}
