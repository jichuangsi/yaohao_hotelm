<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>财务管理-日常消费</title>
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
					<%--<div class="layui-input-inline">
						<input type="text" name="orderNumber" placeholder="姓名" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="courierName" placeholder="联系电话" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="courierNumber" placeholder="登记时间" autocomplete="off" class="layui-input time" style="width: 200px;">
					</div>--%>
			
					<%--<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>--%>
				</form>
			</div>
			<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
				<div class="layui-btn layui-btn-sm layui-btn-normal toadd">
					新增
				</div>
			</div>
			<div class="x-body">
				<table class="layui-table">
					<thead>
					<%--<input type="hidden" id="excel" value="${time}">
					<thead>
					<tr>
						<th colspan="6">日期date:${time}&lt;%&ndash;<span id="span"></span>&ndash;%&gt;</th>
						<th colspan="9" id="exc">导出</th>
					</tr>--%>
					<tr>
						<th>序号</th>
						<th>酒店</th>
						<th>房间Room</th>
						<th>日期</th>
						<th>名称</th>
						<th>消费</th>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>
							<th>${item.id}</th>
							<th>${item.supplierName}</th>
							<th>${item.roomNumber}</th>
							<th>${item.time}</th>
							<c:if test="${item.cid==1}">
								<th>${item.name}</th>
								<th>${item.money}</th>
							</c:if>
							<c:if test="${item.cid==2}">
								<th>${item.name}</th>
								<th>${item.money}</th>
							</c:if>
							<c:if test="${item.cid==3}">
								<th>${item.name}</th>
								<th>${item.money}</th>
							</c:if>

						</tr>
					</c:forEach>

			</div>
		</div>
	</body>
	<!-- 添加部分 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label">酒店：</label>
				<div class="layui-input-block widths">
					<select name="currency" lay-verify="required">
						<option value="-1"></option>
						<option value="1">人民币</option>
						<option value="2">菲律宾币</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">房间：</label>
				<div class="layui-input-block widths">
					<select name="currency" lay-verify="required">
						<option value="-1"></option>
						<option value="1">人民币</option>
						<option value="2">菲律宾币</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">酒店：</label>
				<div class="layui-input-block widths">
					<input type="text" name="hotelm" value="7079060" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">房间号：</label>
				<div class="layui-input-block widths">
					<input type="text" name="roomNumber" value="7079060" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">旅客姓名：</label>
				<div class="layui-input-block widths">
					<input type="text" name="pname" value="7079060" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">联系方式：</label>
				<div class="layui-input-block widths">
					<input type="text" name="phone"  value="13098987876"class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">币种：</label>
				<div class="layui-input-block widths">
					<select name="currency" lay-verify="required">
						<option value="-1"></option>
						<option value="1">人民币</option>
						<option value="2">菲律宾币</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">价格：</label>
				<div class="layui-input-block widths">
					<input type="text" name="money"  value="7079060"class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入住时间：</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkintime" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">退房时间：</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkouttime" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入住人数：</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkinNumber" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否到账：</label>
				<div class="layui-input-block widths">
					<input type="radio" name="isdao" value="2" title="是">
					<input type="radio" name="isdao" value="1" title="否" checked="">
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
		layui.use(['form', 'table'], function() {
			var form = layui.form,
				table = layui.table;
		

		})
	</script>
</html>
