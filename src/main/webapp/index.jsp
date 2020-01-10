<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>SSM CRUD</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js" ></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>

</head>
<body>

    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input"  class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="empName_update_static" name="empName" type="text" placeholder="Disabled input here..." disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="email" id="email_update_input" placeholder="aaa@aaa.aaa">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="W"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_update_select">

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 员工添加的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input"  class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="email" id="email_add_input" placeholder="aaa@aaa.aaa">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="W"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_add_select">

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_add_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>


    <div class="container">

    <div class="row">
        <div class="col-md-12">
            <h1>SSM CRUD 练习</h1>
        </div>
    </div>


    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button type="button" class="btn btn-success" id="emp_add_modal_btn" >新增</button>
            <button type="button" class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">

                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>


                <tbody>

                </tbody>

            </table>
        </div>
    </div>

    <div class="row">

        <div class="col-md-6" id="page_msg_area">

        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation" id="page_nav">
            </nav>
        </div>



    </div>


</div>


<script>


    var currentPageNum;

    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                build_emps_table(result);
                build_page_nav(result);
                build_page_msg(result);
            }
        });
    }


    function build_emps_table(result) {

        $("#emps_table tbody").empty();

        $("#check_all").prop("checked",false);

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,emp) {

            var checkboxTd = $("<td><input type='checkbox' class='check_item'/></td>");

            var empIdTd = $("<td></td>").append(emp.empId);
            var empNameTd = $("<td></td>").append(emp.empName);
            var genderTd = $("<td></td>").append(emp.gender=="W"?"女":"男");
            var emailTd = $("<td></td>").append(emp.email);
            var deptNameTd = $("<td></td>").append(emp.department.deptName);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit_id",emp.empId);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del_id",emp.empId);

            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);


            $("<tr></tr>").append(checkboxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    function build_page_msg(result) {
        $("#page_msg_area").empty();
        $("#page_msg_area").append("当前第"+result.extend.pageInfo.pageNum+"页,共"+result.extend.pageInfo.pages+"页 "+result.extend.pageInfo.total+"条记录。")
    }


    function build_page_nav(result) {

        $("#page_nav").empty();

        var firstPageLI = $("<li></li>").append($("<a></a>").append("首页"));


        var prePageLI = $("<li></li>")
            .append($("<a></a>").append($("<span></span>").append("&laquo;")));

        if(result.extend.pageInfo.hasPreviousPage){
            firstPageLI.click(function () {
                to_page(1);
            });
            prePageLI.click(function () {
                to_page(result.extend.pageInfo.prePage);
            });
        }else{
            firstPageLI.addClass("disabled");
            prePageLI.addClass("disabled");
        }

        var ul = $("<ul></ul>").addClass("pagination");
        ul.append(firstPageLI)
            .append(prePageLI);

        var pages = result.extend.pageInfo.navigatepageNums;
        $.each(pages,function (index,num) {
            if (num == result.extend.pageInfo.pageNum) {
                var li = $("<li></li>").addClass("active").append($("<a></a>").append(num));
                ul.append(li);

                currentPageNum = num;

            }else{
                var li = $("<li></li>").append($("<a></a>").append(num));
                li.click(function () {
                    to_page(num);
                });
                ul.append(li);
            }
        });

        var nextPageLI = $("<li></li>")
            .append($("<a></a>").append($("<span></span>").append("&raquo;")));

        var  lastPageLI = $("<li></li>").append($("<a></a>").append("末页"));

        if(result.extend.pageInfo.hasNextPage){
            nextPageLI.click(function () {
                to_page(result.extend.pageInfo.nextPage);
            });
            lastPageLI.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }else{
            nextPageLI.addClass("disabled");
            lastPageLI.addClass("disabled");
        }

        ul.append(nextPageLI)
            .append(lastPageLI);
        $("#page_nav").append(ul);
    }

    function resetForm(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }


    $("#emp_add_modal_btn").click(function () {
        resetForm("#empAddModal form");
        loadDepts("#dept_add_select");
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });


    function loadDepts(ele) {

        $(ele).empty();

        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                var depts = result.extend.departments;
                $.each(depts,function (index,dept) {
                    var option = $("<option></option>").attr("value",dept.deptId).append(dept.deptName);
                    $(ele).append(option);
                });
            }
        });
    }

    $("#empName_add_input").blur(function(){
        validate_empName_add_input();
    });

    $("#email_add_input").blur(function(){
        validate_email_add_input(this);
    });

    //校验表单数据
    function validate_empName_add_input(){

        tmpEmpName = $("#empName_add_input").val();


        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input","error","用户名为2-5中文或4-16英文数字组合");
            return false;
        }


        $.ajax({
            url:"${APP_PATH}/checkEmp",
            data:"tmpEmpName="+tmpEmpName,
            type:"GET",
            success:function (result) {
                if(result.code==200){
                    $("#empName_add_input").attr("ajax-va","error");
                    show_validate_msg("#empName_add_input","error","姓名重复");
                }else{
                    $("#empName_add_input").attr("ajax-va","success");
                    show_validate_msg("#empName_add_input","success","用户名可用");
                }
            }
        });
        return true;
    }
    function validate_email_add_input(ele){

        var empEmail = $(ele).val();
        var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if (!regEmail.test(empEmail)) {
            show_validate_msg(ele,"error","邮箱格式错误");
            return false;
        }else{
            show_validate_msg(ele,"success","");
        }
        return true;
    }
    //显示校验提示
    function show_validate_msg(ele,status,msg){
        //首先清空当前元素
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if ("error"==status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#emp_save_btn").unbind('click').click(function () {

        if(!validate_email_add_input() || !validate_empName_add_input($("#empName_add_input")) || $("#empName_add_input").attr("ajax-va")=="error"){
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {

                if(result.code == 200){
                    if(undefined == result.extend.msg.email){
                        show_validate_msg("#email_add_input","error",result.extend.msg.email);
                    }if(undefined == result.extend.msg.empName){
                        show_validate_msg("#empName_add_input","error",result.extend.msg.empName);
                    }
                }

                if(result.code == 100){
                    $("#empAddModal").modal("hide");
                    to_page(9999);
                }
            }
        });
    });





    $(document).on("click",".edit_btn",function () {

        $("#emp_update_save_btn").attr("edit_id",$(this).attr("edit_id"));
        resetForm("#empUpdateModal form");
        loadDepts("#dept_update_select");
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
        getEmp($(this).attr("edit_id"));
    });

    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result) {
                var emp = result.extend.emp;
                $("#empName_update_static").val(emp.empName);
                $("#email_update_input").val(emp.email);
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val([emp.dId]);
            }
        });
    }

    $("#email_update_input").blur(function(){
        validate_email_add_input(this);
    });

    $("#emp_update_save_btn").click(function () {

        if(!validate_email_add_input($("#email_update_input"))){
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                $("#empUpdateModal").modal("hide");
                to_page(currentPageNum);
            }
        });
    });


    $(document).on("click",".delete_btn",function () {


       var empName =  $(this).parents("tr").find("td:eq(2)").text();

       var empId = $(this).attr("del_id");
        if(confirm("确定要删除员工\""+empName+"\"吗")){
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPageNum);
                }
            });
        }
    });

    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    $(document).on("click",".check_item",function () {

        var flag = $(".check_item:checked").length == $(".check_item").length;

        $("#check_all").prop("checked",flag);

    });

    $("#emp_delete_all_btn").click(function () {

        var empNames = "";
        var ids = "";

        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text();
            empNames += ",";
            ids += $(this).parents("tr").find("td:eq(1)").text();
            ids += "-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        ids = ids.substring(0,ids.length-1);

        if(confirm("确定要删除["+empNames+"]吗")){
            $.ajax({
                url:"${APP_PATH}/emp/" + ids,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPageNum);
                }
            });
        }

    });


</script>

</body>
</html>
































