package com.parker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.dao.AdminDao;
import com.parker.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public String loginCheck(AdminVO avo) {
		return adminDao.loginCheck(avo);
	}

}
