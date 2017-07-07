package com.parker.admin.dao;

import java.util.List;

import com.parker.admin.vo.DeliveryVO;

public interface DeliveryDao {

	public List<DeliveryVO> deliveryList(DeliveryVO dvo);

	public DeliveryVO deliveryDetail(int delivery_number);

	public int deliveryListCnt(DeliveryVO dvo);

	public int deliveryDelete(int buynumber);

}
