package com.parker.admin.dao;

import java.util.List;

import com.parker.admin.vo.UserBoardVO;

public interface UserBoardDao {

	public List<UserBoardVO> userBoardList(UserBoardVO ubvo);

	public int userBoardListCnt(UserBoardVO ubvo);

}
