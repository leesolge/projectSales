package com.sales.erp.member.vo;

import java.util.Date;

public class OrderRequestVO {

	private int checks, deleted;
	private String onum, empno, procode, ocomment, oamount;
	private Date regdate;
	public int getChecks() {
		return checks;
	}
	public void setChecks(int checks) {
		this.checks = checks;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public String getOnum() {
		return onum;
	}
	public void setOnum(String onum) {
		this.onum = onum;
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
	public String getOcomment() {
		return ocomment;
	}
	public void setOcomment(String ocomment) {
		this.ocomment = ocomment;
	}
	public String getOamount() {
		return oamount;
	}
	public void setOamount(String oamount) {
		this.oamount = oamount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
