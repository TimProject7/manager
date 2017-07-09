package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.StatusDao;
import com.parker.admin.vo.DeliveryVO;

@Service
public class StatusServiceImpl implements StatusService {

	@Autowired
	StatusDao statusDao;

	@Override
	public List<DeliveryVO> salesStatus() {
		// TODO Auto-generated method stub
		return statusDao.salesStatus();
	}
}
