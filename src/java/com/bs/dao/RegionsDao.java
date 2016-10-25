/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.dao;

import com.bs.model.RegionsModel;
import com.bs.pojo.Address;
import com.bs.pojo.Regions;
import com.bs.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

/**
 *
 * @author User
 */
@Service
public class RegionsDao implements RegionsModel{

    @Override
    public boolean doInsertRegions(Regions regions) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.save(regions);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public boolean doUpdateRegions(Regions regions) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.update(regions);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public boolean doDeleteRegions(Regions regions) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.delete(regions);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public Regions findAllRegions() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            Regions regions=new Regions();
            s.beginTransaction();
            Query q = s.createQuery("From Regions");
            List<Regions> rList = q.list();
            s.getTransaction().commit();
            regions=rList.get(0);
            return regions;
        } catch (Exception e) {
            return null;
        } finally {
            s.close();
        }
    }

    @Override
    public List<Regions> findRegionsById(int regionsId) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Regions where regionsId=" + regionsId + "");
            List<Regions> rList = q.list();
            s.getTransaction().commit();
            return rList;
        } catch (Exception e) {
            return null;
        } finally {
            s.close();
        }
    }

    @Override
    public List<Regions> findAllRegionsList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Regions");
            List<Regions> rList = q.list();
            s.getTransaction().commit();
            return rList;
        } catch (Exception e) {
            return null;
        } finally {
            s.close();
        }
    }

  
    
}
