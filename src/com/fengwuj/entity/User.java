package com.fengwuj.entity;

public class User {

	private int id;
	private String username;
	private String password;
	private String xm;
	private String dw;
	private String bm;
	private String dh;
	private String js;
	
	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getBm() {
		return bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}

	public String getDh() {
		return dh;
	}

	public void setDh(String dh) {
		this.dh = dh;
	}

	public String getJs() {
		return js;
	}

	public void setJs(String js) {
		this.js = js;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getUsername() {
		return username;
	}
}
