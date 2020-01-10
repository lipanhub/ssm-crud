package com.frog.service.impl;

import com.frog.bean.Department;
import com.frog.bean.Employee;
import com.frog.dao.DepartmentMapper;
import com.frog.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> queryAll() {
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }
}
