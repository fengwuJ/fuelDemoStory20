package com.fengwuj.entity;

import java.sql.Date;

public class Cgsq {
	private int id;
	private String tn;
	private Date time;
	private String coalType;
	private double number;
	private String jsfs;
	private String fqr;
	private String cz;
	private String status;
	private Date sprq;
	private double rkz;
	
	
	public double getRkz() {
		return rkz;
	}
	public void setRkz(double rkz) {
		this.rkz = rkz;
	}
	public Date getSprq() {
		return sprq;
	}
	public String getStatus() {
		return status;
	}
	public String getCoalType() {
		return coalType;
	}
	public String getCz() {
		return cz;
	}
	public String getFqr() {
		return fqr;
	}
	public int getId() {
		return id;
	}
	public String getJsfs() {
		return jsfs;
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
	
	public void setCoalType(String coalType) {
		this.coalType = coalType;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public void setFqr(String fqr) {
		this.fqr = fqr;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setJsfs(String jsfs) {
		this.jsfs = jsfs;
	}
	public void setSprq(Date sprq) {
		this.sprq = sprq;
	}
	public void setStatus(String status) {
		this.status = status;
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

}
