<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>财务管理-添加消费</title>
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
	</head>
	<style>
		.x-body{
			padding: 10px;
		}
	</style>
	<body>
	<!-- 添加 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">

			<div class="layui-form-item">
				<label class="layui-form-label">房租：</label>
				<div class="layui-input-block widths">
					<input type="text" name="rent" class="layui-input " lay-verify="required">
					<input type="hidden" id="id" name="id" value="${id}" >
					<input type="hidden"id="yearM" name="yearM"  value="${time}">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">水费：</label>
				<div class="layui-input-block widths">
					<input type="text" name="water" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电费：</label>
				<div class="layui-input-block widths">
					<input type="text" name="electricity" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">维修费：</label>
				<div class="layui-input-block widths">
					<input type="text" name="maintenanceCost" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">网费：</label>
				<div class="layui-input-block widths">
					<input type="text" name="network" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">大厦管理费：</label>
				<div class="layui-input-block widths">
					<input type="text" name="buildingManagementFee" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_add">提交</div>
				</div>
			</div>

		</form>

	</div>

	<script type="text/javascript">

    function addf() {
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


	</script>
	<script>
        layui.use(['form', 'table','element'], function() {
            var form = layui.form,
                element = layui.element,
                table = layui.table;


            element.init();
            form.render()

            $(document).on('click','.toadd',function(){
                getData($(this))
            });


            form.on('submit(update_add)',function (obj) {
                var param =obj.field;
                console.log(param);
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/Order/addFinance.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                                /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                               /* document.getElementById("name").value="";     //这个id的文本框的值 将会清空
                                document.getElementById("name").focus(); */     // 给这个id的文本框提供焦点
                                return false;
                            }else {
                                alert("新增成功！"+' \n '+"succeeded");
                                location.href='${ctx}/Order/myfinance.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })
            });



        })
        function name(){
            var order=document.getElementById("name").value;
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Platform/YZ.do',       //地址 type 带参数
                data:"name="+order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result>=1){
                        alert("名字重复！"+' \n '+"Duplicate name");                     //提示框
                        document.getElementById("name").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("name").focus();      // 给这个id的文本框提供焦点
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
	</body>
</html>
