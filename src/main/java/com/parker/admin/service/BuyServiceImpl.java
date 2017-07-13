package com.parker.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parker.admin.dao.BuyDao;
import com.parker.admin.vo.BuyVO;

@Service
public class BuyServiceImpl implements BuyService {

	@Autowired
	private BuyDao buyDao;
	
	@Override
	public int today(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today(bvo);
	}

	@Override
	public int today1(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today1(bvo);
	}

	@Override
	public int today2(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today2(bvo);
	}

	@Override
	public int today3(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today3(bvo);
	}

	@Override
	public int today4(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today4(bvo);
	}

	@Override
	public int today5(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today5(bvo);
	}

	@Override
	public int today6(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today6(bvo);
	}

	@Override
	public int today7(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today7(bvo);
	}

	@Override
	public int today8(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today8(bvo);
	}

	@Override
	public int today9(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today9(bvo);
	}

	@Override
	public int today10(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today10(bvo);
	}

	@Override
	public int today11(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today11(bvo);
	}

	@Override
	public int today12(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today12(bvo);
	}

	@Override
	public int today13(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today13(bvo);
	}

	@Override
	public int today14(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.today14(bvo);
	}

	/*@Override
	public List<BuyVO> buyList(BuyVO bvo) {
		// TODO Auto-generated method stub
		return buyDao.buyList(bvo);
	}*/

}
