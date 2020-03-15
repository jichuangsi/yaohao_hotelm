<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>财务管理-财务明细</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
		<%--<link rel="stylesheet" href="../lib/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../css/index.css" />
		<link rel="stylesheet" href="../css/administration.css" />
		<link rel="stylesheet" href="../lib/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="../lib/js/jquery.min.js"></script>
		<script src="../lib/layui/layui.all.js"></script>--%>
		<link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/css/index.css" />
		<link rel="stylesheet" href="${ctx}/css/administration.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
		<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
	</head>
	<style>
		.x-body{
			padding: 10px;
		}
	</style>
	<body>
	<div class="x-body">
		<div class="layui-row"><%--action="${ctx}/Hotelm/allorder.do"--%>
			<form class="layui-form layui-col-md12" >
				<div class="layui-input-inline">
					<input type="text" name="pname" id="pname" value="${pname}" placeholder="姓名" autocomplete="off" class="layui-input" style="width: 200px;">
				</div>
				<div class="layui-input-inline">
					<input type="text" name="orderNumber" id="orderNumber" value="${orderNumber}" placeholder="订单号" autocomplete="off" class="layui-input" style="width: 200px;">
				</div>
				<div class="layui-input-inline">
					<input type="text" name="time" id="time" placeholder="订单时间" autocomplete="off" class="layui-input time" style="width: 200px;">
				</div>

				<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
			</form>

		</div>

	<div class="x-body">
		<p id="exc" value="导出">导出</p>
		<table class="layui-table">
			<thead>
			<tr>
				<th>序号</th>
				<th>平台</th>
				<th>订单号</th>
				<th>酒店名</th>
				<th>房间号</th>
				<th>旅客姓名</th>
				<th>联系电话</th>
				<th>入住时间</th>
				<th>退房时间</th>
				<th>入住人数</th>
				<th>价格</th>
				<th>是否到账</th>
				<th>到账时间</th>
			</tr>
			<c:forEach items="${list.result}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.paltform}</td>
					<td>${item.orderNumber}</td>
					<td>${item.hotelm}</td>
					<td>${item.roomNumber}</td>
					<td>${item.pname}</td>
					<td>${item.phone}</td>
					<td>${item.checkintime}</td>
					<td>${item.checkouttime}</td>
					<td>${item.checkinNumber}</td>
					<c:if test="${item.currency==1}">
						<td>(PHP)${item.money}</td>
					</c:if>
					<c:if test="${item.currency==2}">
						<td>(CNY)${item.money}</td>
					</c:if>
					<c:if test="${item.isdao==1}"><%--javascript:window.open('${ctx}/Hotelm/updaDao.do?id=${item.id}')--%>
						<td onclick="change(${item.id})">否</td>
					</c:if>
					<c:if test="${item.isdao==2}">
						<td>是</td>
					</c:if>
					<td>${item.daotime}</td>


				</tr>
			</c:forEach>
			</thead>
		</table>
		<div class="span11">
			<div class="row-fluid">
				<div class="tcdPageCode" style="text-align:center;"></div>
			</div>
		</div>
	</div>
	</div>

	<script type="text/javascript">
        function change(value) {
            var falg=confirm("是否确认收款？"+' \n '+"Confirm collection");
            if (falg==true){
                // location.href="${ctx}/Hotelm/isdao.do?id="+value;
                $.ajax({
                    cache:false,                                       //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "post",
                    url: '${ctx}/Hotelm/isdao.do',
                    dataType: "json",//地址 type 带参数"id="+id+"&timeOne="+from+"&timeTwo="+to,
                    data:"id="+value,
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {
                        location.href='${ctx}/Hotelm/allorder.do';
                    }
                });
            }
        }
        /* 分页要用的 */
        $(".tcdPageCode").createPage({

            pageCount:${list.totalPage},
            current:${list.currentPage},
            backFn:function(p){
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                location.href="${ctx}/Hotelm/myfinance.do?currentPage="+p+
                    "&orderNumber="+orderNumber+"&pname="+pname;
            }
        });
	</script>
	<script>

            layui.use(['form', 'table'], function() {
                var form = layui.form,
                    table = layui.table;

                form.render()
                form.on('submit(search)',function (obj) {
                    var orderNumber=document.getElementById("orderNumber").value;
                    var pname=document.getElementById("pname").value;
                    location.href="${ctx}/Hotelm/myfinance.do?orderNumber="+orderNumber+"&pname="+pname;


                });
            });

            $("#exc").click(function () {
                var time=document.getElementById("time").value;
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                $.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Hotelm/excel.do',       //地址 type 带参数
                    data:"time="+time+"&orderNumber="+orderNumber+"&pname="+pname,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if(result!=1){
                            /* alert("新增订单失败，"+' \n '+"Failed to add order");*/
                            return false;
                        }else {
                            /* alert("新增订单成功！"+' \n '+"New order succeeded");*/
                            location.href='${ctx}/Hotelm/myfinance.do?time='+time+"&orderNumber="+orderNumber+"&pname="+pname;
                            return true;
                        }
                    },
                    error: function(data) {  }
                });
            })
	</script>
	</body>
</html>
