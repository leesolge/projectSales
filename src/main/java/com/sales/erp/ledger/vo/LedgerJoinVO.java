package com.sales.erp.ledger.vo;

import java.util.Date;

public class LedgerJoinVO {
	private String change;
	private String id;
	private String empno;
	private String name;
	private Date regdate;
	private String enable;
	private String sort;
	private String content;
	private long amount;
	private long money;
	private String etc;
	private long sortamount;
	private long pastamount;
	
	public long getPastamount() {
		return pastamount;
	}
	public void setPastamount(long pastamount) {
		this.pastamount = pastamount;
	}
	public long getSortamount() {
		return sortamount;
	}
	public void setSortamount(long sortamount) {
		this.sortamount = sortamount;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public long getMoney() {
		return money;
	}
	public void setMoney(long money) {
		this.money = money;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
}
