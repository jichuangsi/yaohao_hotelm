<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>商家管理-平台信息</title>
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
						<input type="text" name="orderNumber" placeholder="平台关键字" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
			
					<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
				</form>
			</div>
			<table id="demo" lay-filter="test"></table>
		</div>
	</body>
	<!-- 修改 -->
	<div id="modify_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label">平台名称：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_Pwd">添加</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		function add() {
			index = layer.open({
				type: 1,
				area: ['40%', '45%'],
				anim: 2,
				title: '添加',
				maxmin: true,
				shadeClose: true,
				content: $("#add_apar")
			});
		}
		function modify() {
			index = layer.open({
				type: 1,
				area: ['40%', '45%'],
				anim: 2,
				title: '修改',
				maxmin: true,
				shadeClose: true,
				content: $("#modify_apar")
			});
		}
	</script>
	<script>

		layui.use(['form', 'table'], function() {
			var form = layui.form,
				table = layui.table;
			table.render({
				elem: '#demo',
				method: "get",
				async: false,
				id: 'idTest',
				url:'',
				cols: [
					[{
							field: 'id',
							title: '序号',
							type: 'numbers'
						},
						{
							field: 'name',
							align: 'center',
							title: '名称'
						},
						{
							field: 'isYong',
							align: 'center',
							title: '是否启用'
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
					console.log(res);
					var arr;
					var code;
					var total = 0;
					if (res.code == "0010") {
						arr = res.data.result;
						total = res.total;
					}
					return {
						"code": 0,
						"msg": res.msg,
						"count": total,
						"data": arr
					};
				}
			});
		})
	</script>
</html>
