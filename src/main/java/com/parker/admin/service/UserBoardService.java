package com.parker.admin.service;

import java.util.List;

import com.parker.admin.vo.UserBoardVO;

public interface UserBoardService {

	public List<UserBoardVO> userBoardList(UserBoardVO ubvo);

	public int userBoardListCnt(UserBoardVO ubvo);

}
