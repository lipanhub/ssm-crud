package com.frog.service;

import com.frog.bean.Employee;

import java.util.List;

public interface EmployeeService {

    public List<Employee> queryAll();

    public void addOne(Employee employee);

    public boolean checkEmp(String tmpEmpName);

    public Employee queryOneById(Integer id);

    public boolean updateEmp(Employee employee);

    public boolean deleteOneByPrimaryKey(Integer empId);

    public boolean deleteBatch(List<Integer> ids);
}
