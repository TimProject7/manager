package com.parker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.dao.AdminDao;
import com.parker.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public int selectLogin(AdminVO avo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = adminDao.selectLogin(avo);
		System.out.println("서비스 : " + result);
		return result;
	}

}
