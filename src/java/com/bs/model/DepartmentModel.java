/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bs.model;

import com.bs.pojo.Department;
import java.util.List;

/**
 *
 * @author User
 */
public interface DepartmentModel {
    public boolean doInsertDepartment(Department department);
    public boolean doUpdateDepartment(Department department);
    public boolean doDeleteDepartment(Department department);
    public List<Department> findAllDepartment();
    public List<Department> findByDepartmentId(int departmentId);
    public List<Integer> findAllManagerId();
    public List<Integer> findAllLocationId();
    public Department findAllDepartment2(); 
    
}
