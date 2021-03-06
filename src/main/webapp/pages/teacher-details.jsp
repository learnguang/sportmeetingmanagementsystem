<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>教师信息</title>
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
                教师信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/broadcast/main.do"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/teacher/findAll.do"> 教师信息</a></li>
                <li class="active">教师信息详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="box-body" style="display: none" id="display">

                <form id="form" action="${pageContext.request.contextPath}/student/update.do"
                      method="post">
                    <!--tab页-->
                    <div class="nav-tabs-custom">

                        <!--tab头-->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-teacher" data-toggle="tab">教师信息</a>
                            </li>
                        </ul>
                        <!--tab头/-->

                        <!--tab内容-->
                        <div class="tab-content">

                            <!--label显示的内容-->
                            <div class="tab-pane active" id="tab-teacher">
                                <div class="row data-type">

                                    <div class="col-sm-2 title">教工号</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TNo}">
                                    </div>

                                    <div class="col-sm-2 title">姓名</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TName}">
                                    </div>

                                    <div class="col-sm-2 title">性别</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TGender==true?"男":"女"}">
                                    </div>

                                    <div class="col-sm-2 title">身份</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TIdentity}">
                                    </div>

                                    <div class="col-sm-2 title">手机号码</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TPhone}">
                                    </div>

                                    <div class="col-sm-2 title">电子邮箱</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TEmail}">
                                    </div>

                                    <div class="col-sm-2 title">身份证号码</div>
                                    <div class="col-sm-10 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${teacher.TIdcard}">
                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </form>

                <!--tab页-->
                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-student" data-toggle="tab">班级学生信息</a>
                        </li>
                        <%--                        <li class="">--%>
                        <%--                            <a href="#tab-borrow" data-toggle="tab">体育器材借还情况</a>--%>
                        <%--                        </li>--%>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-student">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">班级名称</th>
                                    <th class="text-center">学号</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">性别</th>
                                    <th class="text-center">电话号码</th>
                                    <th class="">电子邮箱</th>
                                    <th class="text-center">身份证号</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${studentList}" var="student" varStatus="status">

                                    <tr>
                                        <td class="text-center">${status.index+1}</td>
                                        <td class="text-center">${student.classes.CName }</td>
                                        <td class="text-center">${student.SNo}</td>
                                        <td class="text-center">${student.SName}</td>
                                        <td class="text-center">${student.SGenderStr }</td>
                                        <td class="text-center">${student.SPhone }</td>
                                        <td class="">${student.SEmail }</td>
                                        <td class="text-center">${student.SIdcard }</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/student/findDetailsBysId.do?sId=${student.SId}'">
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
                        <%--                        <div class="tab-pane" id="tab-borrow">--%>
                        <%--                            <!--数据列表-->--%>
                        <%--                            <table id="dataList2"--%>
                        <%--                                   class="table table-bordered table-striped table-hover dataTable">--%>
                        <%--                                <thead>--%>
                        <%--                                <tr>--%>
                        <%--                                    <th class="text-center">序号</th>--%>
                        <%--                                    <th class="text-center">借用人</th>--%>
                        <%--                                    <th class="text-center">借用器材</th>--%>
                        <%--                                    <th class="text-center">借用地点</th>--%>
                        <%--                                    <th class="text-center">借出数量</th>--%>
                        <%--                                    <th class="text-center">借出时间</th>--%>
                        <%--                                    <th class="text-center">归还时间</th>--%>
                        <%--                                    <th class="text-center">借还状态</th>--%>
                        <%--                                    <th class="text-center">借用描述</th>--%>

                        <%--                                </tr>--%>
                        <%--                                </thead>--%>
                        <%--                                <tbody>--%>

                        <%--                                <c:forEach items="${borrowList}" var="borrow" varStatus="status">--%>
                        <%--                                    <tr>--%>
                        <%--                                        <td class="text-center">${status.index+1}</td>--%>
                        <%--                                        <td align="center">${teacher.TName }</td>--%>
                        <%--                                        <td align="center">${borrow.equipment.EName}</td>--%>
                        <%--                                        <td align="center">${borrow.equipment.EPlace }</td>--%>
                        <%--                                        <td align="center">${borrow.BNum }</td>--%>
                        <%--                                        <td align="center">${borrow.BStarttimeStr }</td>--%>
                        <%--                                        <td align="center">${borrow.BEndtimeStr != null ? borrow.BEndtimeStr: "未还"}</td>--%>
                        <%--                                        <td align="center"><span--%>
                        <%--                                                class=" label ${borrow.BState == false ? "label-danger":"label-success"} "> ${borrow.BState==false?"未还":"已还"}</span>--%>
                        <%--                                        </td>--%>
                        <%--                                        <td align="center">${borrow.BDescription }</td>--%>
                        <%--                                    </tr>--%>
                        <%--                                </c:forEach>--%>
                        <%--                                </tbody>--%>
                        <%--                            </table>--%>
                        <%--                            <!--数据列表/-->--%>

                        <%--                        </div>--%>


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
        "order": [5, 'desc'],
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

    $(document).ready(function () {
        document.getElementById("display").removeAttribute("style");
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
        setSidebarActive("teacher-list");


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