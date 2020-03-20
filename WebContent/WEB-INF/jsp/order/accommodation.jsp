<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<html>
	<head>
		<meta charset="utf-8">
		<title>酒店管理-订单</title>
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
		<%--<link rel="stylesheet" href="${ctx}/css/administration.css" />--%>
		<link rel="stylesheet" href="${ctx}/css/ht.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>
	</head>
	<style>
		/*body{*/
			/*background-color: gainsboro;*/
		/*}*/
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
			font-size:10px;
		}
	</style>
	<body id="bo">
	<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
		<button class="btn btn-small btn-success"id="enBtn">
			English
		</button>
		<button class="btn btn-small btn-success"id="zhBtn">
			简体中文
		</button>
	</div>
	<div class="layui-container">

		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
				<li class="layui-this" lang>established</li>
				<li lang>checkedin</li>
				<li lang>Check-out</li>
				<li lang>arrival</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
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
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span></div>
										<div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
										<div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span></div>
										<div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/>
						</span>  <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/></span></div>
											<%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
										<div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span lang>to</span> <span>${item.out}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span><span lang>total</span> ：<c:if test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
												${item.money}</span></div>
										<div class="layui-col-xs3"><span><span lang>accounts</span>：${item.accountName}</span></div>
										<div class="layui-col-xs5"><span><span lang>payment</span>：<c:if test="${item.daoTime!=null}">
											<fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
										</c:if></span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs7 "><span style="padding:0px 10px;"><span lang>name</span>:${item.name}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2 layui-col-xs-offset8">
				<%--	onclick="javascript:window.open('${ctx}/Order/updateStatus.do?orderNumber=${item.orderNumber}&status=5')"--%>
							<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="checkin(${item.orderNumber})" lang>ins</span></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<%--2已入住--%>
				<div class="layui-tab-item">
					<div class="layui-row">
						<c:forEach items="${listr.result}" var="item">
							<div class="layui-col-md6 layui-col-xs12 layui-col-md6">
								<div class="rmb-box-ht">
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span></div>
										<div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
										<div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span></div>
										<div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
										<div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span></div>
										<div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/>
						</span>  <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/></span></div>
											<%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
										<div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span lang>to</span> <span>${item.out}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span><span lang>total</span> ：<c:if test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
												${item.money}</span></div>
										<div class="layui-col-xs3"><span><span lang>accounts</span>：${item.accountName}</span></div>
										<div class="layui-col-xs5"><span><span lang>payment</span>：<c:if test="${item.daoTime!=null}">
											<fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
										</c:if></span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs7 "><span style="padding:0px 10px;"><span lang>name</span>:${item.name}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2 layui-col-xs-offset8">

											<%--onclick="javascript:window.open('${ctx}/Order/updateStatus.do?orderNumber=${item.orderNumber}&status=6')"--%>
							<span class="layui-btn layui-btn-normal layui-btn-sm"onclick="checkout(${item.orderNumber})" lang>out</span></div>
											<%--<div class="layui-col-xs2 "><span class="layui-btn layui-btn-normal layui-btn-sm">撤销</span></div>--%>
									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<%--已退房--%>
				<div class="layui-tab-item">
					<div class="layui-row">
						<c:forEach items="${listt.result}" var="item">
							<div class="layui-col-md6 layui-col-xs12 layui-col-md6">
								<div class="rmb-box-ht">
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span></div>
										<div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
										<div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span></div>
										<div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
										<div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span></div>
										<div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/>
						</span>  <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/></span></div>
											<%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
										<div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span lang>to</span> <span>${item.out}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span><span lang>total</span> ：<c:if test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
												${item.money}</span></div>
										<div class="layui-col-xs3"><span><span lang>accounts</span>：${item.accountName}</span></div>
										<div class="layui-col-xs5"><span><span lang>payment</span>：<c:if test="${item.daoTime!=null}">
											<fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
										</c:if></span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs7 "><span style="padding:0px 10px;"><span lang>name</span>:${item.name}</span></div>
									</div>
										<%--<div class="rmb-title layui-row">
                                            <div class="layui-col-xs2 layui-col-xs-offset8"><span class="layui-btn layui-btn-normal layui-btn-sm">确认</span></div>
                                            <div class="layui-col-xs2 "><span class="layui-btn layui-btn-normal layui-btn-sm">撤销</span></div>
                                        </div>--%>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<%--已到账--%>
				<div class="layui-tab-item">
					<div class="layui-row">
						<c:forEach items="${listd.result}" var="item">
							<div class="layui-col-md6 layui-col-xs12 layui-col-md6">
								<div class="rmb-box-ht">
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span></div>
										<div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
										<div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span></div>
										<div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
										<div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span></div>
										<div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/>
						</span>  <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/></span></div>
											<%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
										<div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span lang>to</span> <span>${item.out}</span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs4"><span><span lang>total</span> ：<c:if test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
												${item.money}</span></div>
										<div class="layui-col-xs3"><span><span lang>accounts</span>：${item.accountName}</span></div>
										<div class="layui-col-xs5"><span><span lang>payment</span>：<c:if test="${item.daoTime!=null}">
											<fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
										</c:if></span></div>
									</div>
									<div class="rmb-title layui-row">
										<div class="layui-col-xs7 "><span style="padding:0px 10px;"><span lang>name</span>:${item.name}</span></div>
									</div>
										<%--<div class="rmb-title layui-row">
                                            <div class="layui-col-xs2 layui-col-xs-offset8"><span class="layui-btn layui-btn-normal layui-btn-sm">确认</span></div>
                                            <div class="layui-col-xs2 "><span class="layui-btn layui-btn-normal layui-btn-sm">撤销</span></div>
                                        </div>--%>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	</body>


	<script>

	layui.use('element',function(){
	    var element=layui.element;

	    element.render();




	    window.checkin=function (value) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                data: "orderNumber="+value+"&status=5",                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                        document.getElementById("room").value = "";     //这个id的文本框的值 将会清空
                        document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                        return false;
                    } else {
                        location.href = '${ctx}/Order/myorder.do';
                        return true;
                    }
                }
            })
        }

		//退房
        window.checkout=function (value2) {
		var time;
            layer.prompt({
                formType: 0,
                value: '12:00-14:00',
                title: '请输入值',
                area: ['800px', '350px'] //自定义文本域宽高
            }, function(value, index, elem){
                time=value;
               if(value.indexOf ("-")== -1) {
                   alert("格式不正确"); //得到value
			   }
                alert(value); //得到value
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                    data: "orderNumber="+value2+"&status=6&time="+time,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if (result != 1) {
                            /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                            document.getElementById("room").value = "";     //这个id的文本框的值 将会清空
                            document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                            return false;
                        } else {
                            location.href = '${ctx}/Order/myorder.do';
                            return true;
                        }
                    }
                })
                layer.close(index);
            });

        }
	});

	</script>
</html>
