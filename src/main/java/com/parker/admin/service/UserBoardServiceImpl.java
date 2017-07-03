package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.UserBoardDao;
import com.parker.admin.vo.UserBoardVO;

@Service
public class UserBoardServiceImpl implements UserBoardService {

	@Autowired
	private UserBoardDao userBoardDao;

	@Override
	public List<UserBoardVO> userBoardList() {
		// TODO Auto-generated method stub
		return userBoardDao.userBoardList();
	}
}
