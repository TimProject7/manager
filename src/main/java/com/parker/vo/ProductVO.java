package com.parker.vo;

import org.springframework.web.multipart.MultipartFile;

import com.parker.paging.PagingVO;

public class ProductVO extends PagingVO {
	private int product_number; // 상품번호
	private String product_name; // 상품명
	private String product_company; // 제조사
	private String product_origin; // 원산지
	private MultipartFile product_photo; // 이미지
	private int product_price; // 가격
	private String product_regdate;// 등록일자
	private String admin_id; // 관리자 번호
	private String product_content; // 내용
	private String product_image; // 이미지 경로
	private String product_status;

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	// 열제목 클릭시 정렬을 위한 필드
	private String order_by;
	private String order_sc;

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_company() {
		return product_company;
	}

	public void setProduct_company(String product_company) {
		this.product_company = product_company;
	}

	public String getProduct_origin() {
		return product_origin;
	}

	public void setProduct_origin(String product_origin) {
		this.product_origin = product_origin;
	}

	public MultipartFile getProduct_photo() {
		return product_photo;
	}

	public void setProduct_photo(MultipartFile product_photo) {
		this.product_photo = product_photo;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_regdate() {
		return product_regdate;
	}

	public void setProduct_regdate(String product_regdate) {
		this.product_regdate = product_regdate;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
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

	public String getOrder_by() {
		return order_by;
	}

	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}

	public String getOrder_sc() {
		return order_sc;
	}

	public void setOrder_sc(String order_sc) {
		this.order_sc = order_sc;
	}

	@Override
	public String toString() {
		return "ProductVO [product_number=" + product_number + ", product_name=" + product_name + ", product_company="
				+ product_company + ", product_origin=" + product_origin + ", product_image=" + product_image
				+ ", product_price=" + product_price + ", product_regdate=" + product_regdate + ", admin_id=" + admin_id
				+ ", product_content=" + product_content + "]";
	}

}
