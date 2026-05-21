package com.idbi.Beans;

public class RegestrationBean {

	private int ein;
	private String empName;
	private String desination;
	private String email;
	private String state;
	private String city;
	private int pincode;
	private String mobileNo;
	private String password;
	
	public int getEin() {
		return ein;
	}
	public void setEin(int ein) {
		this.ein = ein;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDesination() {
		return desination;
	}
	public void setDesination(String desination) {
		this.desination = desination;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	@Override
	public String toString() {
		return "RegestrationBean [ein=" + ein + ", empName=" + empName + ", desination=" + desination + ", email="
				+ email + ", state=" + state + ", city=" + city + ", pincode=" + pincode + ", mobileNo=" + mobileNo
				+ ", password=" + password + "]";
	}
}
