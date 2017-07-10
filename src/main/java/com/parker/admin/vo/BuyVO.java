package com.parker.admin.vo;

import java.util.Date;

public class BuyVO {

	private int buy_number;
	private Date buy_day;
	private int buy_quantity;
	private int buy_price;
	private int buy_status2;

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

	public int getBuy_status2() {
		return buy_status2;
	}

	public void setBuy_status2(int buy_status2) {
		this.buy_status2 = buy_status2;
	}

}
