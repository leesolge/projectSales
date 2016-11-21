package com.sales.erp.order.vo;

import java.util.Date;

public class OrderJoinVO {
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
		private long allowance;
		private String customer;
		private String address;
		private int checks;
		private int deleted;
		private String changes;
		private String sales;
		
		public String getSales() {
			return sales;
		}
		public void setSales(String sales) {
			this.sales = sales;
		}
		public long getAllowance() {
			return allowance;
		}
		public void setAllowance(long allowance) {
			this.allowance = allowance;
		}
		public String getChanges() {
			return changes;
		}
		public void setChanges(String changes) {
			this.changes = changes;
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
