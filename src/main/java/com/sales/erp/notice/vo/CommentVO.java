package com.sales.erp.notice.vo;

import java.util.Date;

public class CommentVO {
	public String num; 
	public String name;
	public String comments;
	public Date regDate;
	public String change;

	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
