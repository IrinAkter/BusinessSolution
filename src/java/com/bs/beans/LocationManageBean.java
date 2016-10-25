/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.beans;

import com.bs.dao.LocationDao;
import com.bs.pojo.Employee;
import com.bs.pojo.Location;
import com.bs.pojo.Regions;
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
@ManagedBean(name = "lo")
@RequestScoped
public class LocationManageBean {

    ApplicationContext ctx = new ClassPathXmlApplicationContext("com/bs/springConfigBean/location.xml");
	
    private Location location = (Location) ctx.getBean("location");
    private Employee employee = (Employee) ctx.getBean("employee");
    private Regions regions = (Regions) ctx.getBean("regions");
    LocationDao locationDao = (LocationDao) ctx.getBean("locationdao");

    private List<Location> locationListById = new ArrayList<>();
    private List<Location> locationAllList=new ArrayList<>();
    private List<Integer> regionsAllList=new ArrayList<>();


    public LocationManageBean() {
        doViewAllLocation();
        allRegionsId();
    }

    @Autowired
    public void doInsertLocation() {
        location.setEmployee(employee);
        boolean r = locationDao.doInsertLocation(location);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }

    @Autowired
    public void doUpdateLocation() {
        location.setEmployee(employee);
        boolean r = locationDao.doUpdateLocation(location);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }

    @Autowired
    public void doDeleteLocation() {
        location.setEmployee(employee);
        boolean r = locationDao.doDeleteLocation(location);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }

    @Autowired
    public void doViewAllLocation() {
        locationAllList = locationDao.findAllLocation();
        location=locationDao.allLocation();
        employee=location.getEmployee();
        regions=location.getRegions();
    }
    @Autowired
    public void allRegionsId() {
        regionsAllList = locationDao.findAllRegionsId();

    }

    @Autowired
    public void findAllLocationById() {
        locationListById = locationDao.findByLocationId(location.getLocId());
        for (Location lo : locationListById) {
            location.setLocName(lo.getLocName());
            location.setEmployee(lo.getEmployee());
            location.setRegions(lo.getRegions());
        }

    }

    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public List<Location> getLocationAllList() {
        List<Location> locationAllList;
        return this.locationAllList;

    }

    public void setLocationAllList(List<Location> locationAllList) {
        this.locationAllList = locationAllList;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public List<Location> getLocationListById() {
        return locationListById;
    }

    public void setLocationListById(List<Location> locationListById) {
        this.locationListById = locationListById;
    }

    public List<Integer> getRegionsAllList() {
        return regionsAllList;
    }

    public void setRegionsAllList(List<Integer> regionsAllList) {
        this.regionsAllList = regionsAllList;
    }

    public Regions getRegions() {
        return regions;
    }

    public void setRegions(Regions regions) {
        this.regions = regions;
    }

}
