package com.parker.admin.vo;

import java.sql.Date;

import com.parker.admin.paging.PagingVO;

public class UserBoardVO extends PagingVO {
	private int userboard_number;
	private String userboard_title;
	private String userboard_name;
	private String userboard_content;
	private Date userboard_writedate;
	private String userboard_image;
	private int user_number;
	private int userboard_viewcnt;

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getUserboard_number() {
		return userboard_number;
	}

	public void setUserboard_number(int userboard_number) {
		this.userboard_number = userboard_number;
	}

	public String getUserboard_title() {
		return userboard_title;
	}

	public void setUserboard_title(String userboard_title) {
		this.userboard_title = userboard_title;
	}

	public String getUserboard_name() {
		return userboard_name;
	}

	public void setUserboard_name(String userboard_name) {
		this.userboard_name = userboard_name;
	}

	public String getUserboard_content() {
		return userboard_content;
	}

	public void setUserboard_content(String userboard_content) {
		this.userboard_content = userboard_content;
	}

	public Date getUserboard_writedate() {
		return userboard_writedate;
	}

	public void setUserboard_writedate(Date userboard_writedate) {
		this.userboard_writedate = userboard_writedate;
	}

	public String getUserboard_image() {
		return userboard_image;
	}

	public void setUserboard_image(String userboard_image) {
		this.userboard_image = userboard_image;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getUserboard_viewcnt() {
		return userboard_viewcnt;
	}

	public void setUserboard_viewcnt(int userboard_viewcnt) {
		this.userboard_viewcnt = userboard_viewcnt;
	}

	@Override
	public String toString() {
		return "UserBoardVO [userboard_number=" + userboard_number + ", userboard_title=" + userboard_title
				+ ", userboard_name=" + userboard_name + ", userboard_content=" + userboard_content
				+ ", userboard_writedate=" + userboard_writedate + ", userboard_image=" + userboard_image
				+ ", user_number=" + user_number + ", userboard_viewcnt=" + userboard_viewcnt + ", search=" + search
				+ ", keyword=" + keyword + "]";
	}

}
