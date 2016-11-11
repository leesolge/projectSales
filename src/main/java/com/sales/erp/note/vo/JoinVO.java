package com.sales.erp.note.vo;

import java.util.Date;

public class JoinVO {
	private String notenum;
	private Date senddate;
	private String sender;
	private String sname;
	private String steam;
	private String sauth;
	private String receiver;
	private String rname;
	private String rteam;
	private String rauth;
	private String title;
	private String content;
	private String checks;
	private String deleted;
	private String change;
	
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getNotenum() {
		return notenum;
	}
	public void setNotenum(String notenum) {
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
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSteam() {
		return steam;
	}
	public void setSteam(String steam) {
		this.steam = steam;
	}
	public String getSauth() {
		return sauth;
	}
	public void setSauth(String sauth) {
		this.sauth = sauth;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRteam() {
		return rteam;
	}
	public void setRteam(String rteam) {
		this.rteam = rteam;
	}
	public String getRauth() {
		return rauth;
	}
	public void setRauth(String rauth) {
		this.rauth = rauth;
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
	public String getChecks() {
		return checks;
	}
	public void setChecks(String checks) {
		this.checks = checks;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	
}
