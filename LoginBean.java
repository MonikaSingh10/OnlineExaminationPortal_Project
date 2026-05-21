package com.idbi.Beans;

public class LoginBean {
	
	private String ein;
	private String logintype;
	private String userstatus;
	private String username;
	private String userpassword;
	private String designation;
	private String MOBILE_NO;
	
	public String getEin() {
		return ein;
	}
	public void setEin(String ein) {
		this.ein = ein;
	}
	public String getLogintype() {
		return logintype;
	}
	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}
	public String getUserstatus() {
		return userstatus;
	}
	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	
	
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getMOBILE_NO() {
		return MOBILE_NO;
	}
	public void setMOBILE_NO(String MOBILE_NO) {
		this.MOBILE_NO = MOBILE_NO;
	}
	@Override
	public String toString() {
		return "LoginBean [ein=" + ein + ", logintype=" + logintype + ", userstatus=" + userstatus + ", username="
				+ username + ", userpassword=" + userpassword + "]";
	}
	
}
