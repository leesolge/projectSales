package com.sales.erp.freeboard.vo;

import oracle.sql.DATE;

public class ReplyVO {
	int seq;
	String empno, num, name, reply;
	DATE regdate;
	String change; //fReply.sql(db) 에는 없음
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public DATE getRegdate() {
		return regdate;
	}
	public void setRegdate(DATE regdate) {
		this.regdate = regdate;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	
}
