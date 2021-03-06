package com.sales.erp.note.vo;

import java.util.Date;

public class NoteVO {
	private String pageCheck;
	private String change;
	private long notenum;
	private Date senddate;
	private String sender;
	private String receiver;
	private String title;
	private String content;
	private int checks;
	private int deleted;
	private String sname;
	private String rname;
	
	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getPageCheck() {
		return pageCheck;
	}

	public void setPageCheck(String pageCheck) {
		this.pageCheck = pageCheck;
	}
	
	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getChange() {
		return change;
	}

	public void setChange(String change) {
		this.change = change;
	}
	
	public long getNotenum() {
		return notenum;
	}
	
	public void setNotenum(long notenum) {
		this.notenum = notenum;
	}
	
	public Date getSenddate() {
		return senddate;
	}
	
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
	
	public String getSender() {
		return sender;
	}
	
	public void setSender(String sender) {
		this.sender = sender;
	}
	
	public String getReceiver() {
		return receiver;
	}
	
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getChecks() {
		return checks;
	}
	
	public void setChecks(int checks) {
		this.checks = checks;
	}
	
}
