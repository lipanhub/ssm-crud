package com.frog.service.impl;

import com.frog.bean.Employee;
import com.frog.bean.EmployeeExample;
import com.frog.dao.EmployeeMapper;
import com.frog.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.xml.ws.ServiceMode;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiseImpl implements EmployeeService {

    @Autowired
    EmployeeMapper  employeeMapper;


    @Override
    public List<Employee> queryAll() {

        List<Employee> list = employeeMapper.selectByExampleWithDept(null);

        return list;
    }

    @Override
    public void addOne(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean checkEmp(String tmpEmpName) {

        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();

        criteria.andEmpNameEqualTo(tmpEmpName);

        System.out.println(employeeMapper.countByExample(example));

        return  employeeMapper.countByExample(example) == 0;
    }

    @Override
    public Employee queryOneById(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(id);

        return employee;
    }

    @Override
    public boolean updateEmp(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee)!=0;
    }

    @Override
    public boolean deleteOneByPrimaryKey(Integer empId) {
        return employeeMapper.deleteByPrimaryKey(empId) != 0;
    }

    @Override
    public boolean deleteBatch(List<Integer> ids) {

        EmployeeExample example = new EmployeeExample();

        EmployeeExample.Criteria criteria = example.createCriteria();

        criteria.andEmpIdIn(ids);


        return employeeMapper.deleteByExample(example) != 0;
    }
}
