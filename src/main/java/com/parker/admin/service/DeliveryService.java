package com.parker.admin.service;

import java.util.List;

import com.parker.admin.vo.DeliveryVO;

public interface DeliveryService {

	public List<DeliveryVO> deliveryList(DeliveryVO dvo);

	public int deliveryListCnt(DeliveryVO dvo);

	public int deliveryDelete(int buynumber);

	public int delivery(int buynumber);

}
