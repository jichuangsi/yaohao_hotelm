<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>酒店管理-待入住</title>
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
		<link rel="stylesheet" href="${ctx}/css/ht.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
	</head>
	<style>
		body{
			background-color: gainsboro;
		}
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
		.layui-form-label{
			width: 110px;
		}
		.layui-input-block {
			margin-left: 150px
		}
		.layui-badge,.layui-badge-rim{
			font-size: 14px;
		}
		.rmb-box-ht{
			font-size: 14px;
		}
	</style>
	<body>
	<div class="layui-container">
		<div class="layui-row">
		<c:forEach items="${list.result}" var="item">
			<div class="layui-col-md6 layui-col-xs12 layui-col-md6">
				<div class="rmb-box-ht">
					<div class="rmb-title layui-row">
						<div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span></div>
						<div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
						<div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs1"><span class="layui-badge layui-bg-gray">${item.checkinNumber}间</span></div>
						<div class="layui-col-xs4">${item.roomNumber}房</div>
						<div class="layui-col-xs7 "><span style="padding:0px 10px;">${item.name}</span><span>${item.phoneNumber}</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs1"><span class="layui-badge layui-bg-gray">${item.checkinDay}晚</span></div>
						<div class="layui-col-xs7"><span><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/>
						</span> 至 <span><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/></span></div>
						<%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
						<div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> 至 <span>${item.out}</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs4"><span>总价：<c:if test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
								${item.money}</span></div>
						<div class="layui-col-xs3"><span>账户：${item.accountName}</span></div>
						<div class="layui-col-xs5"><span>到账：<c:if test="${item.daoTime!=null}">
							<fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
						</c:if></span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs2 layui-col-xs-offset8">
							<span class="layui-btn layui-btn-normal layui-btn-sm"
								  onclick="javascript:window.open('${ctx}/Order/updateStatus.do?orderNumber=${item.orderNumber}&status=5')">
								入住</span></div>
					</div>
				</div>
			</div>
</c:forEach>
		</div>
	</div>
	</body>


	<script>

        /* 分页要用的 */
        $(".tcdPageCode").createPage({
            pageCount:${list.totalPage},
            current:${list.currentPage},
            backFn:function(p){
                var txtname=document.getElementById("txtnameid").value;
                location.href="${ctx}/Order/myorder.do";
            }
        });

	</script>
</html>
