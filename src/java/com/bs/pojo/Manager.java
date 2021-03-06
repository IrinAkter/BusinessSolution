package com.bs.pojo;
// Generated Oct 18, 2016 6:42:00 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Manager generated by hbm2java
 */
public class Manager  implements java.io.Serializable {


     private Integer MId;
     private Employee employee;
     private String MName;
     private Set departments = new HashSet(0);
     private Set suppervisors = new HashSet(0);
     private Set employees = new HashSet(0);

    public Manager() {
    }

    public Manager(Employee employee, String MName, Set departments, Set suppervisors, Set employees) {
       this.employee = employee;
       this.MName = MName;
       this.departments = departments;
       this.suppervisors = suppervisors;
       this.employees = employees;
    }
   
    public Integer getMId() {
        return this.MId;
    }
    
    public void setMId(Integer MId) {
        this.MId = MId;
    }
    public Employee getEmployee() {
        return this.employee;
    }
    
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    public String getMName() {
        return this.MName;
    }
    
    public void setMName(String MName) {
        this.MName = MName;
    }
    public Set getDepartments() {
        return this.departments;
    }
    
    public void setDepartments(Set departments) {
        this.departments = departments;
    }
    public Set getSuppervisors() {
        return this.suppervisors;
    }
    
    public void setSuppervisors(Set suppervisors) {
        this.suppervisors = suppervisors;
    }
    public Set getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set employees) {
        this.employees = employees;
    }




}


