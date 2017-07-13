package com.parker.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parker.admin.vo.BuyVO;

@Repository
public class BuyDaoImpl implements BuyDao {

	@Autowired
	SqlSession sqlSession;

	
	@Override
	public int today(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today",bvo);
	}

	@Override
	public int today1(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today1",bvo);
	}

	@Override
	public int today2(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today2",bvo);
	}

	@Override
	public int today3(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today3",bvo);
	}

	@Override
	public int today4(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today4",bvo);
	}

	@Override
	public int today5(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today5",bvo);
	}

	@Override
	public int today6(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today6",bvo);
	}

	@Override
	public int today7(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today7",bvo);
	}

	@Override
	public int today8(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today8",bvo);
	}

	@Override
	public int today9(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today9",bvo);
	}

	@Override
	public int today10(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today10",bvo);
	}

	@Override
	public int today11(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today11",bvo);
	}

	@Override
	public int today12(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today12",bvo);
	}

	@Override
	public int today13(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today13",bvo);
	}

	@Override
	public int today14(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("today14",bvo);
	}

/*	@Override
	public List<BuyVO> buyList(BuyVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("buyList",bvo);
	}*/

}
