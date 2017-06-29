package com.parker.admin.vo;

import java.sql.Date;

public class QuestionVO {

	private int question_number;
	private String question_title;
	private String question_content;
	private Date question_writedate;
	private String question_image;
	private int user_number;
	private int questionReply_success;

	public int getQuestion_number() {
		return question_number;
	}

	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public Date getQuestion_writedate() {
		return question_writedate;
	}

	public void setQuestion_writedate(Date question_writedate) {
		this.question_writedate = question_writedate;
	}

	public String getQuestion_image() {
		return question_image;
	}

	public void setQuestion_image(String question_image) {
		this.question_image = question_image;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getQuestionReply_success() {
		return questionReply_success;
	}

	public void setQuestionReply_success(int questionReply_success) {
		this.questionReply_success = questionReply_success;
	}

	@Override
	public String toString() {
		return "QuestionVO [question_number=" + question_number + ", question_title=" + question_title
				+ ", question_content=" + question_content + ", question_writedate=" + question_writedate
				+ ", question_image=" + question_image + ", user_number=" + user_number + "]";
	}

}