/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.dao;

import com.bs.model.JobHistoryModel;
import com.bs.pojo.Employee;
import com.bs.pojo.Jobhistory;
import com.bs.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class JobHistoryDao implements JobHistoryModel{

    @Override
    public boolean doInsertJobhistory(Jobhistory jobhistory) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.save(jobhistory);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public boolean doUpdateJobhistory(Jobhistory jobhistory) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.update(jobhistory);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public boolean doDeleteJJobhistory(Jobhistory jobhistory) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.delete(jobhistory);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public List<Jobhistory> findAllJobhistory() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Jobhistory");
            List<Jobhistory> bList = q.list();

            s.getTransaction().commit();
            return bList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }

    @Override
    public List<Integer> findAllJobId() {
       Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("Select jobId From Jobs");
            List<Integer> bList = q.list();
            s.getTransaction().commit();
            return bList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        } 
    }

    @Override
    public List<Integer> findAllDeptId() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("Select departmentId From Department");
            List<Integer> bList = q.list();
            s.getTransaction().commit();
            return bList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        } 
    }

    @Override
    public List<Jobhistory> findByJobhistoryId(int empId) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Jobhistory where empId=" + empId + "");
            List<Jobhistory> bList = q.list();
            s.getTransaction().commit();
            return bList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }

    @Override
    public Jobhistory findAllJobhistory2() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            Jobhistory jobh=new Jobhistory();
            s.beginTransaction();
            Query q = s.createQuery("From Jobhistory");
            List<Jobhistory> bList = q.list();
            jobh=bList.get(0);
            s.getTransaction().commit();
            return jobh;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }

     @Override
    public List<Integer> findAllEmployeeId() {
         Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("Select empId From Employee");
            List<Integer> bList = q.list();
            s.getTransaction().commit();
            return bList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }

    @Override
    public List<Employee> allEmployeeList(int empId) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Employee where empId="+empId+"");
            List<Employee> eList = q.list();
            s.getTransaction().commit();
            return eList;
        } catch (Exception e) {
            return null;
        } finally {
            s.close();
        }
    }

    
}
