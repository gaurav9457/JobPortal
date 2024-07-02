package com.jobPortal.beans;
// Generated Jul 1, 2024 3:52:48 PM by Hibernate Tools 3.2.4.GA


import java.util.HashSet;
import java.util.Set;

/**
 * PostJob generated by hbm2java
 */
public class PostJob  implements java.io.Serializable {


     private Long jobId;
     private String companyName;
     private String role;
     private Integer jobPackage;
     private String locationState;
     private Integer noOfOpenings;
     private String requiredEducation;
     private String requiredSkills;
     private Integer experience;
     private String jobDesc;
     private String aboutCompany;
     private String companyType;
     private String isActive;
     private String createdBy;
     private String createdDate;
     private String modifiedBy;
     private String modifiedDate;
     private Company company;
     private Set appliedJobs = new HashSet(0);

    public PostJob() {
    }

    public PostJob(String companyName, String role, Integer jobPackage, String locationState, Integer noOfOpenings, String requiredEducation, String requiredSkills, Integer experience, String jobDesc, String aboutCompany, String companyType, String isActive, String createdBy, String createdDate, String modifiedBy, String modifiedDate, Company company, Set appliedJobs) {
       this.companyName = companyName;
       this.role = role;
       this.jobPackage = jobPackage;
       this.locationState = locationState;
       this.noOfOpenings = noOfOpenings;
       this.requiredEducation = requiredEducation;
       this.requiredSkills = requiredSkills;
       this.experience = experience;
       this.jobDesc = jobDesc;
       this.aboutCompany = aboutCompany;
       this.companyType = companyType;
       this.isActive = isActive;
       this.createdBy = createdBy;
       this.createdDate = createdDate;
       this.modifiedBy = modifiedBy;
       this.modifiedDate = modifiedDate;
       this.company = company;
       this.appliedJobs = appliedJobs;
    }
   
    public Long getJobId() {
        return this.jobId;
    }
    
    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }
    public String getCompanyName() {
        return this.companyName;
    }
    
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    public Integer getJobPackage() {
        return this.jobPackage;
    }
    
    public void setJobPackage(Integer jobPackage) {
        this.jobPackage = jobPackage;
    }
    public String getLocationState() {
        return this.locationState;
    }
    
    public void setLocationState(String locationState) {
        this.locationState = locationState;
    }
    public Integer getNoOfOpenings() {
        return this.noOfOpenings;
    }
    
    public void setNoOfOpenings(Integer noOfOpenings) {
        this.noOfOpenings = noOfOpenings;
    }
    public String getRequiredEducation() {
        return this.requiredEducation;
    }
    
    public void setRequiredEducation(String requiredEducation) {
        this.requiredEducation = requiredEducation;
    }
    public String getRequiredSkills() {
        return this.requiredSkills;
    }
    
    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }
    public Integer getExperience() {
        return this.experience;
    }
    
    public void setExperience(Integer experience) {
        this.experience = experience;
    }
    public String getJobDesc() {
        return this.jobDesc;
    }
    
    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc;
    }
    public String getAboutCompany() {
        return this.aboutCompany;
    }
    
    public void setAboutCompany(String aboutCompany) {
        this.aboutCompany = aboutCompany;
    }
    public String getCompanyType() {
        return this.companyType;
    }
    
    public void setCompanyType(String companyType) {
        this.companyType = companyType;
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
    public String getCreatedDate() {
        return this.createdDate;
    }
    
    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    public String getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    public String getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    public Company getCompany() {
        return this.company;
    }
    
    public void setCompany(Company company) {
        this.company = company;
    }
    public Set getAppliedJobs() {
        return this.appliedJobs;
    }
    
    public void setAppliedJobs(Set appliedJobs) {
        this.appliedJobs = appliedJobs;
    }




}


