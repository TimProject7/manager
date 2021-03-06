package com.parker.admin.service;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.parker.admin.dao.NoticeDao;
import com.parker.admin.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDao noticeDao;

	// 글 쓰기
	@Override
	public void create(NoticeVO No) throws Exception {
		String title = No.getNotice_title();
		String content = No.getNotice_content();
		String writer = No.getNotice_writer();

		// *태그문자 처리 (< ==> &lt; > ==> &gt;)
		// replace(A, B) A를 B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");
		// *공백문자 처리
		title = title.replace("  ", "&nbsp;&nbsp;");
		writer = writer.replace("  ", "&nbsp;&nbsp;");
		// *줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		No.setNotice_title(title);
		No.setNotice_content(content);
		No.setNotice_writer(writer);
		noticeDao.create(No);
	}

	// 02. 게시글 상세보기
	@Override
	public NoticeVO read(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.read(notice_no);
	}

	// 03. 게시글 수정
	@Override
	public void update(NoticeVO No) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.update(No);

	}

	// 04. 게시글 삭제
	@Override
	public void delete(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		noticeDao.delete(notice_no);
	}

	// 05. 게시글 전체 목록
	@Override
	public List<NoticeVO> listAll(NoticeVO nvo) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.listAll(nvo);
	}

	// 06. 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int notice_no, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
		if (session.getAttribute("update_time_" + notice_no) != null) {
			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time_" + notice_no);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 5 * 1000) {
			noticeDao.increaseViewcnt(notice_no);
			// 세션에 시간을 저장 : "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + notice_no, current_time);

		}

	}

	@Override
	public int noticeListCnt(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeListCnt(nvo);
	}

}
