/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.beans;

import com.bs.dao.JobHistoryDao;
import com.bs.pojo.Department;
import com.bs.pojo.Employee;
import com.bs.pojo.Jobhistory;
import com.bs.pojo.Jobs;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import org.apache.hadoop.mapred.JobHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

/**
 *
 * @author User
 */
@Component
@ManagedBean(name = "j")
@RequestScoped
public class JobHistoryManagedBean {

    public JobHistoryManagedBean() {
        doViewAllJobHistory();
        findByDepartmentId();
        findAllJobsId();
        findAllEmpId();
    }

    ApplicationContext ctx = new ClassPathXmlApplicationContext("com/bs/springConfigBean/jobhistory.xml");
    
    private Jobhistory jobhistory = (Jobhistory) ctx.getBean("jobhistory");
    private Jobs jobs = (Jobs) ctx.getBean("jobs");
    private Department department = (Department) ctx.getBean("department");
    JobHistoryDao jobhistorydao = (JobHistoryDao) ctx.getBean("jobhistorydao");
    private Employee employee = (Employee) ctx.getBean("employee");
    private List<Jobhistory> jobhistoryallList = new ArrayList<>();
    private List<Integer> allJobsId = new ArrayList<>();
    private List<Jobhistory> jobhistorylistbyid = new ArrayList<>();
    private List<Integer> allDeptId = new ArrayList<>();
    private List<Integer> allEmpId = new ArrayList<>();
    private List<Employee> allEmployeeListById = new ArrayList<>();

    @Autowired
    public void doInsertJobHistory() {
        jobhistory.setJobs(jobs);
        jobhistory.setDepartment(department);
        jobhistory.setEmployee(employee);
        boolean r = jobhistorydao.doInsertJobhistory(jobhistory);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }

    @Autowired
    public void doUpdateJobHistory() {
        jobhistory.setJobs(jobs);
        jobhistory.setDepartment(department);
        boolean r = jobhistorydao.doUpdateJobhistory(jobhistory);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }

    @Autowired
    public void doDeleteJobHistory() {
        jobhistory.setJobs(jobs);
        jobhistory.setDepartment(department);
        boolean r = jobhistorydao.doDeleteJJobhistory(jobhistory);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }

    @Autowired
    public void doViewAllJobHistory() {
        jobhistoryallList = jobhistorydao.findAllJobhistory();

    }

    @Autowired
    public void findByJobHistoryId() {

        jobhistorylistbyid = jobhistorydao.findByJobhistoryId(jobhistory.getEmpId());
        for (Jobhistory b : jobhistorylistbyid) {
            jobhistory.setStartDate(b.getStartDate());
            jobhistory.setEndDate(b.getEndDate());
            jobhistory.setJobs(b.getJobs());
            jobhistory.setDepartment(b.getDepartment());
        }

    }

    @Autowired
    public void findByDepartmentId() {

      allDeptId=jobhistorydao.findAllDeptId();

    }

    @Autowired
    public void findAllJobsId() {
        allJobsId=jobhistorydao.findAllJobId();

    }
    @Autowired
    public void findAllEmpId() {
        allEmpId=jobhistorydao.findAllEmployeeId();

    }
    @Autowired
    public void findByEmployeeId() {

        allEmployeeListById = jobhistorydao.allEmployeeList(employee.getEmpId());
        for (Employee e : allEmployeeListById) {
                jobhistory.setStartDate(e.getHireDate());
//                jobhistory.setEndDate(e.getHireDate());
        }

    }

    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public Jobhistory getJobhistory() {
        return jobhistory;
    }

    public void setJobhistory(Jobhistory jobhistory) {
        this.jobhistory = jobhistory;
    }

    public Jobs getJobs() {
        return jobs;
    }

    public void setJobs(Jobs jobs) {
        this.jobs = jobs;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Jobhistory> getJobhistoryallList() {
        return jobhistoryallList;
    }

    public void setJobhistoryallList(List<Jobhistory> jobhistoryallList) {
        this.jobhistoryallList = jobhistoryallList;
    }

    public List<Integer> getAllJobsId() {
        return allJobsId;
    }

    public void setAllJobsId(List<Integer> allJobsId) {
        this.allJobsId = allJobsId;
    }

    public List<Jobhistory> getJobhistorylistbyid() {
        return jobhistorylistbyid;
    }

    public void setJobhistorylistbyid(List<Jobhistory> jobhistorylistbyid) {
        this.jobhistorylistbyid = jobhistorylistbyid;
    }

    public List<Integer> getAllDeptId() {
        return allDeptId;
    }

    public void setAllDeptId(List<Integer> allDeptId) {
        this.allDeptId = allDeptId;
    }


    public List<Integer> getAllEmpId() {
        return allEmpId;
    }

    public void setAllEmpId(List<Integer> allEmpId) {
        this.allEmpId = allEmpId;
    }

    public List<Employee> getAllEmployeeListById() {
        return allEmployeeListById;
    }

    public void setAllEmployeeListById(List<Employee> allEmployeeListById) {
        this.allEmployeeListById = allEmployeeListById;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

}
