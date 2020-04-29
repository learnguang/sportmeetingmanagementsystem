<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>用户管理</title>
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

<body class=" hold-transition skin-green-light sidebar-mini layout-boxed ">

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
                用户管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/broadcast/main.do"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">系统管理</li>
                <li class="active">用户管理</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!--tab页-->
            <div class="nav-tabs-custom" id="display" style="display: none">

                <!--tab头-->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab-student" data-toggle="tab">学生管理</a>
                    </li>
                    <li>
                        <a href="#tab-teacher" data-toggle="tab">教师管理</a>
                    </li>
                    <li>
                        <a href="#tab-other" data-toggle="tab">其他人员管理</a>
                    </li>
                </ul>
                <!--tab头/-->

                <!--tab内容-->
                <div class="tab-content">


                    <!--label显示的内容-->
                    <div class="tab-pane active" id="tab-student">
                        <table id="dataList1"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <%--                                    <th>--%>
                                <%--                                        <input id="selall1" type="checkbox">--%>
                                <%--                                    </th>--%>
                                <th class="text-center">ID</th>
                                <th class="text-center">学号</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">性别</th>
                                <th class="text-center">班级</th>
                                <th class="text-center">状态</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${student}" var="student">

                                <tr>
                                        <%--                                        <td><input name="sNo" value="${student.SNo}" type="checkbox"></td>--%>
                                    <td class="text-center">${student.SId}</td>
                                    <td class="text-center">${student.SNo }</td>
                                    <td class="text-center">${student.SName}</td>
                                    <td class="text-center">${student.SGender == false ? "女":"男" }</td>
                                    <td class="text-center">${student.classes.CName}</td>
                                    <td align="center">
                                        <button type="button"
                                                class="btn btn-xs ${student.user.UStatus == true ? "btn-primary":"btn-danger"}"
                                                onclick="updateUstatus(${student.SNo},${student.user.UStatus})">
                                                ${student.user.UStatus == true ? "开启":"禁用"}</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-teacher">
                        <!--数据列表-->
                        <!--工具栏-->
                        <%--                        <div class="form-group form-inline">--%>
                        <%--                            <div class="btn-group">--%>
                        <%--                                <button type="button" class="btn btn-default" title="开启"--%>
                        <%--                                        onclick="javascript:void(0);" id="statusOn2">--%>
                        <%--                                    <i class="fa fa-check"></i> 开启--%>
                        <%--                                </button>--%>
                        <%--                                <button type="button" class="btn btn-default" title="禁用"--%>
                        <%--                                        onclick="javascript:void(0);" id="statusOff2">--%>
                        <%--                                    <i class="fa fa-close "></i> 禁用--%>
                        <%--                                </button>--%>
                        <%--                                <button type="button" class="btn btn-default" title="刷新"--%>
                        <%--                                        onclick="location.href='${pageContext.request.contextPath}/user/user.do'">--%>
                        <%--                                    <i class="fa fa-refresh"></i> 刷新--%>
                        <%--                                </button>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <!--工具栏/-->
                        <form id="selection2" action="${pageContext.request.contextPath}/user/updateUstatusOn.do"
                              method="post">
                            <table id="dataList2"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>

                                <tr>
                                    <%--                                    <th>--%>
                                    <%--                                        <input id="selall2" type="checkbox">--%>
                                    <%--                                    </th>--%>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">教工号</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">性别</th>
                                    <th class="text-center">身份</th>
                                    <th class="text-center">状态</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${teacher}" var="teacher">
                                    <tr>
                                            <%--                                        <td><input name="uId" value="${teacher.TNo}" type="checkbox"></td>--%>
                                        <td class="text-center">${teacher.TId}</td>
                                        <td class="text-center">${teacher.TNo}</td>
                                        <td class="text-center">${teacher.TName}</td>
                                        <td class="text-center">${teacher.TGender == false ? "女":"男" }</td>
                                        <td class="text-center">${teacher.TIdentity }</td>
                                        <td align="center">
                                            <button type="button"
                                                    class="btn btn-xs ${teacher.user.UStatus == true ? "btn-primary":"btn-danger"}"
                                                    onclick="updateUstatus(${teacher.TNo},${teacher.user.UStatus})">
                                                    ${teacher.user.UStatus == true ? "开启":"禁用"}</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <!--数据列表/-->

                    </div>
                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-other">
                        <!--数据列表-->
                        <form id="selection3" action="" method="post">
                            <table id="dataList3"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>

                                <tr>
                                    <%--                                    <th>--%>
                                    <%--                                        <input id="selall3" type="checkbox">--%>
                                    <%--                                    </th>--%>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">NO</th>
                                    <th class="text-center">NAME</th>
                                    <th class="text-center">STATUS</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${other}" var="other">
                                    <tr>
                                            <%--                                        <td><input name="No" value="${other.ONo}" type="checkbox"></td>--%>
                                        <td class="text-center">${other.OId}</td>
                                        <td class="text-center">${other.ONo }</td>
                                        <td class="text-center">${other.OName}</td>
                                        <td align="center">
                                            <button type="button"
                                                    class="btn btn-xs ${other.user.UStatus == true ? "btn-primary":"btn-danger"}"
                                                    onclick="updateUstatus('${other.ONo}',${other.user.UStatus})">
                                                    ${other.user.UStatus == true ? "开启":"禁用"}</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <!--数据列表/-->

                    </div>


                </div>


            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- 底部导航 /-->

</div>


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


    $('#dataList1').DataTable({
        "processing": true,
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "order": [0, 'asc'],
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
        },
    });

    $('#dataList2').DataTable({
        "processing": true,
        "paging": true,
        // "pagingType":   "full_numbers",//分页按钮有首页、上一页、下一页、尾页、页码
        "lengthChange": true,
        "searching": true,
        "order": [0, 'asc'],
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
        },
    });

    $('#dataList3').DataTable({
        "processing": true,
        "paging": true,
        // "pagingType":   "full_numbers",//分页按钮有首页、上一页、下一页、尾页、页码
        "lengthChange": true,
        "searching": true,
        "order": [0, 'asc'],
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
        },
    });

    function updateUstatus(Id, uStatus) {
        if (uStatus) {
            if (confirm("您确定要禁用此账户吗？")) {
                location.href = '${pageContext.request.contextPath}/user/updateUstatus.do?Id=' + Id + '&uStatus=' + uStatus;
                return true;
            } else
                return false;
        }
        if (!uStatus) {
            if (confirm("您确定要开启此账户吗？")) {
                location.href = '${pageContext.request.contextPath}/user/updateUstatus.do?Id=' + Id + '&uStatus=' + uStatus;
                return true;
            } else
                return false;
        }
    }

    <%--document.getElementById("statusOn").onclick = function () {--%>
    <%--    if (confirm("你确定要开启选中条目吗")) ;--%>
    <%--    {--%>
    <%--        document.getElementById("selection1").submit();--%>
    <%--    }--%>
    <%--}--%>

    <%--document.getElementById("statusOff").onclick = function () {--%>
    <%--    if (confirm("你确定要禁用选中条目吗")) ;--%>
    <%--    {--%>
    <%--        var path = "${pageContext.request.contextPath}/user/updateUstatusOff.do";--%>
    <%--        $('#section1').attr("action", path).submit();--%>
    <%--    }--%>
    <%--}--%>

    <%--document.getElementById("statusOn2").onclick = function () {--%>
    <%--    if (confirm("你确定要开启选中条目吗")) ;--%>
    <%--    {--%>
    <%--        document.getElementById("selection2").submit();--%>
    <%--    }--%>
    <%--}--%>

    <%--document.getElementById("statusOff2").onclick = function () {--%>
    <%--    if (confirm("你确定要禁用选中条目吗")) ;--%>
    <%--    {--%>
    <%--        var path = "${pageContext.request.contextPath}/user/updateUstatusOff.do";--%>
    <%--        $('#section2').attr("action", path).submit();--%>
    <%--    }--%>
    <%--}--%>

    <%--document.getElementById("statusOn").onclick = function () {--%>
    <%--    if (confirm("你确定要开启选中条目吗")) ;--%>
    <%--    {--%>
    <%--        var path = "${pageContext.request.contextPath}/user/updateUstatusOn.do";--%>
    <%--        $('#section1').attr("action", path).submit();--%>
    <%--        $('#section2').attr("action", path).submit();--%>
    <%--        $('#section3').attr("action", path).submit();--%>
    <%--    }--%>
    <%--}--%>

    <%--document.getElementById("statusOff").onclick = function () {--%>
    <%--    if (confirm("你确定要禁用选中条目吗")) ;--%>
    <%--    {--%>
    <%--        var path = "${pageContext.request.contextPath}/user/updateUstatusOff.do";--%>
    <%--        $('#section1').attr("action", path).submit();--%>
    <%--        $('#section2').attr("action", path).submit();--%>
    <%--        $('#section3').attr("action", path).submit();--%>
    <%--    }--%>
    <%--}--%>


    $(document).ready(function () {
        document.getElementById("display").removeAttribute("style");
        // 激活导航位置
        setSidebarActive("user-setting");
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


        // 全选操作
        $("#selall1").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList1 td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList1 td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });

        $("#selall2").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList2 td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList2 td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });

        $("#selall3").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList3 td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList3 td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });


</script>
</body>

</html>