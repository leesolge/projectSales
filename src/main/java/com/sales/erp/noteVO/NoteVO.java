package com.sales.erp.noteVO;

import java.util.Date;

public class NoteVO {
	private String change;
	private long notenum;
	private Date senddate;
	private String sender;
	private String receiver;
	private String title;
	private String content;
	private int check;
	
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
	
	public int getCheck() {
		return check;
	}
	
	public void setCheck(int check) {
		this.check = check;
	}
	
}
