package com.sales.erp.freeboard.vo;

import java.util.Date;

public class FreeboardReplyVO {
	public int replynum;
	public int num;
	public String empno;
	public String reply;
	public Date regDate;
	public int sort;
	public int parent, child; //대댓글 관련
	public String name; // DB에는 저장하지 않지만 출력을 위해서 VO에 작성
	
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}

}
