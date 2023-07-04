package com.sitter.model;

import java.util.Date;

public class SitterVO {
	
	private String title;
	private String short_content;
	private String addr;	
	private String tag;
	private String service;
	private String content;
	private String ifile;
	private String nickname;
	private String unickname;
	private String snickname;
	private String pname;
	private Date sdate;
	private Date fdate;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSnickname() {
		return snickname;
	}
	public void setSnickname(String snickname) {
		this.snickname = snickname;
	}
	public String getPname() {
		return pname;
	}
	public void setPetname(String pname) {
		this.pname = pname;
	}
	public String getUnickname() {
		return unickname;
	}
	public void setUnickname(String unickname) {
		this.unickname = unickname;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}
		
	public String getIfile() {
		return ifile;
	}
	public void setIfile(String ifile) {
		this.ifile = ifile;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getShort_content() {
		return short_content;
	}
	public void setShort_content(String short_content) {
		this.short_content = short_content;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
}
