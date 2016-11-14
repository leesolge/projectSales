package com.sales.erp.order.vo;

import java.util.Date;

public class OrderJoinVO {
	/*O.ID AS ID, O.EMPNO AS EMPNO, O.REGDATE AS REGDATE,
	   S.NAME AS NAME, S.TEAM AS TEAM, S.AUTH AS AUTH,
	   O.PROCODE AS PROCODE, P.PRONAME AS PRONAME, O.PROAMOUNT AS PROAMOUNT,
	   ((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFIT,
	   O.CUSTOMER AS CUSTOMER, O.ADDRESS AS ADDRESS, O.CHECKS AS CHECKS,
	   O.DELETED AS DELETED
	   FROM ORDERS O, */
		private Date regdate;
		private String id;
		private String empno;
		private String name;
		private String team;
		private String auth;
		private String procode;
		private String proname;
		private int proamount;
		private String profit;
		private String customer;
		private String address;
		private int checks;
		private int deleted;
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getTeam() {
			return team;
		}
		public void setTeam(String team) {
			this.team = team;
		}
		public String getAuth() {
			return auth;
		}
		public void setAuth(String auth) {
			this.auth = auth;
		}
		public String getProcode() {
			return procode;
		}
		public void setProcode(String procode) {
			this.procode = procode;
		}
		public String getProname() {
			return proname;
		}
		public void setProname(String proname) {
			this.proname = proname;
		}
		public int getProamount() {
			return proamount;
		}
		public void setProamount(int proamount) {
			this.proamount = proamount;
		}
		public String getProfit() {
			return profit;
		}
		public void setProfit(String profit) {
			this.profit = profit;
		}
		public String getCustomer() {
			return customer;
		}
		public void setCustomer(String customer) {
			this.customer = customer;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
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
		
}
