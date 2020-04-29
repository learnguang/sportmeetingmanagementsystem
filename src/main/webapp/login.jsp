<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/background/css/style.css">
</head>

<body>

<div id="particles">

    <div class="intro">
        <h1>运动会信息管理系统</h1>
        <p>An information management system for university sports meeting</p>
        <div class="lowin">
            <div class="lowin-brand">
                <img src="${pageContext.request.contextPath}/img/img.png" alt="logo">
            </div>
            <div class="lowin-wrapper">
                <div class="lowin-box lowin-login">
                    <div class="lowin-box-inner">
                        <form action="${pageContext.request.contextPath}/login.do" method="post">
                            <%--        onsubmit="return login(this)"            --%>
                            <p>登录</p>
                            <div class="lowin-group">
                                <label>账号
                                    <%--                            <a href="#" class="login-back-link">登录</a>--%>
                                </label>
                                <input id="username" type="text" name="username" class="lowin-input"
                                       required="required">
                            </div>
                            <div class="lowin-group password-group">
                                <label>密码
                                    <%--                            <a href="#" class="forgot-link">忘记密码</a>--%>
                                </label>
                                <input id="password" type="password" name="password" class="lowin-input"
                                       required="required">
                            </div>
                            <button type="submit" class="lowin-btn login-btn">
                                登录
                            </button>
                            <div class="text-foot">
                                报告！有问题需要<a href="" class="register-link">反馈</a>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="lowin-box lowin-register">
                    <div class="lowin-box-inner">
                        <%--                                        <form action="${pageContext.request.contextPath}/feedback/feedback.do" method="post" onsubmit="return feedback(this)">--%>
                        <p>报告！我要反馈</p>
                        <div class="lowin-group">
                            <label>您的姓名</label>
                            <input id="name" type="text" name="name" class="lowin-input" required="required">
                        </div>
                        <div class="lowin-group">
                            <label>您的电子邮箱</label>
                            <input id="email" type="email" name="email" class="lowin-input" required="required">
                        </div>
                        <div class="lowin-group">
                            <label>反馈的内容</label>
                            <textarea id="feedback" name="feedback" rows="3" cols="20" class="lowin-input"
                                      required="required"
                                      style="resize:none;"></textarea>
                        </div>
                        <button id="fb_buttom" type="button" class="lowin-btn">
                            反馈
                        </button>

                        <div class="text-foot">
                            没有其他问题了，返回<a href="" class="login-link">登录</a>
                        </div>
                        <%--                </form>--%>
                    </div>
                </div>
            </div>

            <footer class="lowin-footer">
                <div class="pull-right hidden-xs">
                    <b style="color: white">Version 4.0.0.331 </b>
                </div>
                <strong style="color: white">
                    Copyright &copy; 2019~2020 | <a style="color: white" href="https://github.com/ihandyyy"
                                                    target="_Blank"> <u>HandyJiang</u></a>
                    All rights reserved.
                </strong>
            </footer>
        </div>
    </div>
</div>
<script
        src="${pageContext.request.contextPath}/css/auth.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src='${pageContext.request.contextPath}/background/js/jquery.particleground.min.js'></script>
<script
        src='${pageContext.request.contextPath}/background/js/demo.js'></script>

<script>


    $("#fb_buttom").click(function () {
        var data = {};
        var name = $("#name").val().toString();
        var email = $("#email").val().toString();
        var feedback = $("#feedback").val().toString();

        if (name == "")
            alert("请输入姓名");
        else if (email == "")
            alert("请输入电子邮箱");
        else if (feedback == "")
            alert("请输入您要反馈的内容");
        else {
            data['name'] = name;
            data['email'] = email;
            data['feedback'] = feedback;
            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType: 'application/json',//添加这句话
                url: "${pageContext.request.contextPath}/feedback/feedback.do", //提交的地址
                async: false,
                data: JSON.stringify(data),
                error: function () {  //失败的话
                    alert("反馈失败!");
                },
                success: function (data) {  //成功
                    alert("反馈成功!");
                    location.reload();
                }
            });
        }

    });


    Auth.init({
        login_url: '#login',
        forgot_url: '#forgot'
    });
</script>
</body>
</html>