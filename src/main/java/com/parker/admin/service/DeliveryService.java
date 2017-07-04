package com.parker.admin.service;

import java.util.List;

import com.parker.admin.vo.DeliveryVO;

public interface DeliveryService {

	public List<DeliveryVO> deliveryList(DeliveryVO dvo);

	public DeliveryVO deliveryDetail(int delivery_number);

	public int deliveryListCnt(DeliveryVO dvo);

}
