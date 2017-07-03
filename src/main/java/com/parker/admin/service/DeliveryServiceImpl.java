package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.DeliveryDao;
import com.parker.admin.vo.DeliveryVO;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private DeliveryDao deilveryDao;

	@Override
	public List<DeliveryVO> deliveryList() {
		// TODO Auto-generated method stub
		return deilveryDao.deliveryList();
	}

	@Override
	public DeliveryVO deliveryDetail(int delivery_number) {
		// TODO Auto-generated method stub
		return deilveryDao.deliveryDetail(delivery_number);
	}

}
