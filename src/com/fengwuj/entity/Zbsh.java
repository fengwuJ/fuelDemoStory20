package com.fengwuj.entity;

import java.sql.Date;

public class Zbsh {
	private int id;
	private String tn;
	private Date time;
	private String coalType;
	private double number;
	private String frl;
	private String ysfs;
	private String cz;
	private String status;
	private String gysname;
	
	public String getGysname() {
		return gysname;
	}
	public void setGysname(String gysname) {
		this.gysname = gysname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCoalType() {
		return coalType;
	}
	public String getCz() {
		return cz;
	}
	public String getFrl() {
		return frl;
	}
	public int getId() {
		return id;
	}
	public double getNumber() {
		return number;
	}
	public Date getTime() {
		return time;
	}
	public String getTn() {
		return tn;
	}
	public String getYsfs() {
		return ysfs;
	}
	
	public void setCoalType(String coalType) {
		this.coalType = coalType;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public void setFrl(String frl) {
		this.frl = frl;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNumber(double number) {
		this.number = number;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public void setTn(String tn) {
		this.tn = tn;
	}
	public void setYsfs(String ysfs) {
		this.ysfs = ysfs;
	}
}
