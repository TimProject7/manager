package com.parker.admin.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.parker.admin.paging.PagingVO;

public class DeliveryVO extends PagingVO {

	private int buy_number;
	private Date buy_day;
	private String buy_address;
	private String buy_product;
	private int buy_quantity;
	private int buy_price;
	private String buy_status;
	private int user_number;
	private String user_name;
	private int product_number;
	private String buy_image;

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	// 배송 분류
	private String delivery = "";

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public int getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(int buy_number) {
		this.buy_number = buy_number;
	}

	public Date getBuy_day() {
		return buy_day;
	}

	public void setBuy_day(Date buy_day) {
		this.buy_day = buy_day;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public String getBuy_product() {
		return buy_product;
	}

	public void setBuy_product(String buy_product) {
		this.buy_product = buy_product;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public String getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
	}

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

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getBuy_image() {
		return buy_image;
	}

	public void setBuy_image(String buy_image) {
		this.buy_image = buy_image;
	}

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

	@Override
	public String toString() {
		return "DeliveryVO [buy_number=" + buy_number + ", buy_day=" + buy_day + ", buy_address=" + buy_address
				+ ", buy_product=" + buy_product + ", buy_quantity=" + buy_quantity + ", buy_price=" + buy_price
				+ ", buy_status=" + buy_status + ", user_number=" + user_number + ", product_number=" + product_number
				+ ", buy_image=" + buy_image + "]";
	}

}
