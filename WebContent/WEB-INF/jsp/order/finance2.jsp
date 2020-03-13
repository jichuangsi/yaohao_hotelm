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
		<link rel="stylesheet" href="${ctx}/jslib/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src=${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
	</head>
	<style>
		.x-body{
			padding: 10px;
		}
	</style>
	<body>
	<div class="x-body">
		<table class="layui-table">
			<thead>
			<tr>
				<th colspan="6">日期date:<span id="span"></span></th>
				<th colspan="9">创表人</th>
			</tr>
			<tr>
				<th>序号</th>
				<th>房间Room</th>
				<th>订单收入(PHP)</th>
				<th>订单收入(CNY)</th>
				<th>房租rent(PHP)</th>
				<th>水费</th>
				<th>电费</th>
				<th>维修费</th>
				<th>网络</th>
				<th>大厦管理费</th>
				<th>被铺清洗费</th>
				<th>日常用品</th>
				<th>其他费用</th>
				<th>小计</th>
				<%--<th width="200px">备注</th>--%>
			</tr>
		<c:forEach items="${list.result}" var="item">
			<tr>
				<th>${item.id}</th>
				<th>${item.roomNumber}</th>
				<th>${item.PHP}(PHP)</th>
				<th>${item.RMB}(CNY)</th>
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
				<%--<th width="200px">备注</th>--%>
			</tr>
		</c:forEach>
			</thead>
			<%--<c:forEach items="${list.result}" var="item">
			<tbody>
			<tr>
				<th>序号</th>
				<th>房间Room</th>
				<th>订单收入(PHP)</th>
				<th>订单收入(CNY)</th>
				<th>房租rent(PHP)</th>
				<th>水费</th>
				<th>电费</th>
				<th>维修费</th>
				<th>网络</th>
				<th>大厦管理费</th>
				<th>被铺清洗费</th>
				<th>日常用品</th>
				<th>其他费用</th>
				<th>小计</th>
				<th>备注</th>
			</tr>
			</tbody>
			</c:forEach>
		</table>--%>
	</div>

	<script type="text/javascript">
            $(document).ready(function () {
              /*  $("#span").val(getNowFormatDate());*/
				var time=getNowFormatDate();
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
            });

	</script>
	</body>
</html>
