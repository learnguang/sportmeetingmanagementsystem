<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>院系信息</title>

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
                院系信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/broadcast/main.do"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">院系人员</li>
                <li class="active">院系信息</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary" style="display: none" id="display">
                <div class="box-header with-border">
                    <h3 class="box-title">院系信息列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建"
                                            data-toggle="modal" data-target="#myModal" onclick="findObjects()">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-default" title="删除"
                                            onclick="void(0);" id="delSelected">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button id="refresh1" type="button" class="btn btn-default" title="刷新">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->


                        <form id="selection" action="${pageContext.request.contextPath}/department/deleteByPK.do"
                              method="post">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th>
                                        <input id="selall" type="checkbox">
                                    </th>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">学院</th>
                                    <th class="text-center">院长</th>
                                    <th class="text-center">学院学生总数</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${departmentList}" var="department" varStatus="status">
                                    <tr>
                                        <td><input name="cId" value="${department.DId}" type="checkbox"></td>
                                        <td class="text-center">${status.index+1 }</td>
                                        <td class="text-center">${department.DName}</td>
                                        <td class="text-center">${department.teacher.TName}</td>
                                        <td class="text-center">${department.total}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/department/findDetailsBydId.do?dId=${department.DId}'">
                                                详情
                                            </button>
                                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                    data-target="#myModal"
                                                    onclick="getDepts(${department.DId},${department.DDeanid})">修改
                                            </button>
                                            <button type="button" class="btn bg-red btn-xs "
                                                    onclick="deleteDepartmentById(${department.DId})">删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </form>

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建"
                                            data-toggle="modal" data-target="#myModal" onclick="findObjects()">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-default" title="删除"
                                            onclick="void(0);" id="delSelected2">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button id="refresh2" type="button" class="btn btn-default" title="刷新">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->

                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

            </div>

        </section>
        <!-- 正文区域 /-->

        <%--保存弹出窗--%>
        <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form id="myForm" method="post">
                    <div class="modal-content" style="border-radius: 6px">
                        <div class="modal-header">
                            <h4 class="modal-title" id="title">新建</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="hidden" name="DId" id="DId">

                                <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                <label for="DName" class="col-sm-3 control-label">学院名称</label>
                                <div class="col-sm-9">
                                    <input id="DName" type="text" class="form-control rounded"
                                           name="DName" required="required" placeholder="学院名称"/>
                                </div>
                                <br>
                                <br>
                                <label for="DDeanid" class="col-sm-3 control-label">院长</label>
                                <div class="col-sm-9">
                                    <select id="DDeanid" style="width: 100%;" name="DDeanid" class="form-control">
                                    </select>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button id="btn" type="submit" class="btn bg-maroon">保存</button>
                            <button type="button" class="btn bg-blue" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </form>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

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

    $('#myModal').on('hidden.bs.modal', function () {
        document.getElementById("myForm").reset();
        $("#btn").text('保存');
        $("#title").text('新增');
    });

    function findObjects() {
        var url = "${pageContext.request.contextPath}/teacher/findAllTeachers.do";
        $.get(url, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].tId + "\">" + data[i].tName + "</option>";
            }
            $("#DDeanid").html(html);
        });
    }


    function getDepts(id, ctid, cdid) {
        var url1 = "${pageContext.request.contextPath}/teacher/findAllTeachers.do";
        $.get(url1, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i].tId == ctid)
                    html += "<option value=\"" + data[i].tId + "\" selected = 'selected'>" + data[i].tName + "</option>";
                else
                    html += "<option value=\"" + data[i].tId + "\">" + data[i].tName + "</option>";
            }
            $("#DDeanid").html(html);
        });

        var url2 = "${pageContext.request.contextPath}/department/findById.do?id=" + id;
        $.get(url2, function (data) {
            document.getElementById("updateOrInsert").value = "update";
            document.getElementById("DId").value = data.dId;
            document.getElementById("DName").value = data.dName;
            document.getElementById("DDeanid").value = data.dDeanid;
            $("#btn").text('修改');
            $("#title").text('修改');
        });
    }


    $("#myForm").submit(function () {
        //todo 解决空格变成加号问题
        var data = $('#myForm').serialize().replace(/\+/g, " ");
        data = decodeURIComponent(data, true);
        //处理data 转成json格式
        var dataArr = data.split("&");
        var res = {};
        for (var i = 0; i < dataArr.length; i++) {
            var str = dataArr[i].split("=");
            res[str[0]] = str[1];
        }

        if (res['updateOrInsert'] == 'update') {
            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType: 'application/json',//添加这句话
                url: "${pageContext.request.contextPath}/department/update.do", //提交的地址
                async: false,
                data: JSON.stringify(res),
                error: function () {  //失败的话
                    alert("修改失败!")
                },
                success: function () {  //成功
                    alert("修改成功!")
                }
            });
        } else if (res['updateOrInsert'] == 'insert') {
            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType: 'application/json',//添加这句话
                url: "${pageContext.request.contextPath}/department/insert.do", //提交的地址
                async: false,
                data: JSON.stringify(res),
                error: function () {  //失败的话
                    alert("新建失败!")
                },
                success: function () {  //成功
                    alert("新建成功!")
                }
            });
        }


    });

    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "columnDefs": [{"orderable": false, "targets": 0}],
        "order": [1, 'asc'],
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


    function deleteDepartmentById(dId) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/department/deleteByPK.do?dId=' + dId;
        }
    }

    document.getElementById("delSelected").onclick = function () {
        if (confirm("你确定要删除选中条目吗")) {
            document.getElementById("selection").submit();
        }
    };

    document.getElementById("delSelected2").onclick = function () {
        if (confirm("你确定要删除选中条目吗")) {
            document.getElementById("selection").submit();
        }
    };


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
        setSidebarActive("department-list");

        $("#refresh1").click(function () {
            window.location.reload(true);
        });


        $("#refresh2").click(function () {
            window.location.reload(true);
        });

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
</body>

</html>