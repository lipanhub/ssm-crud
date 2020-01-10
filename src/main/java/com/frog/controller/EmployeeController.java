package com.frog.controller;


import com.frog.bean.Employee;
import com.frog.bean.ResultInfo;
import com.frog.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.omg.PortableInterceptor.RequestInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @RequestMapping("/emps")
    public ResultInfo queryEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn){

        PageHelper.startPage(pn,9);
        List<Employee> emps = employeeService.queryAll();
        PageInfo pageInfo = new PageInfo(emps,7);

        return ResultInfo.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public ResultInfo addEmp(@Valid Employee employee, BindingResult result ){


        if(!result.hasErrors()){
            employeeService.addOne(employee);
            return ResultInfo.success();
        }else{

            Map<String,String> msg  = new HashMap<String,String>();

            List<FieldError> errors = result.getFieldErrors();

            for(FieldError e:errors){
                msg.put(e.getField(),e.getDefaultMessage());
            }
            return ResultInfo.fail().add("msg",msg);
        }


    }

    @ResponseBody
    @RequestMapping("/checkEmp")
    public ResultInfo checkEmp(@RequestParam("tmpEmpName")String tmpEmpName){

        boolean flag = employeeService.checkEmp(tmpEmpName);

        if (flag){
            return ResultInfo.success();
        }else{
            return ResultInfo.fail();
        }

    }



    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public ResultInfo queryEmp(@PathVariable("id")Integer id){

        Employee employee = employeeService.queryOneById(id);
        return ResultInfo.success().add("emp",employee);
    }



    @ResponseBody
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    public ResultInfo updateEmp(Employee employee){

        boolean flag = employeeService.updateEmp(employee);
        if(flag){
            return ResultInfo.success();
        }else{
            return ResultInfo.fail();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{empIdStr}" ,method =RequestMethod.DELETE)
    public ResultInfo deleteEmp(@PathVariable("empIdStr")String empIdStr){
        boolean flag;
        if (empIdStr.contains("-")){

            List<Integer> ids = new ArrayList<Integer>();

            String[] idsStr = empIdStr.split("-");
            for (String idStr:idsStr) {
                ids.add(Integer.parseInt(idStr));
            }
            flag = employeeService.deleteBatch(ids);

        }else {

            Integer empId = Integer.parseInt(empIdStr);
            flag = employeeService.deleteOneByPrimaryKey(empId);
        }


        if(flag){
            return ResultInfo.success();
        }else{
            return ResultInfo.fail();
        }

    }

}
