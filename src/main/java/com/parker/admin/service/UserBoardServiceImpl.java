package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.UserBoardDao;
import com.parker.admin.vo.UserBoardReplyVO;
import com.parker.admin.vo.UserBoardVO;

@Service
public class UserBoardServiceImpl implements UserBoardService {

	@Autowired
	private UserBoardDao userBoardDao;

	@Override
	public List<UserBoardVO> userBoardList(UserBoardVO ubvo) {
		// TODO Auto-generated method stub
		return userBoardDao.userBoardList(ubvo);
	}

	@Override
	public int userBoardListCnt(UserBoardVO ubvo) {
		// TODO Auto-generated method stub
		return userBoardDao.userBoardListCnt(ubvo);
	}

	@Override
	public UserBoardVO userBoardDetail(int userboard_number) {
		// TODO Auto-generated method stub
		return userBoardDao.userBoardDetail(userboard_number);
	}

	@Override
	public UserBoardReplyVO userBoardReply(int userboard_number) {
		// TODO Auto-generated method stub
		return userBoardDao.userBoardReply(userboard_number);
	}

	@Override
	public int userBoardDelete(int userboard_number) {
		// TODO Auto-generated method stub
		return userBoardDao.userBoardDelete(userboard_number);
	}
}
