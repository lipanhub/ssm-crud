package com.frog.controller;


import com.frog.bean.Department;
import com.frog.bean.ResultInfo;
import com.frog.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public ResultInfo queryDepts(Model model){

        List<Department> departments = departmentService.queryAll();

        return ResultInfo.success().add("departments",departments);
    }
}
