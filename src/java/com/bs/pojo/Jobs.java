package com.bs.pojo;
// Generated Oct 18, 2016 6:42:00 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Jobs generated by hbm2java
 */
public class Jobs  implements java.io.Serializable {


     private int jobId;
     private String jobTitle;
     private Double minSalary;
     private Double maxSalary;
     private Set jobhistories = new HashSet(0);
     private Set employees = new HashSet(0);

    public Jobs() {
    }

	
    public Jobs(int jobId) {
        this.jobId = jobId;
    }
    public Jobs(int jobId, String jobTitle, Double minSalary, Double maxSalary, Set jobhistories, Set employees) {
       this.jobId = jobId;
       this.jobTitle = jobTitle;
       this.minSalary = minSalary;
       this.maxSalary = maxSalary;
       this.jobhistories = jobhistories;
       this.employees = employees;
    }
   
    public int getJobId() {
        return this.jobId;
    }
    
    public void setJobId(int jobId) {
        this.jobId = jobId;
    }
    public String getJobTitle() {
        return this.jobTitle;
    }
    
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    public Double getMinSalary() {
        return this.minSalary;
    }
    
    public void setMinSalary(Double minSalary) {
        this.minSalary = minSalary;
    }
    public Double getMaxSalary() {
        return this.maxSalary;
    }
    
    public void setMaxSalary(Double maxSalary) {
        this.maxSalary = maxSalary;
    }
    public Set getJobhistories() {
        return this.jobhistories;
    }
    
    public void setJobhistories(Set jobhistories) {
        this.jobhistories = jobhistories;
    }
    public Set getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set employees) {
        this.employees = employees;
    }




}


