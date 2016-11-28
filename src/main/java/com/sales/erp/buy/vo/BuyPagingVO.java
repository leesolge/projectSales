package com.sales.erp.buy.vo;

public class BuyPagingVO {

	private String empno;
	private String team;
	private String start_date;
	private String end_date;
	private int total;
	private int start;
	private int end;
	private int page;
	private int allPage;
	private int block;
	private int fromPage;
	private int toPage;
	private int rowSize;

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public int getRowSize() {
		return rowSize;
	}

	public void setRowSize(int rowSize, int pg) {
		this.rowSize = rowSize;
		this.start = (pg * rowSize) - (rowSize - 1);
		this.end = pg * rowSize;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total, double rowsize) {
		this.total = total;
		this.allPage = (int) Math.ceil(total / rowsize);
		if (this.toPage > this.allPage) {
			this.toPage = this.allPage;
		}
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getAllPage() {
		return allPage;
	}

	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}

	public int getBlock() {
		return block;
	}

	public void setBlock(int block, int pg) {
		this.block = block;
		this.fromPage = ((pg - 1) / block * block) + 1;
		this.toPage = ((pg - 1) / block * block) + block;
	}

	public int getFromPage() {
		return fromPage;
	}

	public void setFromPage(int fromPage) {
		this.fromPage = fromPage;
	}

	public int getToPage() {
		return toPage;
	}

	public void setToPage(int toPage) {
		this.toPage = toPage;
	}

}
