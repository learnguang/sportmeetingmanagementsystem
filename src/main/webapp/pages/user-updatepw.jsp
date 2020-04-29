<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>我的信息</title>
    <!-- Tell the browser to be responsive to screen width -->
<%--    <meta content="width=device-width,initial-scale=1,maximum-scale=1" name="viewport">--%>
<%--    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>--%>
<%--    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>--%>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body class="hold-transition skin-green-light sidebar-mini layout-boxed ">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->


    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                修改密码
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/broadcast/main.do"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">修改密码</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div align="center">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">修改密码</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <%--                    <form id="form1" class="form-horizontal" action="/user/changePW.do" method="post">--%>
                    <div class="box-body">

                        <div class="form-group">
                            <label class="col-sm-4 control-label ">登录账号/Login
                                Account：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="uId" name="uId" readonly="readonly"
                                       value="<security:authentication property="principal.username"></security:authentication>">
                            </div>
                        </div>

                        <br>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-4 control-label ">原始密码/Original Password：</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="oldPassword" name="oldPassword"
                                       placeholder="请输入您的原始密码才能进行修改操作">
                                <span id="currentMsg"></span>
                            </div>
                        </div>

                        <br>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">新的密码/New
                                Password：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="newPassword" name="newPassword"
                                       placeholder="密码必须为4~20位，可由数字和字母或符号混合组成。">
                                <span id="newMsg"></span>
                            </div>
                        </div>

                        <br>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">确认密码/Confirm Password：</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="repeatPassword"
                                       name="repeatPassword"
                                       placeholder="请再输入一遍新的密码。">
                                <span id="confirmMsg"></span>
                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="button" class="btn btn-default" onclick="clearInput()">重置/Reset</button>
                        <button type="button" id="submit" class="btn btn-danger">保存/Submit</button>
                    </div>
                    <!-- /.box-footer -->
                    <%--                    </form>--%>
                </div>

            </div>

        </section>

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- 底部导航 /-->

</body>


<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script>

    $("#submit").click(function () {
        var data = {};
        var uId = $("#uId").val().toString();
        var oldPassword = $("#oldPassword").val().toString();
        var newPassword = $("#newPassword").val().toString();
        var repeatPassword = $("#repeatPassword").val().toString();

        if (oldPassword == "")
            alert("请输入原始密码");
        else if (newPassword == "")
            alert("请输入新的密码");
        else if (repeatPassword == "")
            alert("请输入确认密码");
        else if (oldPassword.length < 4 || oldPassword.length > 20 || newPassword.length < 4 || newPassword.length > 20)
            alert("密码长度必须为4~20位！");
        else if (newPassword != repeatPassword)
            alert("新密码和确认密码不一致");
        else if (newPassword == repeatPassword) {
            data['uId'] = uId;
            data['oldPassword'] = oldPassword;
            data['newPassword'] = newPassword;
            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType: 'application/json',//添加这句话
                url: "${pageContext.request.contextPath}/user/changePW.do", //提交的地址
                async: false,
                data: JSON.stringify(data),
                error: function (data) {  //失败的话
                    if (data == "400")
                        alert("原始密码错误，修改失败!");
                    else {
                        alert("修改成功!");
                        location.href = '${pageContext.request.contextPath}/logout.do';
                    }
                },
                success: function (data) {  //成功
                    if (data == "400")
                        alert("原始密码错误，修改失败!");
                    else {
                        alert("修改成功,请重新登录!");
                        location.href = '${pageContext.request.contextPath}/logout.do';
                    }
                }
            });
        } else
            alert("未知的错误");
    });


    // var flag = true;
    //
    function clearInput() {
        $("#oldPassword").val("");
        $("#newPassword").val("");
        $("#repeatPassword").val("");
        clearErrorMsg();
        document.getElementById("submit").setAttribute("disabled", "disabled");
    }

    //
    // function clearErrorMsg() {
    //     $("#currentMsg").html("");
    //     $("#newMsg").html("");
    //     $("#confirmMsg").html("");
    // }
    //
    // function checkInput1() {
    //     var oldPassword = $("#oldPassword").val();
    //     clearErrorMsg();
    //     checkPwdLength(oldPassword, "currentMsg", "oldPassword");
    //
    //     if (flag == true)
    //         document.getElementById("submit").removeAttribute("disabled", "disabled");
    //     else if (flag == false)
    //         document.getElementById("submit").setAttribute("disabled", "disabled");
    // }
    //
    // function checkInput2() {
    //     var oldPassword = $("#oldPassword").val();
    //     var newPassword = $("#newPassword").val();
    //     var repeatPassword = $("#repeatPassword").val();
    //     clearErrorMsg();
    //     checkPwdLength(oldPassword, "currentMsg", "oldPassword");
    //     checkPwdLength(newPassword, "newMsg", "newPassword");
    //     if (flag == true)
    //         document.getElementById("submit").removeAttribute("disabled", "disabled");
    //     else if (flag == false)
    //         document.getElementById("submit").setAttribute("disabled", "disabled");
    //
    // }
    //
    // function checkInput3() {
    //
    //     var oldPassword = $("#oldPassword").val();
    //     var newPassword = $("#newPassword").val();
    //     var repeatPassword = $("#repeatPassword").val();
    //
    //     clearErrorMsg();
    //     checkPwdLength(oldPassword, "currentMsg", "oldPassword");
    //     checkPwdLength(newPassword, "newMsg", "newPassword");
    //     checkPwdLength(repeatPassword, "confirmMsg", "repeatPassword");
    //
    //     if (flag == true)
    //         document.getElementById("submit").removeAttribute("disabled", "disabled");
    //     else if (flag == false)
    //         document.getElementById("submit").setAttribute("disabled", "disabled");
    // }
    //
    //
    // function checkPwdLength(obj, msg, id) {
    //     if ("" == obj) {
    //         $("#" + msg).html("该项不能为空！");
    //         flag = false;
    //     } else if (4 > obj.length || obj.length > 20) {
    //         $("#" + msg).html("密码长度为4-20个字符！");
    //         flag = false;
    //     } else if ($("#oldPassword").val() == $("#newPassword").val()) {
    //         $("#newMsg").html("新密码不能与原始密码相同！");
    //         flag = false;
    //     } else if ($("#newPassword").val() != $("#repeatPassword").val() && $("#repeatPassword").val() != "") {
    //         $("#confirmMsg").html("两次输入的密码不一致！");
    //         flag = false;
    //     } else {
    //         flag = true;
    //     }
    // }


    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("user-updatepw");


        // 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });


</script>


</html>