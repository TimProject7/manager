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
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		return userDao.userList();
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

}