package com.parker.admin.dao;

import java.util.List;

import com.parker.admin.vo.DeliveryVO;

public interface DeliveryDao {

	public List<DeliveryVO> deliveryList();

	public DeliveryVO deliveryDetail(int delivery_number);

}
