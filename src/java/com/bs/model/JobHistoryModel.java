/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.model;

import com.bs.pojo.Department;
import com.bs.pojo.Employee;
import com.bs.pojo.Jobhistory;
import com.bs.pojo.Jobs;
import java.util.List;

/**
 *
 * @author User
 */
public interface JobHistoryModel {
    public boolean doInsertJobhistory(Jobhistory jobhistory);
    public boolean doUpdateJobhistory(Jobhistory jobhistory);
    public boolean doDeleteJJobhistory(Jobhistory jobhistory);
    public List<Jobhistory> findAllJobhistory();
    public List<Integer> findAllJobId();
    public List<Integer> findAllDeptId();
    public List<Jobhistory> findByJobhistoryId(int empId);
    public Jobhistory findAllJobhistory2(); 
    public List<Employee> allEmployeeList(int empId);
   public List<Integer> findAllEmployeeId();
}
