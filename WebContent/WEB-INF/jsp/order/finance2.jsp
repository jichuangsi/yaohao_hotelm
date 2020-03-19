<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>财务管理-财务明细</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>
    <%--<link rel="stylesheet" href="../lib/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/administration.css" />
    <link rel="stylesheet" href="../lib/layui/css/modules/layui-icon-extend/iconfont.css" />
    <script src="../lib/js/jquery.min.js"></script>
    <script src="../lib/layui/layui.all.js"></script>--%>
    <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <link rel="stylesheet" href="${ctx}/css/administration.css"/>
    <link rel="stylesheet" href="${ctx}/css/ht.css"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/layui/layui.all.js"></script>
    <script src="${ctx}/js/weeklyCalendar.js"></script>

    <script type="text/javascript" src="${ctx}/js/language.js"></script>
</head>
<style>
    .x-body {
        padding: 10px;
    }

    #add_apar {
        display: none;
        margin-top: 10px;
    }
</style>
<body>
<div class="x-body">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
        <button class="btn btn-small btn-success"id="enBtn">
            English
        </button>
        <button class="btn btn-small btn-success"id="zhBtn">
            简体中文
        </button>
    </div>
    <table class="layui-table">
        <input type="hidden" id="excel" value="${time}">
        <thead>
        <tr>
            <th colspan="6" lang>date:${time}<%--<span id="span"></span>--%></th>
            <th colspan="9" id="exc" lang>excel</th>
        </tr>
        <tr>
            <th lang>serial</th>
            <th lang>roomNumber</th>
            <th><span lang>revenue</span>(PHP)</th>
            <th><span lang>revenue</span>(RMB)</th>
            <th><span lang>rent</span>(PHP)</th>
            <th lang>water</th>
            <th lang>electricity</th>
            <th lang>maintenance</th>
            <th lang>network</th>
            <th lang>expense</th>
            <th lang>cleaning</th>
            <th lang>supplies</th>
            <th lang>other</th>
            <th lang>subtotal</th>
            <th lang>operation</th>
            <%--<th width="200px">备注</th>--%>
        </tr>
        <c:forEach items="${list}" var="item">
            <tr>
                <input type="hidden" name="idstr" value="${item.id}">
                <th>${item.id}</th>
                <th>${item.roomNumber}</th>
                <th>${item.PHP}(PHP)</th>
                <th>${item.RMB}(RMB)</th>
                <th>${item.rent}(PHP)</th>
                <th>${item.water}</th>
                <th>${item.electricity}</th>
                <th>${item.maintenanceCost}</th>
                <th>${item.network}</th>
                <th>${item.buildingManagementFee}</th>
                <th>${item.linenCleaningfee}</th>
                <th>${item.dailySupplies}</th>
                <th>${item.otherExpenses}</th>
                <th>${item.count}</th>
                <th>
                    <div class=" layui-btn layui-btn-normal layui-btn-sm toadd" onclick="add(${item.id},${item.yearM})">添加消费</div>
                </th>
                    <%--<th width="200px">备注</th>--%>
            </tr>
        </c:forEach>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th lang>ticheng</th>
            <th>${booking}</th>
            <th></th>
            <th></th>
            <%--<th width="200px">备注</th>--%>
        </tr>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th>PHP</th>
            <th>${sumPHP}</th>
            <th></th>
            <%--<th width="200px">备注</th>--%>
        </tr>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th>(CNY)</th>
            <th>${sumCNY}</th>
            <th></th>
            <%--<th width="200px">备注</th>--%>
        </tr>
        </thead>
    </table>
</div>
<!-- 添加 -->

<script type="text/javascript">

    $(document).ready(function () {
        /*  $("#span").val(getNowFormatDate());*/
        var time = getNowFormatDate();
        $("#span").html(time);

        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }


        $("#exc").click(function () {
            var time = document.getElementById("excel").value;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/excel.do',       //地址 type 带参数
                data: "time=" + time,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        /* alert("新增订单失败，"+' \n '+"Failed to add order");*/
                        return false;
                    } else {
                        /* alert("新增订单成功！"+' \n '+"New order succeeded");*/
                        location.href = '${ctx}/Order/myfinance.do?time=' + time;
                        return true;
                    }
                },
                error: function (data) {
                }
            });
        })
    });

</script>
<script>
    layui.use(['form', 'table', 'element'], function () {
        var form = layui.form,
            element = layui.element,
            table = layui.table;

        window.add=function(id,yearM) {
            index = layer.open({
                type: 1,
                area: ['40%', '60%'],
                anim: 2,
                title: '添加',
                maxmin: true,
                shadeClose: true,
                content: $("#add_apar")
            });
            form.val('mod_pwd',{
                "id":id,
                "yearM":yearM
            })
        }

        element.init();
        form.render()

        // $(document).on('click','.toadd',function (obj) {
        //     add();
        //     var id=$(obj).parent().parent().find("input[name=idstr]").val();
        //     console.log($(obj).parent().parent().find("input[name=idstr]").val())
        //     alert(id)
        // })
        var falg;
        form.on('submit(update_add)', function (obj) {
            var param = obj.field;

            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/addFinance.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                        /* document.getElementById("name").value="";     //这个id的文本框的值 将会清空
                         document.getElementById("name").focus(); */     // 给这个id的文本框提供焦点
                        return false;
                    } else {
                        alert("新增成功！" + ' \n ' + "succeeded");
                        location.href = '${ctx}/Order/myfinance.do';
                        return true;
                    }
                },
                error: function (data) {
                }
            })
        });


    })

    function name() {
        var order = document.getElementById("name").value;
        $.ajax({
            cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/Platform/YZ.do',       //地址 type 带参数
            data: "name=" + order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async: false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                if (result >= 1) {
                    alert("名字重复！" + ' \n ' + "Duplicate name");                     //提示框
                    document.getElementById("name").value = "";     //这个id的文本框的值 将会清空
                    document.getElementById("name").focus();      // 给这个id的文本框提供焦点
                    falg = false;
                    return falg;
                } else {
                    falg = true;
                    return falg;
                }
            },
            error: function (data) {
            }
        })
        return falg;
    }
</script>
</body>
<div id="add_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
        <div class="layui-form-item">
            <input name="id" type="hidden" value="">
            <input name="yearM" type="hidden" value="">
            <label class="layui-form-label"><span lang>rent</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="rent" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>water</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="water" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>electricity</span>：</label>
            <div class="layui-input-block widths">
                <input type="password" name="electricity" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>maintenance</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="maintenanceCost" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>network</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="network" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>expense</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="buildingManagementFee" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="update_add" lang>Submission</div>
            </div>
        </div>
    </form>
</div>

</html>
