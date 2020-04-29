<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- 页面头部 -->
<header class="main-header">
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/broadcast/main.do" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>运动会</b></span> <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>运动会</b>信息管理</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
           role="button"> <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/img/img.png" class="user-image" alt="User Image">
                        <span class="hidden-xs">
							<security:authentication property="principal.username"></security:authentication>
                        </span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li style="background-color: whitesmoke" class="user-header"><img
                                src="${pageContext.request.contextPath}/img/img.png"
                                class="img-circle" alt="User Image">
                            <div align="center">
                                <a href="/user/userDetails.do?uId=<security:authentication property="principal.username"></security:authentication>">
                                    <security:authentication property="principal.username"></security:authentication>
                                </a>

                            </div>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="${pageContext.request.contextPath}/user/updatePW.do" class="btn btn-primary">修改密码</a>
                            </div>
                            <div class="pull-right">
                                <a href="${pageContext.request.contextPath}/logout.do"
                                   class="btn btn-warning">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- 页面头部 /-->