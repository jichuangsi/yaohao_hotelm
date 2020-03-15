<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>财务管理-订单明细</title>
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
		<link rel="stylesheet" href="${ctx}//css/index.css" />
		<link rel="stylesheet" href="${ctx}//css/administration.css" />
		<link rel="stylesheet" href="${ctx}/jslib/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src=${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
	</head>
	<style>
		.x-body {
			padding: 20px;
		}
		.x-body {
			padding: 20px;
		}
		#add_apar {
			display: none;
			margin-top: 10px;
		}
		.widths{
			width: 300px;
		}
		#modify_apar {
			display: none;
			margin-top: 10px;
		}
	</style>
	<body>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12">
					<div class="layui-input-inline">
						<input type="text" name="orderNumber" placeholder="姓名" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="courierName" placeholder="联系电话" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="courierNumber" placeholder="登记时间" autocomplete="off" class="layui-input time" style="width: 200px;">
					</div>
			
					<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
				</form>
			</div>
			<table id="demo" lay-filter="test"></table>
		</div>
	</body>
	<script>
		layui.use(['form', 'table'], function() {
			var form = layui.form,
				table = layui.table;
		
			table.render({
				elem: '#demo',
				method: "get",
				async: false,
				id: 'idTest',
				url: '/',
				cols: [
					[{
							field: 'id',
							title: '序号',
							type: 'numbers'
						},
						{
							field: 'account',
							align: 'center',
							title: '订单号'
						},
						{
							field: 'account',
							align: 'center',
							title: '参考价'
						},
						{
							field: 'account',
							align: 'center',
							title: '房间号'
						},
						{
							field: 'userName',
							align: 'center',
							title: '日期'
						},
						{
							field: 'userName',
							align: 'center',
							title: '旅客姓名'
						},
						{
							field: 'userName',
							align: 'center',
							title: '联系电话'
						},
						{
							field: 'userName',
							align: 'center',
							title: '平台'
						},
						{
							field: 'userName',
							align: 'center',
							title: '酒店'
						}
					]
				],
				// toolbar: '#add',
				defaultToolbar: [],
				page: true,
				limit: 10,
				// loading: true,
				request: {
					pageName: 'pageNum',
					limitName: "pageSize"
				},
				where: {},
				parseData: function(res) {
					var arr;
					var code;
					var total = 0;
					if (res.code == "0010") {
						arr = res.data;
						total = res.total;
						code = 0;
					}
					return {
						"code": code,
						"msg": res.msg,
						"count": total,
						"data": arr
					};
				}
			});
		})
	</script>
</html>
