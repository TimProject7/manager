package com.parker.admin.dao;

import java.util.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.parker.admin.vo.FAQVO;


@Repository
@Transactional
public class FAQDaoImpl implements FAQDao{
	
	@Autowired
	SqlSession SqlSession;
	
	 // 01. 게시글 작성
	@Override
	public void create(FAQVO fo) throws Exception {
		SqlSession.insert("faqinsert", fo);
		
	}
	// 02. 게시글 상세보기
	@Override
	public FAQVO read(int faq_no) throws Exception {
		return SqlSession.selectOne("faqview", faq_no);
	}
	// 03. 게시글 수정
	@Override
	public void update(FAQVO fo) throws Exception {
		 SqlSession.update("faqupdateArticle", fo);
	}
    // 04. 게시글 삭제
	@Override
	public void delete(int faq_no) throws Exception {
		SqlSession.delete("faqdeleteArticle",faq_no);
	}
    // 05. 게시글 전체 목록
	@Override
	public List<FAQVO> listAll() throws Exception {
		return SqlSession.selectList("faqlistAll");
	}
    // 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int faq_no) throws Exception {
		SqlSession.update("faqincreaseViewcnt", faq_no);
	}

}
