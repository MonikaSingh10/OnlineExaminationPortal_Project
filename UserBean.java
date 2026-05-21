package com.idbi.Beans;

public class UserBean {

    private int ein;
    private int emplyCd;
    private String name;
    private String appliedDate;
    private String joiningDate;
    private String retirementDate;
    private String designation;
    private String department;
    private String mobile_no;
    private String email;
    private String city;
    private int supEin;
    private String supName;
    private String examtype;
	private String grade;
    private int pincode;
    private String state;
    
    
   public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
    public String getExamtype() {
		return examtype;
	}
	public void setExamtype(String examtype) {
		this.examtype = examtype;
	}
	private String contactNo;
    
   // private String vertical;
    private String region;
    
    
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getEin() {
		return ein;
	}
	public void setEin(int ein) {
		this.ein = ein;
	}
	public int getEmplyCd() {
		return emplyCd;
	}
	public void setEmplyCd(int emplyCd) {
		this.emplyCd = emplyCd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	public String getRetirementDate() {
		return retirementDate;
	}
	public void setRetirementDate(String retirementDate) {
		this.retirementDate = retirementDate;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getSupEin() {
		return supEin;
	}
	public void setSupEin(int supEin) {
		this.supEin = supEin;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}


	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public String getAppliedDate() {
		return appliedDate;
	}
	public void setAppliedDate(String appliedDate) {
		this.appliedDate = appliedDate;
	}
	@Override
	public String toString() {
		return "UserBean [ein=" + ein + ", emplyCd=" + emplyCd + ", name=" + name + ", appliedDate=" + appliedDate
				+ ", joiningDate=" + joiningDate + ", retirementDate=" + retirementDate + ", designation=" + designation
				+ ", department=" + department + ", mobile_no=" + mobile_no + ", email=" + email + ", city=" + city
				+ ", supEin=" + supEin + ", supName=" + supName + ", examtype=" + examtype
				+ ", grade=" + grade + ", pincode=" + pincode + ", state=" + state + ", contactNo=" + contactNo
				+ ", region=" + region + "]";
	}
	

}
