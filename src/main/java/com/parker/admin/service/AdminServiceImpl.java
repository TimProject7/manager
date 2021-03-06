package com.parker.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.admin.dao.AdminDao;
import com.parker.admin.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public AdminVO loginCheck(AdminVO avo) {
		return adminDao.loginCheck(avo);
	}

}
