package com.sales.erp.buy.vo;

import java.util.Date;

public class BuyListVO {

	private int cnt, buystep;
	private String buynum, empno, title, procode, team;
	private Date regdate, appdate;

	public int getBuystep() {
		return buystep;
	}

	public void setBuystep(int buystep) {
		this.buystep = buystep;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getBuynum() {
		return buynum;
	}

	public void setBuynum(String buynum) {
		this.buynum = buynum;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProcode() {
		return procode;
	}

	public void setProcode(String procode) {
		this.procode = procode;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
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

}