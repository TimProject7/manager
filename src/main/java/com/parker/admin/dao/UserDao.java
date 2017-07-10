package com.parker.admin.dao;

import java.util.List;

import com.parker.admin.vo.ProductVO;
import com.parker.admin.vo.UserVO;

public interface UserDao {

	public List<UserVO> userList(UserVO uvo);

	public UserVO userDetail(int user_number);

	public int userRestoration(int user_number);

	public int userDropOut(int user_number);

	public int userListCnt(UserVO uvo);
	
	/*통계-일반회원*/
	public int userStatisticeY(UserVO uvo);
	/*통계-탈퇴회원*/
	public int userStatisticeN(UserVO uvo);

}
