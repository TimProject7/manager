package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.UserDao;
import com.parker.admin.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public List<UserVO> userList(UserVO uvo) {
		// TODO Auto-generated method stub
		return userDao.userList(uvo);
	}

	@Override
	public UserVO userDetail(int user_number) {
		// TODO Auto-generated method stub
		return userDao.userDetail(user_number);
	}

	@Override
	public int userRestoration(int user_number) {
		// TODO Auto-generated method stub
		return userDao.userRestoration(user_number);
	}

	@Override
	public int userDropOut(int user_number) {
		// TODO Auto-generated method stub
		return userDao.userDropOut(user_number);
	}

	@Override
	public int userListCnt(UserVO uvo) {
		// TODO Auto-generated method stub
		return userDao.userListCnt(uvo);
	}

	/* 통계-일반회원 */
	@Override
	public int userStatisticeY(UserVO uvo) {
		return userDao.userStatisticeY(uvo);
	}

	/* 통계-탈퇴회원 */
	@Override
	public int userStatisticeN(UserVO uvo) {
		return userDao.userStatisticeN(uvo);
	}

}