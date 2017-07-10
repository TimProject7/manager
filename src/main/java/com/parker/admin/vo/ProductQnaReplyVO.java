package com.parker.admin.vo;

import java.sql.Date;

import com.parker.admin.paging.PagingVO;

//상품qna 리플 게시판
public class ProductQnaReplyVO extends PagingVO {
	private int productQnaReply_number;
	private String productQnaReply_content;
	private Date productQnaReply_writedate;
	private int admin_number;
	private int productQna_number;
	private int product_number;

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public int getProductQnaReply_number() {
		return productQnaReply_number;
	}

	public void setProductQnaReply_number(int productQnaReply_number) {
		this.productQnaReply_number = productQnaReply_number;
	}

	public String getProductQnaReply_content() {
		return productQnaReply_content;
	}

	public void setProductQnaReply_content(String productQnaReply_content) {
		this.productQnaReply_content = productQnaReply_content;
	}

	public Date getProductQnaReply_writedate() {
		return productQnaReply_writedate;
	}

	public void setProductQnaReply_writedate(Date productQnaReply_writedate) {
		this.productQnaReply_writedate = productQnaReply_writedate;
	}

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	public int getProductQna_number() {
		return productQna_number;
	}

	public void setProductQna_number(int productQna_number) {
		this.productQna_number = productQna_number;
	}

	@Override
	public String toString() {
		return "ProductQnaReplyVO [productQnaReply_number=" + productQnaReply_number + ", productQnaReply_content="
				+ productQnaReply_content + ", productQnaReply_writedate=" + productQnaReply_writedate
				+ ", admin_number=" + admin_number + ", productQna_number=" + productQna_number + "]";
	}

}