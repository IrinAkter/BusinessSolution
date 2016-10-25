/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.beans;

import com.bs.dao.DepartmentDao;
import com.bs.pojo.Department;
import com.bs.pojo.Location;
import com.bs.pojo.Manager;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

/**
 *
 * @author User
 */
@Component
@ManagedBean(name = "d")
@RequestScoped
public class DepartmentManagedBean {

    public DepartmentManagedBean() {
        doViewAllDepartment();
        findAllLocationId();
        findAllManagerId();
    }
    ApplicationContext ctx = new ClassPathXmlApplicationContext("com/bs/springConfigBean/department.xml");
    private Department department = (Department) ctx.getBean("department");
    private Location location = (Location) ctx.getBean("location");
    private Manager manager = (Manager) ctx.getBean("manager");
    private DepartmentDao departmentdao = (DepartmentDao) ctx.getBean("departmentdao");
    private List<Department> departmentallList = new ArrayList<>();
    private List<Integer> allManagerId = new ArrayList<>();
    private List<Department> departmentlistbyid = new ArrayList<>();
    private List<Integer> allLocationId = new ArrayList<>();

    @Autowired
    public void doInsertDepartment() {
        department.setManager(manager);
        department.setLocation(location);
        boolean r = departmentdao.doInsertDepartment(department);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Eroor please try again.");
        }
    }

    @Autowired
    public void doUpdateDepartment() {
        department.setManager(manager);
        department.setLocation(location);
        boolean r = departmentdao.doUpdateDepartment(department);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Eroor please try again.");
        }
    }

    @Autowired
    public void doDeleteDepartment() {
        department.setManager(manager);
        department.setLocation(location);
        boolean r = departmentdao.doDeleteDepartment(department);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Eroor please try again.");
        }
    }

    @Autowired
    public void doViewAllDepartment() {
        departmentallList = departmentdao.findAllDepartment();
//        department = departmentdao.findAllDepartment2();
//        manager=department.getManager();
//        location=department.getLocation();

    }

    @Autowired
    public void findByDepartmentId() {

        departmentlistbyid = departmentdao.findByDepartmentId(department.getDepartmentId());
        for (Department d : departmentlistbyid) {
            department.setDepartmentName(d.getDepartmentName());
            department.setManager(d.getManager());
            department.setLocation(d.getLocation());
        }

    }

    @Autowired
    public void findAllLocationId() {

        allManagerId = departmentdao.findAllManagerId();
    }

    @Autowired
    public void findAllManagerId() {
        allLocationId = departmentdao.findAllLocationId();
    }

    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public DepartmentDao getDepartmentdao() {
        return departmentdao;
    }

    public void setDepartmentdao(DepartmentDao departmentdao) {
        this.departmentdao = departmentdao;
    }

    public List<Department> getDepartmentallList() {
        return departmentallList;
    }

    public void setDepartmentallList(List<Department> departmentallList) {
        this.departmentallList = departmentallList;
    }

    public List<Integer> getAllManagerId() {
        return allManagerId;
    }

    public void setAllManagerId(List<Integer> allManagerId) {
        this.allManagerId = allManagerId;
    }

    public List<Department> getDepartmentlistbyid() {
        return departmentlistbyid;
    }

    public void setDepartmentlistbyid(List<Department> departmentlistbyid) {
        this.departmentlistbyid = departmentlistbyid;
    }

    public List<Integer> getAllLocationId() {
        return allLocationId;
    }

    public void setAllLocationId(List<Integer> allLocationId) {
        this.allLocationId = allLocationId;
    }

}
