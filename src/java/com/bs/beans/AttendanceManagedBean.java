/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.beans;

import com.bs.dao.AttendanceDao;
import com.bs.pojo.Attendance;
import com.bs.pojo.Employee;
import com.bs.pojo.Manager;
import com.bs.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

/**
 *
 * @author use
 */
@Component
@ManagedBean(name = "atn")
@RequestScoped
public class AttendanceManagedBean {

    ApplicationContext ctx = new ClassPathXmlApplicationContext("com/bs/springConfigBean/attendance.xml");
    private Attendance attendance = (Attendance) ctx.getBean("attendance");
    AttendanceDao attendancedao = (AttendanceDao) ctx.getBean("attendanceDao");
    private List<Attendance> attendanceallList = new ArrayList<>();
    private List<Employee> employeeAllList = new ArrayList<>();
    private List<Manager> managerAllList = new ArrayList<>();
    private List<Attendance> attendancelistbyid = new ArrayList<>();
    private String[] sts = new String[1024];
    Employee emp=(Employee) ctx.getBean("employee");
    
    private Integer AId;
     private Employee employee;
     private String empName;
     private Date date;
     private Integer present;
     private Integer absent;
     private Integer late;
     private String status;
     private Set srs = new HashSet(0);

    public AttendanceManagedBean() {
        doViewAllAttendance();
        doViewAllManager();
        doViewAllEmployee();

    }

    @Autowired
    public void doInsertAttendance() {
        
        Attendance at = new Attendance();
        int c = 0;
        for (Employee p : employeeAllList) {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            at.setEmployee(p);
            at.setEmpName(p.getEmpName());
            at.setDate(getDate());
            if (sts[c].equals("Present")) {
                at.setPresent(1);
                at.setStatus(sts[c]);
            } else {
                at.setPresent(0);
            }
            if (sts[c].equals("Absent")) {
                at.setAbsent(1);
                at.setStatus(sts[c]);
            } else {
                at.setAbsent(0);
            }
            if (sts[c].equals("Late")) {
                at.setLate(1);
                at.setStatus(sts[c]);
            } else {
                at.setLate(0);
            }

            s.save(at);
            s.getTransaction().commit();
            s.close();
            c++;
        }

    }
    @Autowired
    public void doUpdateAttendance() {
        
        Attendance at = new Attendance();
        
        int c = 0;
        for (Attendance a : attendanceallList) {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            at.setEmployee(a.getEmployee());
            at.setAId(a.getAId());
            at.setEmpName(a.getEmpName());
            at.setDate(getDate());
            if (sts[c].equals("Present")) {
                at.setPresent(1);
                at.setStatus(sts[c]);
            } else {
                at.setPresent(0);
            }
            if (sts[c].equals("Absent")) {
                at.setAbsent(1);
                at.setStatus(sts[c]);
            } else {
                at.setAbsent(0);
            }
            if (sts[c].equals("Late")) {
                at.setLate(1);
                at.setStatus(sts[c]);
            } else {
                at.setLate(0);
            }

            s.update(at);
            s.getTransaction().commit();
            s.close();
            c++;
        }

    }
   
    @Autowired
    public void doDeleteAttendance() {
        
        Attendance at = new Attendance();
        int c = 0;
         for (Attendance a : attendanceallList) {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            at.setEmployee(a.getEmployee());
            at.setAId(a.getAId());
            at.setEmpName(a.getEmpName());
            at.setDate(getDate());
            if (sts[c].equals("Present")) {
                at.setPresent(1);
                at.setStatus(sts[c]);
            } else {
                at.setPresent(0);
            }
            if (sts[c].equals("Absent")) {
                at.setAbsent(1);
                at.setStatus(sts[c]);
            } else {
                at.setAbsent(0);
            }
            if (sts[c].equals("Late")) {
                at.setLate(1);
                at.setStatus(sts[c]);
            } else {
                at.setLate(0);
            }

            s.delete(at);
            s.getTransaction().commit();
            s.close();
            c++;
        }

    }

   

    

    @Autowired
    public void doViewAllAttendance() {
        attendanceallList = attendancedao.findAllAttendance();

    }

    @Autowired
    public void doViewAllEmployee() {
        employeeAllList = attendancedao.findAllEmployee();
    }

    @Autowired
    public void doViewAllManager() {
        managerAllList = attendancedao.findAllManager();

    }

    @Autowired
    public void findByAttendance() {
        Attendance at = new Attendance();
        attendancelistbyid = attendancedao.findByAttendanceId(attendance.getDate());
        employee=attendance.getEmployee();
        for (Attendance atn : attendancelistbyid) {
            attendance.setEmpName(empName);
            attendance.setEmpName(atn.getEmpName());
            attendance.setStatus(atn.getStatus());
        }

    }

    @Autowired
    public void checkStatus() {
        if (attendance.getStatus().equalsIgnoreCase("Present")) {
            attendance.setPresent(1);
        }
        if (attendance.getStatus().equalsIgnoreCase("Absent")) {
            attendance.setAbsent(1);
        }
        if (attendance.getStatus().equalsIgnoreCase("Late")) {
            attendance.setLate(1);
        }
    }

    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public Attendance getAttendance() {
        return attendance;
    }

    public void setAttendance(Attendance attendance) {
        this.attendance = attendance;
    }

    public List<Attendance> getAttendanceallList() {
        return attendanceallList;
    }

    public void setAttendanceallList(List<Attendance> attendanceallList) {
        this.attendanceallList = attendanceallList;
    }

    public List<Attendance> getAttendancelistbyid() {
        return attendancelistbyid;
    }

    public void setAttendancelistbyid(List<Attendance> attendancelistbyid) {
        this.attendancelistbyid = attendancelistbyid;
    }

    public List<Employee> getEmployeeAllList() {
        return employeeAllList;
    }

    public void setEmployeeAllList(List<Employee> employeeAllList) {
        this.employeeAllList = employeeAllList;
    }

    public List<Manager> getManagerAllList() {
        return managerAllList;
    }

    public void setManagerAllList(List<Manager> managerAllList) {
        this.managerAllList = managerAllList;
    }

    public String[] getSts() {
        return sts;
    }

    public void setSts(String[] sts) {
        this.sts = sts;
    }

    public Integer getAId() {
        return AId;
    }

    public void setAId(Integer AId) {
        this.AId = AId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getPresent() {
        return present;
    }

    public void setPresent(Integer present) {
        this.present = present;
    }

    public Integer getAbsent() {
        return absent;
    }

    public void setAbsent(Integer absent) {
        this.absent = absent;
    }

    public Integer getLate() {
        return late;
    }

    public void setLate(Integer late) {
        this.late = late;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    

}
