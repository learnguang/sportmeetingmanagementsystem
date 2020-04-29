<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/img.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <security:authentication property="principal.username"></security:authentication>
                </p>
                <a href="#">
                    <i class="fa fa-circle text-success"></i> 在线
                </a>
            </div>
        </div>

        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li id="admin-index">
                <a href="${pageContext.request.contextPath}/broadcast/main.do">
                    <i class="fa fa-home"></i>
                    <span>首页</span>
                </a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i>
                    <span>我的信息</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                <ul class="treeview-menu">
                    <li id="user-list">
                        <a href="${pageContext.request.contextPath}/user/userDetails.do?uId=<security:authentication property="principal.username"></security:authentication>">
                            <i class="fa fa-circle-o"></i> 我的信息
                        </a>
                    </li>
                    <li id="user-updatepw">
                        <a href="${pageContext.request.contextPath}/user/updatePW.do?uId=<security:authentication property="principal.username"></security:authentication>">
                            <i class="fa fa-circle-o"></i> 密码修改
                        </a>
                    </li>
                </ul>
            </li>

            <security:authorize access="hasRole('USER')">
                <li class="treeview">
                    <a href="#"> <i class="fa fa-trophy"></i>
                        <span>参加比赛</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="participateEvent-list">
                            <a href="${pageContext.request.contextPath}/event/participateEvent.do?uId=<security:authentication property="principal.username"></security:authentication>">
                                <i class="fa fa-circle-o"></i> 项目列表
                            </a></li>
                        <li id="user-participate"><a
                                href="${pageContext.request.contextPath}/matches/myParticipate.do?uId=<security:authentication property="principal.username"></security:authentication>">
                            <i class="fa fa-circle-o"></i> 我的参赛
                        </a></li>
                    </ul>
                </li>
            </security:authorize>

            <li class="treeview">
                <a href="#"> <i class="fa fa-bar-chart"></i>
                    <span>运动信息</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right">
                        </i>
				</span>
                </a>
                <ul class="treeview-menu">
                    <li id="sportmeeting-list">
                        <a href="${pageContext.request.contextPath}/sportmeeting/findAll.do">
                            <i class="fa fa-circle-o"></i> 运动会开幕信息
                        </a>
                    </li>
                    <li id="broadcast-list">
                        <a href="${pageContext.request.contextPath}/broadcast/findAll.do">
                            <i class="fa fa-circle-o"></i> 运动会广播信息
                        </a>
                    </li>
                    <li id="event-list">
                        <a href="${pageContext.request.contextPath}/event/findAll.do">
                            <i class="fa fa-circle-o"></i> 比赛项目信息
                        </a></li>
                    <li id="matches-list">
                        <a href="${pageContext.request.contextPath}/matches/findAll.do">
                            <i class="fa fa-circle-o"></i> 比赛成绩信息
                        </a>
                    </li>
                    <li id="equipment-list"><a
                            href="${pageContext.request.contextPath}/equipment/findAll.do">
                        <i class="fa fa-circle-o"></i> 运动器材信息
                    </a></li>
                </ul>
            </li>

            <security:authorize access="hasRole('ADMIN')">
                <li class="treeview"><a href="#"> <i class="fa fa-users"></i>
                    <span>院系人员</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                    <ul class="treeview-menu">
                        <li id="student-list"><a
                                href="${pageContext.request.contextPath}/student/findAll.do">
                            <i class="fa fa-circle-o"></i> 学生信息
                        </a></li>
                        <li id="teacher-list"><a
                                href="${pageContext.request.contextPath}/teacher/findAll.do">
                            <i class="fa fa-circle-o"></i> 教师信息
                        </a></li>
                        <li id="classes-list"><a
                                href="${pageContext.request.contextPath}/classes/findAll.do">
                            <i class="fa fa-circle-o"></i> 班级信息
                        </a></li>
                        <li id="department-list"><a
                                href="${pageContext.request.contextPath}/department/findAll.do">
                            <i class="fa fa-circle-o"></i> 院系信息
                        </a></li>
                    </ul>
                </li>
            </security:authorize>

            <security:authorize access="hasRole('ADMIN')">
                <li id="sportmeeting-manage">
                    <a href="${pageContext.request.contextPath}/sportmeeting/manage.do">
                        <i class="fa fa-hand-o-right"></i>
                        <span>开幕管理</span> <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
				        </span>
                    </a>
                </li>
            </security:authorize>

            <security:authorize access="hasRole('ADMIN')">
                <li id="broadcast-manage">
                    <a href="${pageContext.request.contextPath}/broadcast/manage.do">
                        <i class="fa fa-hand-o-right"></i>
                        <span>广播管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
				        </span>
                    </a>
                </li>
            </security:authorize>

            <security:authorize access="hasRole('ADMIN')">
                <li id="event-manage">
                    <a href="${pageContext.request.contextPath}/event/manage.do">
                        <i class="fa fa-hand-o-right"></i>
                        <span>项目管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			    	    </span>
                    </a>
                </li>
            </security:authorize>

            <security:authorize access="hasRole('ADMIN')">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-hand-o-right"></i>
                        <span>成绩管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			        	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="matches-manage">
                            <a href="${pageContext.request.contextPath}/matches/manage.do">
                                <i class="fa fa-circle-o"></i>成绩列表
                            </a>
                        </li>
                        <li id="matches-input">
                            <a href="${pageContext.request.contextPath}/matches/input.do">
                                <i class="fa fa-circle-o"></i>成绩录入
                            </a>
                        </li>
                    </ul>
                    </a>
                </li>
            </security:authorize>

            <security:authorize access="hasRole('ADMIN')">
                <li class="treeview"><a href="#"> <i class="fa fa-hand-o-right"></i>
                    <span>器材管理</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                    <ul class="treeview-menu">
                        <li id="equipment-manage">
                            <a href="${pageContext.request.contextPath}/equipment/manage.do">
                                <i class="fa fa-circle-o"></i> 器材采购管理
                            </a></li>
                        <li id="borrow-manage">
                            <a href="${pageContext.request.contextPath}/borrow/manage.do">
                                <i class="fa fa-circle-o"></i> 器材借还记录
                            </a></li>
                        <li id="borrow">
                            <a href="${pageContext.request.contextPath}/borrow/borrow.do">
                                <i class="fa fa-circle-o"></i> 器材借用登记
                            </a></li>
                        <li id="return">
                            <a href="${pageContext.request.contextPath}/borrow/return.do">
                                <i class="fa fa-circle-o"></i> 器材归还登记
                            </a></li>
                    </ul>
                </li>
            </security:authorize>


            <%--            <security:authorize access="hasRole('ADMIN')">--%>
            <%--                <li class="treeview"><a href="#"> <i class="fa fa-print"></i>--%>
            <%--                    <span>资料打印</span> <span class="pull-right-container"> <i--%>
            <%--                            class="fa fa-angle-left pull-right"></i>--%>
            <%--				</span>--%>
            <%--                </a>--%>
            <%--                    <ul class="treeview-menu">--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/student/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 学生资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 教师资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 班级资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 院系资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 选手资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 项目资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 参赛资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 器材资料--%>
            <%--                        </a></li>--%>
            <%--                        <li><a--%>
            <%--                                href="${pageContext.request.contextPath}/event/findAll.do">--%>
            <%--                            <i class="fa fa-circle-o"></i> 器材借还--%>
            <%--                        </a></li>--%>
            <%--                    </ul>--%>
            <%--                </li>--%>
            <%--            </security:authorize>--%>

            <security:authorize access="hasRole('ADMIN')">
                <li class="treeview"><a href="#"> <i class="fa fa-gear"></i>
                    <span>系统管理</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
            				</span>
                </a>
                    <ul class="treeview-menu">
                        <li id="user-setting">
                            <a href="${pageContext.request.contextPath}/user/user.do"> <i
                                    class="fa fa-circle-o"></i> 用户管理
                            </a>
                        </li>
                        <li id="role"><a href="${pageContext.request.contextPath}/role/findAllList.do"> <i
                                class="fa fa-circle-o"></i> 角色管理
                        </a></li>
                        <li id="user-feedback"><a href="${pageContext.request.contextPath}/feedback/feedbackList.do"> <i
                                class="fa fa-circle-o"></i> 反馈日记
                        </a></li>
                        <li id="syslog-list"><a href="${pageContext.request.contextPath}/sysLog/findAll.do"> <i
                                class="fa fa-circle-o"></i> 访问日记
                        </a></li>
                    </ul>
                </li>
            </security:authorize>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>