package com.parker.admin.service;

import java.util.List;

import com.parker.admin.vo.UserBoardReplyVO;
import com.parker.admin.vo.UserBoardVO;

public interface UserBoardService {

	public List<UserBoardVO> userBoardList(UserBoardVO ubvo);

	public int userBoardListCnt(UserBoardVO ubvo);

	public UserBoardVO userBoardDetail(int userboard_number);

	public UserBoardReplyVO userBoardReply(int userboard_number);

	public int userBoardDelete(int userboard_number);

}
