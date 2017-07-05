package com.parker.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parker.admin.dao.ProductDao;
import com.parker.admin.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	// 01. 상품목록
	@Override
	public List<ProductVO> listProduct(ProductVO pvo) {
		return productDao.listProduct(pvo);
	}

	@Override
	public ProductVO detailProduct(int product_number) {
		// TODO Auto-generated method stub
		return productDao.detailProduct(product_number);
	}

	@Override
	public void insertProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		productDao.insertProduct(pvo);
	}

	@Override
	public int salesProduct(int product_number) {
		// TODO Auto-generated method stub
		return productDao.salesProduct(product_number);
	}

	@Override
	public int salesStopProduct(int product_number) {
		// TODO Auto-generated method stub
		return productDao.salesStopProduct(product_number);

	}

	@Override
	public int updateProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return productDao.updateProduct(pvo);
	}

	@Override
	public int productName(ProductVO pvo) {
		// TODO Auto-generated method stub
		return productDao.productName(pvo);
	}

	@Override
	public int nameChkProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return productDao.nameChkProduct(pvo);
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		// TODO Auto-generated method stub
		return productDao.listProductCnt(pvo);
	}

}