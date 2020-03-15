<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>商家管理-房间信息</title>
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
						<input type="text" name="roomNumber" id="roomNumber" placeholder="房号关键字" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
			
					<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
				</form>
			</div>
			<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
				<div class="layui-btn layui-btn-sm layui-btn-normal toadd">
					新增
				</div>
			</div>
		</div>
	</body>
	<!-- 添加 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label">供应商：</label>
				<div class="layui-input-block widths">
					<select name="supplierID" id="supplierID" lay-verify="required">
						<c:forEach items="${slist}" var="item">
							<option value="${item.id}">${item.supplierName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">房间号：</label>
				<div class="layui-input-block widths">
					<input type="hidden" name="roomId"value="" lay-verify="required">
					<input type="text" name="roomNumber" id="room" class="layui-input" value=""  lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">床位数：</label>
				<div class="layui-input-block widths">
					<input type="text" name="roomAmount" class="layui-input" value=""  lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">等级：</label>
				<div class="layui-input-block widths">
					<select name="guestRoomLevelID" lay-verify="required">
						<c:forEach items="${glist}" var="item">
							<option value="${item.id}">${item.guestRoomLevel}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">价格：</label>
				<div class="layui-input-block widths">
					<input type="text" name="referencePrice" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_add">提交</div>
				</div>
			</div>

		</form>

	</div>
	<!-- 修改 -->
	<div id="modify_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label">平台名称：</label>
				<div class="layui-input-block widths">
					<input type="text" name="name" id="name" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_modify">添加</div>
				</div>
			</div>

		</form>

	</div>
	<div class="x-body">
		<table class="layui-table">
			<thead>
			<tr>
				<th>序号</th>
				<th>酒店名称</th>
				<th>房间号</th>
				<th>床位数</th>
				<th>类型</th>
				<th>参考价</th>
				<%--<th>是否启用</th>--%>
				<%--<th width="200px">备注</th>--%>
			</tr>
			<c:forEach items="${list.result}" var="item">
				<tr>
					<th>${item.id}</th>
					<th>${item.supplierName}</th>
					<th>${item.roomNumber}</th>
					<th>${item.roomAmount}</th>
					<th>${item.guestRoomLevelName}</th>
					<th>${item.referencePrice}</th>
					<%--<th>${item.count}</th>--%>
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
            form.on('submit(update_add)',function (obj) {
                var param =obj.field;
                console.log(falg=name())
			if (falg==true) {
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/RoomSet/add.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                                /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                                document.getElementById("room").value="";     //这个id的文本框的值 将会清空
                                document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                                return false;
                            }else {
                                alert("新增成功！"+' \n '+"succeeded");
                                location.href='${ctx}/RoomSet/tolist.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })
            }
            });



		})

        $('#room').blur(function() {
            var order=document.getElementById("room").value;
            var supplierID=document.getElementById("supplierID").value;
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/RoomSet/YZ.do',       //地址 type 带参数
                data:"orderNumber="+order+"&supplierID="+supplierID,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result>=1){
                        alert("房号重复！"+' \n '+"Duplicate room number");                     //提示框
                        document.getElementById("room").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                        return false;
                    }else {
                        return false;
                    }
                },
                error: function(data) {  }
            })
        })
	</script>
</html>