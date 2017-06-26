package com.parker.dao;

import java.util.List;

import com.parker.vo.ProductVO;
import com.parker.vo.UserVO;

public interface UserDao {

	public List<UserVO> userList();

	public UserVO userDetail(int user_number);

	public int userRestoration(int user_number);

	public int userDropOut(int user_number);

}