package com.jobPortal.beans;
// Generated Jul 1, 2024 3:52:48 PM by Hibernate Tools 3.2.4.GA


import java.sql.Date;

/**
 * AdminTable generated by hbm2java
 */
public class AdminTable  implements java.io.Serializable {


     private Long adminId;
     private String firstName;
     private String lastName;
     private String emailId;
     private String password;
     private String isActive;
     private String createdBy;
     private Date createdDate;
     private String modifiedBy;
     private Date modifiedDate;

    public AdminTable() {
    }

    public AdminTable(String firstName, String lastName, String emailId, String password, String isActive, String createdBy, Date createdDate, String modifiedBy, Date modifiedDate) {
       this.firstName = firstName;
       this.lastName = lastName;
       this.emailId = emailId;
       this.password = password;
       this.isActive = isActive;
       this.createdBy = createdBy;
       this.createdDate = createdDate;
       this.modifiedBy = modifiedBy;
       this.modifiedDate = modifiedDate;
    }
   
    public Long getAdminId() {
        return this.adminId;
    }
    
    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmailId() {
        return this.emailId;
    }
    
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }
    public String getCreatedBy() {
        return this.createdBy;
    }
    
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    public Date getCreatedDate() {
        return this.createdDate;
    }
    
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    public String getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    public Date getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }




}


