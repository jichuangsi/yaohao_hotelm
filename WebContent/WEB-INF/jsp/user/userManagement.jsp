<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
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
		<link rel="stylesheet" href="${ctx}/css/ht.css"/>
		<link rel="stylesheet" href="${ctx}/css/administration.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>
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
	<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
		<button class="btn btn-small btn-success"id="enBtn">
			English
		</button>
		<button class="btn btn-small btn-success"id="zhBtn">
			简体中文
		</button>
	</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12">
					<div class="layui-input-inline">
						<input type="text" name="name" placeholder="操作员关键字" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
			
					<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
				</form>
			</div>
			<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
				<div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>add</div>
			</div>
		</div>
	</body>
	<!-- 添加 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>userName</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="UserName" id="userName" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>password</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="password" id="password" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>rpassword</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="rpassword" id="rpassword" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="add_Pwd" lang>Submission</div>
				</div>
			</div>

		</form>

	</div>
	<!-- 修改 -->
	<div id="modify_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<input type="text" name="id" id="id" value="">
			<div class="layui-form-item">
			<label class="layui-form-label"><span lang>userName</span>：</label>
			<div class="layui-input-block widths">

				<input type="text" name="userName" id="name" class="layui-input " lay-verify="required">
			</div>
		</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>password</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="password" id="passwords" class="layui-input " lay-verify="required">
				</div>
			</div>
			<%--<div class="layui-form-item">
				<label class="layui-form-label">确认密码：</label>
				<div class="layui-input-block widths">
					<input type="password" name="repassword" id="rpassword" class="layui-input " lay-verify="required">
				</div>
			</div>--%>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_Pwd" lang>Submission</div>
				</div>
			</div>

		</form>

	</div>
	<div class="x-body">
		<table class="layui-table">
			<thead>
			<tr>
				<th lang>serial</th>
				<th lang>userName</th>
				<th lang>operation</th>
				<%--<th width="200px">备注</th>--%>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<th>${item.id}</th>
					<th>${item.userName}</th>
					<th>
						<span class=" layui-btn layui-btn-normal layui-btn-sm tomodify" onclick="modify()" lang>amended</span>
					</th>
					</th>
						<%--<th width="200px">备注</th>--%>
				</tr>
			</c:forEach>
			</thead>
		</table>
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
		layui.use(['form', 'table','element'], function() {
			var form = layui.form,
                element = layui.element,
				table = layui.table;


            element.init();
            form.render()

            $(document).on('click','.toadd',function(){
                add();
            });


            var falg;
            form.on('submit(add_Pwd)',function (obj) {
                var param =obj.field;
                console.log(falg=name())
                var password=document.getElementById("password").value;
                var rpassword=document.getElementById("rpassword").value;
                if (password==rpassword){
                    falg==true;
				}else {
                    alert("两输入密码不同");
                    falg=false;
				}
			if (falg==true) {
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/User/add.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                                alert("新增失败"+' \n '+"Failed to add");                     //提示框
                                document.getElementById("userName").value="";     //这个id的文本框的值 将会清空
                                document.getElementById("userName").focus();      // 给这个id的文本框提供焦点
                                return false;
                            }else {
                                alert("新增成功！"+' \n '+"succeeded");
                                location.href='${ctx}/User/tolist.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })
            }
            });

            form.on('submit(update_Pwd)',function (obj) {
                var param =obj.field;
                if (falg==true) {
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/User/update.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                              /*  alert("修改失败"+' \n '+"Failed to add");                     //提示框*/
                                document.getElementById("userName").value="";     //这个id的文本框的值 将会清空
                                document.getElementById("userName").focus();      // 给这个id的文本框提供焦点
                                return false;
                            }else {
                              /*  alert("修改成功！"+' \n '+"succeeded");*/
                                location.href='${ctx}/User/tolist.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })
                }
            });

		})
        function name(){
            var order=document.getElementById("userName").value;
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/User/YZ.do',       //地址 type 带参数
                data:"userName="+order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result>=1){
                        alert("名字重复！"+' \n '+"Duplicate name");                     //提示框
                        document.getElementById("userName").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("userName").focus();      // 给这个id的文本框提供焦点
                        falg=false;
                        return falg;
                    }else {
                        falg=true;
                        return falg;
                    }
                },
                error: function(data) {  }

            })
            return falg;
        }


	</script>
</html>
