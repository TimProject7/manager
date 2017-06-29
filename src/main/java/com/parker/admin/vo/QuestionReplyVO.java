package com.parker.admin.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QuestionReplyVO {
	private int questionReply_number;
	private String questionReply_content;
	private Date questionReply_writedate;
	private String questionReply_image;
	private MultipartFile questionReply_photo;
	private int question_number;
	private int admin_number;

	public int getQuestionReply_number() {
		return questionReply_number;
	}

	public void setQuestionReply_number(int questionReply_number) {
		this.questionReply_number = questionReply_number;
	}

	public String getQuestionReply_content() {
		return questionReply_content;
	}

	public void setQuestionReply_content(String questionReply_content) {
		this.questionReply_content = questionReply_content;
	}

	public Date getQuestionReply_writedate() {
		return questionReply_writedate;
	}

	public void setQuestionReply_writedate(Date questionReply_writedate) {
		this.questionReply_writedate = questionReply_writedate;
	}

	public String getQuestionReply_image() {
		return questionReply_image;
	}

	public void setQuestionReply_image(String questionReply_image) {
		this.questionReply_image = questionReply_image;
	}

	public MultipartFile getQuestionReply_photo() {
		return questionReply_photo;
	}

	public void setQuestionReply_photo(MultipartFile questionReply_photo) {
		this.questionReply_photo = questionReply_photo;
	}

	public int getQuestion_number() {
		return question_number;
	}

	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}

	public int getAdmin_number() {
		return admin_number;
	}

	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}

	@Override
	public String toString() {
		return "QuestionReplyVO [questionReply_number=" + questionReply_number + ", questionReply_content="
				+ questionReply_content + ", questionReply_writedate=" + questionReply_writedate
				+ ", questionReply_image=" + questionReply_image + ", questionReply_photo=" + questionReply_photo
				+ ", question_number=" + question_number + ", admin_number=" + admin_number + "]";
	}

}
