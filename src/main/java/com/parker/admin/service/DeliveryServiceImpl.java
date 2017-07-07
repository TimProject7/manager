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
	public int deliveryListCnt(DeliveryVO dvo) {
		// TODO Auto-generated method stub
		return deilveryDao.deliveryListCnt(dvo);
	}

	@Override
	public List<DeliveryVO> deliveryList(DeliveryVO dvo) {
		// TODO Auto-generated method stub
		return deilveryDao.deliveryList(dvo);
	}

	@Override
	public int deliveryDelete(int delivery_number) {
		// TODO Auto-generated method stub
		return deilveryDao.deliveryDelete(delivery_number);
	}

	@Override
	public int delivery(int buynumber) {
		// TODO Auto-generated method stub
		return deilveryDao.delivery(buynumber);
	}

}
