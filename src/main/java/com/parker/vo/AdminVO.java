package com.parker.vo;

public class AdminVO {

	int admin_number;
	String admin_id;
	String admin_password;

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}

	@Override
	public String toString() {
		return "AdminVO [admin_number=" + admin_number + ", admin_id=" + admin_id + ", admin_password=" + admin_password
				+ "]";
	}

}