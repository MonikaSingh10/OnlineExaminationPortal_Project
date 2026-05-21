package com.idbi.Beans;



/**
 *
 * @author int4341
 */
public class ErrorBean {
//private String errorCode;

    private String errorMsg;
    
    private String processFor;
    private String userRole;
    private String otherUsers;

    private int claimId;

     public int getClaimId() {
        return claimId;
    }

    public void setClaimId(int claimId) {
        this.claimId = claimId;
    }


    public ErrorBean() {
        
    }

    public String getOtherUsers() {
        return otherUsers;
    }

    public void setOtherUsers(String otherUsers) {
        this.otherUsers = otherUsers;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getProcessFor() {
        return processFor;
    }

    public void setProcessFor(String processFor) {
        this.processFor = processFor;
    }

   
    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
