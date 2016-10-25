/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.dao;

import com.bs.model.DepartmentModel;
import com.bs.pojo.BManager;
import com.bs.pojo.Department;
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
public class DepartmentDao implements DepartmentModel{

    @Override
    public boolean doInsertDepartment(Department department) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.save(department);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public boolean doUpdateDepartment(Department department) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.update(department);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public boolean doDeleteDepartment(Department department) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            s.delete(department);
            s.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;

        } finally {
            s.close();
        }
    }

    @Override
    public List<Department> findAllDepartment() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Department");
            List<Department> dList = q.list();
            s.getTransaction().commit();
            return dList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }

    @Override
    public List<Department> findByDepartmentId(int departmentId) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("From Department where departmentId=" + departmentId + "");
            List<Department> dList = q.list();
            s.getTransaction().commit();
            return dList;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }

    @Override
    public List<Integer> findAllManagerId() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("SELECT MId From Manager");
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
    public List<Integer> findAllLocationId() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query q = s.createQuery("SELECT locId From Location");
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
    public Department findAllDepartment2() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            Department dept=new Department();
            s.beginTransaction();
            Query q = s.createQuery("From Department");
            List<Department> dlist=q.list();
            dept=dlist.get(0);
            s.getTransaction().commit();
            return dept;
        } catch (Exception e) {
            return null;

        } finally {
            s.close();
        }
    }
    
}
