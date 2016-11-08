package com.sales.erp.noteVO;

public class NoteSearchVO {
	private String empno;
	private String field;
	private String keyword;
	private int start;
	private int end;
	
	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getField() {
		return field;
	}
	
	public void setField(String field) {
		this.field = field;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
}
