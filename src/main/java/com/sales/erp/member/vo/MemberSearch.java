package com.sales.erp.member.vo;

public class MemberSearch {
	private String field, word;
	private int totalCount, startPage, endPage;
	private boolean prev, next;

	private int displayPageNum = 10;
	
	private Paging page;
	
	
	
	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
	
}
