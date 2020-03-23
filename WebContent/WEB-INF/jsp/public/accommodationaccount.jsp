<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>酒店管理-全部订单</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/css/index.css" />
		<link rel="stylesheet" href="${ctx}/css/administration.css" />
		<link rel="stylesheet" href="${ctx}/css/ht.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
		<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
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
		.layui-form-label{
			width: 110px;
		}
		.layui-input-block {
			margin-left: 150px
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
		<div class="layui-row"><%--action="${ctx}/Hotelm/allorder.do"--%>
			<form class="layui-form layui-col-md12" >
				<div class="layui-input-inline">
					<input type="text" name="pname" id="pname" value="${pname}" placeholder="姓名" autocomplete="off" class="layui-input" style="width: 200px;">
				</div>
				<div class="layui-input-inline">
					<input type="text" name="orderNumber" id="orderNumber" value="${orderNumber}" placeholder="订单号" autocomplete="off" class="layui-input" style="width: 200px;">
				</div>
				<%--<div class="layui-input-inline">
					<input type="text" name="courierName" placeholder="联系电话" autocomplete="off" class="layui-input" style="width: 200px;">
				</div>
				<div class="layui-input-inline">
					<input type="text" name="courierNumber" placeholder="登记时间" autocomplete="off" class="layui-input time" style="width: 200px;">
				</div>--%>

				<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
			</form>
			<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
				<div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>add</div>
			</div>
		</div>

		<div class="x-body">
			<table class="layui-table">
				<thead>
				<tr>
					<th lang>serial</th>
					<th lang>patform</th>
					<th lang>orderNumber</th>
					<th lang>hotelname</th>
					<th lang>roomNumber</th>
					<th lang>name</th>
					<th lang>phone</th>
					<th lang>checkin</th>
					<th lang>checkout</th>
					<th lang>checknumber</th>
					<th lang>Price</th>
					<th lang>account</th>
					<th lang>payment</th>
					<th lang>operation</th>
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
							<td onclick="change(${item.id})" lang>no</td>
						</c:if>
						<c:if test="${item.isdao==2}">
							<td lang>yes</td>
						</c:if>
						<td>${item.daotime}</td>
						<td>
							<input type="hidden" name="id" value="${item.id}" /><%--//获取这个值就可以--%>
							<c:if test="${item.status==1}"><%--//未确认 onclick="javascript:window.open('${ctx}/Hotelm/updateStatus.do?id=${item.id}&status=2')"--%>
								<span class=" layui-btn layui-btn-normal layui-btn-sm"
									  onclick="checkin(${item.id},2)" lang>confirm</span><%--//或者把这个值放this里面id--%>
								<span class=" layui-btn layui-btn-normal layui-btn-sm" onclick=" checkin(${item.id},3)"  lang>Revoke</span>
							</c:if>
							<c:if test="${item.status==2}"><%--//已确认确认--%>
							<span class=" layui-btn layui-btn-normal layui-btn-sm" onclick="checkin(${item.id},4)" lang>ins</span>
						</c:if>
							<c:if test="${item.status==3}"><%--//已撤销--%>
							<span class=" layui-btn layui-btn-normal layui-btn-sm layui-bg-gray" lang>rescinded</span>
						</c:if>
						<c:if test="${item.status==4}"><%--//已入住--%>
						<span class=" layui-btn layui-btn-normal layui-btn-sm" onclick="checkin(${item.id},5)" lang>out</span>
						</c:if>
							<c:if test="${item.status==5}"><%--//已入住--%>
								<span class=" layui-btn layui-btn-normal layui-btn-sm layui-bg-gray" lang>checkedout</span>
							</c:if>
						</td>

					</tr>
				</c:forEach>
				</thead>
			</table>

		</div>

		<div class="span11">
			<div class="row-fluid">
				<div class="tcdPageCode" style="text-align:center;"></div>
			</div>
		</div>

	</div>

	</body>

	<!-- 添加部分 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="hidden" name="id"/>
					<input type="text" name="orderNumber" value="" id="order" class="layui-input " lay-verify="required" onblur="order()">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>patform</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="paltform" value="" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>hotelname</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="hotelm" value="" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>roomNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="roomNumber" value="" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>name</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="pname" value="" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>phone</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="phone"  value=""class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>currency</span>：</label>
				<div class="layui-input-block widths">
					<select name="currency" lay-verify="required">
						<option value="-1"></option>
						<option value="1">RMB</option>
						<option value="2">PHP</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>Price</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="money"  value=""class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>checkin</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkintime" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>checkout</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkouttime" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>checknumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkinNumber" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>account</span>：</label>
				<div class="layui-input-block widths">
					<input type="radio" name="isdao" value="2" title="是">
					<input type="radio" name="isdao" value="1" title="否" checked="">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_Pwd" lang>Submission</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 修改部分 -->
	<div id="modify_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="radio" name="sex" value="" title="人民币-￥">
					<input type="radio" name="sex" value="男" title="菲律宾币-₱">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span>orderNumber</span>：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_Pwd">修改</div>
				</div>
			</div>
		</form>
	</div>
	<script>

        function add() {
            index = layer.open({
                type: 1,
                area: ['50%', '85%'],
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
                area: ['40%', '85%'],
                anim: 2,
                title: '修改',
                maxmin: true,
                shadeClose: true,
                content: $("#modify_apar")
            });
        }



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
        function checkin(value,v) {
            var falg=confirm("是否此操作？"+' \n '+"Confirm collection");
            if (falg==true){
                // location.href="${ctx}/Hotelm/isdao.do?id="+value;
                $.ajax({
                    cache:false,                                       //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "post",
                    url: '${ctx}/Hotelm/updateStatus.do',
                    dataType: "json",//地址 type 带参数"id="+id+"&timeOne="+from+"&timeTwo="+to,
                    data:"id="+value+"&status="+v,
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {
                        location.href='${ctx}/Hotelm/allorder.do';
                    }
                });
            }
        }


        layui.use(['form', 'table', 'laydate','laypage'], function() {
            var form = layui.form,
                laydate = layui.laydate;


            $('.time').each(function () {
                laydate.render({
                    elem: this,
                    type: 'datetime'
                });
            })
            $(document).on('click', '.todate', function () {
                $('this').addCss('bj');

            });

            $(document).on('click','.toadd',function(){
                add();

            });
            form.render()
            form.on('submit(update_Pwd)',function (obj) {
                var param =obj.field;
                //判断下拉框
                if (param.currency==-1){
                    layer.msg('请选择币种!');
                    return false;
                }
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/Hotelm/addOrder.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                                alert("新增订单失败，"+' \n '+"Failed to add order");
                                return false;
                            }else {
                                alert("新增订单成功！"+' \n '+"New order succeeded");
                                location.href='${ctx}/Hotelm/allorder.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })


        })



            $('#order').blur(function() {
                var order=document.getElementById("order").value;
                $.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Hotelm/codeNumberYZ.do',       //地址 type 带参数
                    data:"orderNumber="+order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if(result>=1){
                            alert("订单号重复！"+' \n '+"Duplicate order number");                     //提示框
                            document.getElementById("order").value="";     //这个id的文本框的值 将会清空
                            document.getElementById("order").focus();      // 给这个id的文本框提供焦点
                            return false;
                        }else {
                            return false;
                        }
                    },
                    error: function(data) {  }
                })
            })

            form.on('submit(search)',function (obj) {
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                location.href="${ctx}/Hotelm/allorder.do?orderNumber="+orderNumber+"&pname="+pname;


            });
        });

        /* 分页要用的 */
    $(".tcdPageCode").createPage({

            pageCount:${list.totalPage},
            current:${list.currentPage},
            backFn:function(p){
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                location.href="${ctx}/Hotelm/allorder.do?currentPage="+p+
					"&orderNumber="+orderNumber+"&pname="+pname;
            }
        });

	</script>
</html>
