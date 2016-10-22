/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.beans;

import com.bs.dao.RegionsDao;
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
@ManagedBean(name = "reg")
@RequestScoped
public class RegionsManagedBean {
    ApplicationContext ctx = new ClassPathXmlApplicationContext("com/bs/springConfigBean/regions.xml");
    private Regions regions = (Regions) ctx.getBean("regions");
     private RegionsDao regionsDao = (RegionsDao) ctx.getBean("regionsdao");
    private List<Regions> regionsListById=new ArrayList<Regions>();
    private List<Regions> regionsAllList=new ArrayList<Regions>();
    public RegionsManagedBean(){
        doViewAllRegions();
    }
    
    @Autowired
    public void doInsertRegions() {
        boolean r =regionsDao.doInsertRegions(regions);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }
    
    @Autowired
    public void doUpdateRegions() {
        
        boolean r = regionsDao.doUpdateRegions(regions);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }
    @Autowired
    public void doDeleteRegions() {
        boolean r = regionsDao.doDeleteRegions(regions);
        if (r) {
            addMessage("Success");
        } else {
            this.addMessage("Error please try again.");
        }
    }
    @Autowired
    public void doViewAll() {
       regions = regionsDao.findAllRegions();

    }
    @Autowired
    public void doViewAllRegions() {
       regionsAllList = regionsDao.findAllRegionsList();

    }

    @Autowired
    public void findByRegionsId() {

        regionsListById = regionsDao.findRegionsById(regions.getRegionsId());
        for (Regions reg : regionsListById) {
             regions.setRegionsId(reg.getRegionsId());
            regions.setRegionsName(reg.getRegionsName());
           
        }

    }
    public void addMessage(String summary) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null);
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public Regions getRegions() {
        return regions;
    }

    public void setRegions(Regions regions) {
        this.regions = regions;
    }
    


    public RegionsDao getRegionsDao() {
        return regionsDao;
    }

    public void setRegionsDao(RegionsDao regionsDao) {
        this.regionsDao = regionsDao;
    }

    public List<Regions> getRegionsListById() {
        return regionsListById;
    }

    public void setRegionsListById(List<Regions> regionsListById) {
        this.regionsListById = regionsListById;
    }

    public List<Regions> getRegionsAllList() {
        return regionsAllList;
    }

    public void setRegionsAllList(List<Regions> regionsAllList) {
        this.regionsAllList = regionsAllList;
    }
}
