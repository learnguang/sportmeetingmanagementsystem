<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>运动会信息详情</title>
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
                开幕式信息详情
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/broadcast/main.do"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/sportmeeting/findAll.do"> 运动会开幕列表</a></li>
                <li class="active">开幕信息详情</li>
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
                            <a href="#tab-sportmeeting" data-toggle="tab">开幕式信息详情</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-sportmeeting">
                            <div class="row data-type">

                                <div class="col-sm-2 title">届时</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           id="SId"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SId}届">
                                </div>

                                <div class="col-sm-2 title">状态</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           id="SStatus"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SStatus==true ? "正在开展中...":"关闭"}">
                                </div>

                                <div class="col-sm-2 title">名称</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SName}">
                                </div>

                                <div class="col-sm-2 title">主题</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.STheme}">
                                </div>

                                <div class="col-sm-2 title">举办地点</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SPlace}">
                                </div>

                                <div class="col-sm-2 title">举办时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SDateStr}">
                                </div>

                                <div class="col-sm-2 title">开始时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SStarttimeStr}">
                                </div>

                                <div class="col-sm-2 title">结束时间</div>
                                <div class="col-sm-4 data text">
                                    <input type="text"
                                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                           class="form-control" readonly="readonly"
                                           value="${sportmeeting.SEndtimeStr}">
                                </div>

                                <div class="col-sm-2 title rowHeight2x">描述</div>
                                <div class="col-sm-10 data text rowHeight2x">
                                        <textarea rows="3"
                                                  style="resize:none; background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                                  class="form-control">${sportmeeting.SDescription}</textarea>
                                </div>

                            </div>
                        </div>
                        <br>
                    </div>
                </div>
                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-broadcast" data-toggle="tab">本届广播信息</a>
                        </li>
                        <li>
                            <a href="#tab-event" data-toggle="tab">项目信息</a>
                        </li>
                        <li>
                            <a href="#tab-matches" data-toggle="tab">成绩信息</a>
                        </li>
                    </ul>

                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-broadcast">
                            <!--数据列表-->
                            <table
                                    id="dataList"
                                    class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">播出时间</th>
                                    <th class="text-center">广播主题</th>
                                    <th class="text-center">广播内容</th>

                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${broadcast}" var="broadcast" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index+1}</td>
                                        <td class="text-center">${broadcast.BTimeStr }</td>
                                        <td class="text-center">${broadcast.BTitle}</td>
                                        <td class="text-center"> ${broadcast.BContent }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </div>

                        <!--label显示的内容-->
                        <div class="tab-pane " id="tab-event">
                            <!--数据列表-->
                            <table
                                    id="dataList2"
                                    class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">项目名称</th>
                                    <th class="text-center">项目性别限制</th>
                                    <th class="text-center">项目举办地点</th>
                                    <th class="text-center">项目比赛日期</th>
                                    <th class="text-center">报名开始日期</th>
                                    <th class="text-center">报名结束日期</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${event}" var="event" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index+1 }</td>
                                        <td class="text-center">${event.EName }</td>
                                        <td class="text-center">${event.EGender==true ? "男":"女" }</td>
                                        <td class="text-center">${event.EPlace }</td>
                                        <td class="text-center">${event.EDateStr }</td>
                                        <td class="text-center">${event.EStarttimeStr }</td>
                                        <td class="text-center">${event.EEndtimeStr }</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/event/findDetailsByeId.do?eId=${event.EId}'">
                                                详情
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </div>

                        <!--label显示的内容-->
                        <div class="tab-pane " id="tab-matches">
                            <!--数据列表-->
                            <table
                                    id="dataList3"
                                    class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">参赛人学号</th>
                                    <th class="text-center">参赛人</th>
                                    <th class="text-center">参赛项目</th>
                                    <th class="text-center">比赛地点</th>
                                    <th class="text-center">成绩</th>
                                    <th class="text-center">排名</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${matches}" var="matches" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index+1 }</td>
                                        <td class="text-center">${matches.user.student.SNo }</td>
                                        <td class="text-center">${matches.user.student.SName }</td>
                                        <td class="text-center">${matches.event.EName }</td>
                                        <td class="text-center">${matches.MSort == null ? "未分道":matches.MSort }</td>
                                        <td class="text-center">${matches.MScore == null ? "未录入":matches.MScore }${matches.MScore == null ? "":matches.event.EUnit}</td>
                                        <td class="text-center">${matches.MRank == null ? "未排名":matches.MRank }</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/matches/findDetailsBymId.do?mId=${matches.MId}'">
                                                详情
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
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


    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [1, 'desc'],
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
            "sLoadingRecords": "正在加载...",
            "sProcessing": "正在获取数据，请稍候...",
            "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
            "sInfoFiltered": "(从_MAX_条筛选 )",
            "sInfoEmpty": "共筛选到0条",
            "sSearch": "搜索:",
            "sLengthMenu": "每页显示 _MENU_ 条",
            "sZeroRecords": "无相关记录",
            "paginate": {
                "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
                "sLast": "尾页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "first": "First page",
                "last": "Last page",
                "next": "Next page",
                "previous": "Previous page"
            }
        }
    });

    $('#dataList2').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [0, 'asc'],
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
            "sLoadingRecords": "正在加载...",
            "sProcessing": "正在获取数据，请稍候...",
            "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
            "sInfoFiltered": "(从_MAX_条筛选 )",
            "sInfoEmpty": "共筛选到0条",
            "sSearch": "搜索:",
            "sLengthMenu": "每页显示 _MENU_ 条",
            "sZeroRecords": "无相关记录",
            "paginate": {
                "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
                "sLast": "尾页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "first": "First page",
                "last": "Last page",
                "next": "Next page",
                "previous": "Previous page"
            }
        }
    });
    $('#dataList3').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [0, 'asc'],
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
            "sLoadingRecords": "正在加载...",
            "sProcessing": "正在获取数据，请稍候...",
            "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
            "sInfoFiltered": "(从_MAX_条筛选 )",
            "sInfoEmpty": "共筛选到0条",
            "sSearch": "搜索:",
            "sLengthMenu": "每页显示 _MENU_ 条",
            "sZeroRecords": "无相关记录",
            "paginate": {
                "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
                "sLast": "尾页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "first": "First page",
                "last": "Last page",
                "next": "Next page",
                "previous": "Previous page"
            }
        }
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
        setSidebarActive("sportmeeting-list");

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