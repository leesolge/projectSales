package com.sales.erp.buy.vo;

import java.util.Date;

public class BuyVO {
	private int buynum; // 주문번호
	private String empno; // 주문자 사원번호
	private String procode; // 주문 물품번호
	private String amount; // 주문 수량
	private String buycomment; // 주문 이유
	private Date regdate; // 주문등록 날짜
	private Date appdate; // 최종승인 날짜
	private int buystep; // 승인단계
	private int deleted; // 삭제 여부

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getProcode() {
		return procode;
	}

	public void setProcode(String procode) {
		this.procode = procode;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getBuycomment() {
		return buycomment;
	}

	public void setBuycomment(String buycomment) {
		this.buycomment = buycomment;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getAppdate() {
		return appdate;
	}

	public void setAppdate(Date appdate) {
		this.appdate = appdate;
	}

	public int getBuystep() {
		return buystep;
	}

	public void setBuystep(int buystep) {
		this.buystep = buystep;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

}
