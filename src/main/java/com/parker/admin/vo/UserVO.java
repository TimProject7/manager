package com.parker.admin.vo;

import java.sql.Date;

public class UserVO {
	private int user_number;
	private String user_name;
	private String user_id;
	private String user_password;
	private String user_email;
	private String user_address;
	private Date user_birthday;
	private String user_cell;
	private String user_phone;
	private String user_gender;
	private String user_privacyconsignment;
	private String user_termsofuse;
	private String user_receiveadvertising;
	private Date user_regdate;
	private String user_status;
	private String zip_code;
	private String detail_address;

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public Date getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_cell() {
		return user_cell;
	}

	public void setUser_cell(String user_cell) {
		this.user_cell = user_cell;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_privacyconsignment() {
		return user_privacyconsignment;
	}

	public void setUser_privacyconsignment(String user_privacyconsignment) {
		this.user_privacyconsignment = user_privacyconsignment;
	}

	public String getUser_termsofuse() {
		return user_termsofuse;
	}

	public void setUser_termsofuse(String user_termsofuse) {
		this.user_termsofuse = user_termsofuse;
	}

	public String getUser_receiveadvertising() {
		return user_receiveadvertising;
	}

	public void setUser_receiveadvertising(String user_receiveadvertising) {
		this.user_receiveadvertising = user_receiveadvertising;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	@Override
	public String toString() {
		return "UserVO [user_number=" + user_number + ", user_name=" + user_name + ", user_id=" + user_id
				+ ", user_password=" + user_password + ", user_email=" + user_email + ", user_address=" + user_address
				+ ", user_birthday=" + user_birthday + ", user_cell=" + user_cell + ", user_phone=" + user_phone
				+ ", user_gender=" + user_gender + ", user_privacyconsignment=" + user_privacyconsignment
				+ ", user_termsofuse=" + user_termsofuse + ", user_receiveadvertising=" + user_receiveadvertising
				+ ", user_regdate=" + user_regdate + ", user_status=" + user_status + ", zip_code=" + zip_code
				+ ", detail_address=" + detail_address + "]";
	}

}
