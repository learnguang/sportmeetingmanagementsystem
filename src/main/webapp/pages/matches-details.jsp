<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>赛事成绩信息</title>
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
                运动会成绩信息详情
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/broadcast/main.do"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/matches/findAll.do"> 运动会成绩表</a></li>
                <li class="active">运动会成绩信息详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="box-body" id="display" style="display: none">

                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-score" data-toggle="tab">成绩</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">
                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-score">
                            <div class="row data-type">

                                <div class="col-sm-2 title">赛事成绩</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.MScore == null ?"成绩暂未录入":matches.MScore}${matches.MScore == null ?"":matches.event.EUnit}">
                                </div>

                                <div class="col-sm-2 title">排名</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.MRank == null ? "未进行排名":matches.MRank}">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-mNo" data-toggle="tab">参赛人信息</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">
                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-mNo">
                            <div class="row data-type">

                                <div class="col-sm-2 title">学号</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.SNo}">
                                </div>

                                <div class="col-sm-2 title">姓名</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.SName}">
                                </div>

                                <div class="col-sm-2 title">性别</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.SGenderStr}">
                                </div>

                                <div class="col-sm-2 title">班别</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.classes.CName}">
                                </div>

                                <div class="col-sm-2 title">学院</div>
                                <div class="col-sm-10 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.user.student.classes.department.DName}">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-event" data-toggle="tab">参赛项目信息</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">
                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-event">
                            <div class="row data-type">

                                <div class="col-sm-2 title">参赛届时</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.ESportmeetingid}">
                                </div>

                                <div class="col-sm-2 title">项目名称</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EName}">
                                </div>

                                <div class="col-sm-2 title">项目举办地点</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EPlace}">
                                </div>

                                <div class="col-sm-2 title">项目性别限制</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EGender==true? "男":"女"}">
                                </div>

                                <div class="col-sm-2 title">项目比赛时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EDateStr}">
                                </div>

                                <div class="col-sm-2 title">项目裁判代号</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EJudgementid}">
                                </div>

                                <div class="col-sm-2 title">报名开始时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EStarttimeStr}">
                                </div>

                                <div class="col-sm-2 title">报名结束时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${matches.event.EEndtimeStr}">
                                </div>

                                <div class="col-sm-2 title rowHeight2x">项目规则</div>
                                <div class="col-sm-10 data text rowHeight2x">
                                    <textarea rows="3"
                                              style="resize:none; background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                              class="form-control ">${matches.event.ERules}</textarea>
                                </div>


                            </div>
                        </div>
                    </div>
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
        setSidebarActive("matches-list");


        document.getElementById("display").removeAttribute("style");
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


</script>


</body>


</html>