<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>房型管理-房型信息</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/css/index.css" />
		<link rel="stylesheet" href="${ctx}/css/ht.css"/>
		<link rel="stylesheet" href="${ctx}/css/administration.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
		<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
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
						<input type="text" name="homeType" placeholder="房型关键字" autocomplete="off"
							   class="layui-input"  id="homeType" style="width: 200px;" value="${homeType}">
					</div>
			
					<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
				</form>
			</div>
			<%--<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
				<div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>add</div>
			</div>--%>
		</div>
	</body>
	<!-- 添加 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<input id="id" type="hidden" value="">
				<label class="layui-form-label"><span lang>hometye</span>：</label>
				<div class="layui-input-block widths">
					<input type="text" name="guestRoomLevel" id="guestRoomLevel" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_add" lang>Submission</div>
				</div>
			</div>

		</form>

	</div>
	<!-- 修改 -->
	<div id="modify_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="test">
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>hometye</span>：</label>
				<div class="layui-input-block widths">
					<input type="hidden" name="id"  class="layui-input ">
					<input type="text" name="guestRoomLevel"  class="layui-input " lay-verify="required">
				</div>
			</div>
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
				<th colspan="2">
					<div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>addtype</div>
				</th>
				<th colspan="1">
					<div class="layui-btn layui-btn-sm layui-btn-normal toaddorder" lang>addorder</div>
				</th>
			</tr>
			<tr>
				<th lang>serial</th>
				<th lang>homeType</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list.result}" var="item">
				<tr>
					<th>${item.id}</th>
					<th onclick="data(${item.id},'${item.guestRoomLevel}')">${item.guestRoomLevel}</th>
					<th>
						<div class=" layui-btn layui-btn-normal layui-btn-sm"
							 onclick="updatetype(${item.id},'${item.guestRoomLevel}')" lang>amended</div>
						<div class=" layui-btn layui-btn-normal layui-btn-sm"
							 onclick="checkroom(${item.id},'${item.guestRoomLevel}')" lang>checkroom</div>
						<%--<div class=" layui-btn layui-btn-normal layui-btn-sm toadd"
							 onclick="add(${item.id},${item.guestRoomLevel})" lang>addroom</div>--%>
					</th>
				</tr>
			</c:forEach>
			</thead>
		</table>
		<div class="span11">
			<div class="row-fluid">
				<div class="tcdPageCode" style="text-align:center;"></div>
			</div>
		</div>
	</div>

	<div id="add" class="layui-fluid" style="display: none">
		<form class="layui-form" autocomplete="off" lay-filter="test">
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>order</span>:</label>
				<div class="layui-input-block widths">
					<input type="hidden" name="roomId"/>
					<input type="text" name="orderNumber" id="order" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>patform</span>:</label>
				<div class="layui-input-block widths">
					<select name="platformId" lay-verify="required" id="pt">
						<c:forEach items="${plist}" var="item">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>

					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>homeType</span>:</label>
				<div class="layui-input-block widths">
					<select name="hotelmId" lay-verify="required" id="fx" lay-filter="fx">
						<%--<option value="0">请选择</option>--%>
						<c:forEach items="${glist}" var="item">
							<option value="${item.id}">${item.guestRoomLevel}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>supplier</span>:</label>
				<div class="layui-input-block widths">
					<%--<input type="text" name="hotelmName" value="" readonly  class="layui-input">
					<input type="text" name="hotelmId" class="layui-input" value="" readonly>--%>
					 <select name="hotelmId" lay-verify="required" id="gys" lay-filter="gys">
						 <option value="-1">请选择</option>
                        <%-- <c:forEach items="${slist}" var="item">
                             <option value="${item.id}">${item.supplierName}</option>
                         </c:forEach>--%>
                     </select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>roomNumber</span>:</label>
				<div class="layui-input-block widths">
					<select name="roomId" lay-verify="required" id="room">
						<option value="-1">请选择</option>
						<%-- <c:forEach items="${slist}" var="item">
                             <option value="${item.id}">${item.supplierName}</option>
                         </c:forEach>--%>
					</select>
					<%--<input type="hidden" name="roomId" value="" lay-verify="required">
					<input type="text" name="roomNumber" class="layui-input" value="" readonly lay-verify="required">--%>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>currency</span>:</label>
				<div class="layui-input-block widths">
					<select name="currency" lay-verify="required">
						<option value="-1"></option>
						<option value="1" lang>RMB</option>
						<option value="2" lang>PHP</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>Price</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="money" class="layui-input " lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>checkin</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkinTime" id="checkinTime" class="layui-input time"
						   lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>checkout</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkoutTime" class="layui-input time" id="checkoutTime" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>name</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="name" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>phone</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="phoneNumber" class="layui-input " lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item" style="display:none;">
				<label class="layui-form-label"><span lang>checknumber</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkinNumber" id="checkinNumber" value="1" class="layui-input " >
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>checkinRoom</span>:</label>
				<div class="layui-input-block widths">
					<input type="text" name="checkinRoom" id="checkinRoom" class="layui-input " lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>account</span>:</label>
				<div class="layui-input-block widths">
					<input type="radio" name="isdao" value="2" title="是">
					<input type="radio" name="isdao" value="1" title="否" checked="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>accounts</span>:</label>
				<div class="layui-input-block widths">
					<select name="account" lay-verify="required" id="zh">
						<c:forEach items="${alist}" var="item">
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span lang>intype</span>:</label>
				<div class="layui-input-block widths">
					<select name="type" lay-verify="required" id="rzlx" lay-filter="rzlx">
							<option value="3" lang>自有整租</option>
						<option value="2" lang>contract</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="addMenu" lang>Submission</div>
				</div>
			</div>

		</form>
	</div>
	<script>
        /* 分页要用的 */
        $(".tcdPageCode").createPage({
            pageCount:${list.totalPage},
            current:${list.currentPage},
            backFn:function(p){
                var homeType=document.getElementById("homeType").value;
                location.href="${ctx}/WholeHotel/homeType.do?hometype="+homeType+"&currentPage="+p;
            }
        });
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
		function toaddorder() {
            index = layer.open({
                type: 1,
                area: ['60%', '90%'],
                anim: 2,
                title: '添加订单',
                maxmin: true,
                /* shadeClose: true, //点击遮罩关闭*/
                content: $('#add'),
                cancel: function () {
                    window.location.reload();
                    $("#add").css('display', 'none');
                }
            });
            registerWords();
            setLanguage(getCookieVal("lang"));
        }

	</script>
	<script>
		layui.use(['form', 'table','element','laydate'], function() {
			var form = layui.form,
                element = layui.element,
                laydate=layui.laydate,
				table = layui.table;


            element.init();
            form.render()

            $('.time').each(function () {
                laydate.render({
                    elem: this,
                    type: 'datetime'
                });
            })
			window.updatetype=function(vuale,vuale2){
                form.val('test', {
                    "id": vuale,
                    "guestRoomLevel":vuale2
                    /* "roomId":list.roomId,
                     "cid":list.cid*/
                });
                modify()
			}

            $(document).on('click','.toadd',function(){
                add();
            });
            $(document).on('click','.toaddorder',function(){
                toaddorder();
            });

            var falg;
            form.on('submit(update_add)',function (obj) {
                var param =obj.field;
                console.log(falg=name())
			if (falg==true) {
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/WholeHotel/addType.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                                /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                                return false;
                            }else {
                                alert("新增成功！"+' \n '+"succeeded");
                                location.href='${ctx}/WholeHotel/homeType.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })
            }
            });
            var falgs;
            form.on('submit(update_Pwd)',function (obj) {
                var param =obj.field;
                console.log(falgs=nameYZ(param))
                if (falgs==true) {
                    $.ajax({
                        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/WholeHotel/updateType.do',       //地址 type 带参数
                        data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if(result!=1){
                                /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                                return false;
                            }else {
                                alert("新增成功！"+' \n '+"succeeded");
                                location.href='${ctx}/WholeHotel/homeType.do';
                                return true;
                            }
                        },
                        error: function(data) {  }
                    })
                }
            });
            //下拉框选择改变事件
            form.on('select(fx)', function(data){
                console.log(data.elem); //得到select原始DOM对象
                console.log(data.value); //得到被选中的值
                console.log(data.othis); //得到美化后的DOM对象
				$.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/WholeHotel/room.do',       //地址 type 带参数
                    data:"guestId="+data.value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        $('#gys').empty();
                        var gysStr = '';
                        if(result.length>0){
                            $.each(result, function (index, item) {
                                gysStr += '<option value="' + item.supplierId + '">' + item.supplierName + '</option>';
                            });
                        }else {
                            gysStr += '<option value="-1">无数据</option>';
                        }
                        $('#gys').append(gysStr);
                        element.render();
                        form.render();
                    },
                    error: function(data) {  }
				})
            });

            //下拉框选择改变事件
            form.on('select(gys)', function(data){
                console.log(data.elem); //得到select原始DOM对象
                console.log(data.value); //得到被选中的值
                console.log(data.othis); //得到美化后的DOM对象
				var guestid=document.getElementById("fx").value;
				/*alert(guestid);*/
                $.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/WholeHotel/rommByHotelAndGuest.do',       //地址 type 带参数
                    data:"supplierId="+data.value+"&guestId="+guestid,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        $('#room').empty();
                        var gysStr = '';
                        if(result.length>0){
                            $.each(result, function (index, item) {
                                gysStr += '<option value="' + item.id + '">' + item.roomNumber + '</option>';
                            });
                        }else {
                            gysStr += '<option value="-1">无数据</option>';
                        }
                        $('#room').append(gysStr);
                        element.render();
                        form.render();
                    },
                    error: function(data) {  }
                })
            });
            form.on('submit(addMenu)', function (obj) {
                var param = obj.field;
                console.log(param)
                //判断下拉框
                if (param.currency == -1) {
                    layer.msg('请选择币种!');
                    return false;
                }
                var checkin = param.checkinTime;
                var checkout = param.checkoutTime;
                if (checkin > checkout) {
                    layer.msg('时间不正确!');
                    return;
                }
                var reg = new RegExp('^[1-9](\\d{1,9})((\\.\\d{1,3})?)$');
                var s = param.money;
                if (reg.test(s)) {
                    console.log('true');
                } else {
                    layer.msg('价格输入不正确，不超过9位数!');
                    return;
                }
               /* day(param)*/
                if (day(param)) {
                    $.ajax({
                        cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/WholeHotel/addOrder.do',       //地址 type 带参数
                        data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async: false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                                layer.msg('新增订单成功！');
                                location.href = "${ctx}/Order/pageorders.do";

                        },
                        error: function (data) {
                        }
                    })
                    return false
                } else {
                }

                function day(param) {
                    var bl = true
                    //下拉框选择改变事件
                    form.on('select(rzlx)', function(data){
                        console.log(data.value); //得到被选中的值
                 if (data.value==3){
                    $.ajax({
                        cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/WholeHotel/YZDay.do',       //地址 type 带参数
                        data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async: false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            console.log(result)
                            if (result !=0) {
                                layer.msg('入住失败，入住时间段内无足够空房！' + ' \n ' + 'Check in failed');
                                bl = false;
                            }
                        },
                        error: function (data) {
                            alert("请求失败")
                        }
                    })
				 }
                        return bl;
					})
                    return bl;
                }
            });

            form.on('submit(search)',function () {
				var homeType=document.getElementById("homeType").value;
				window.location='${ctx}/WholeHotel/homeType.do?hometype='+homeType;
            })
		})
        function name(){
            var order=document.getElementById("guestRoomLevel").value;
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/WholeHotel/YZ.do',       //地址 type 带参数
                data:"name="+order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result==1){
                        alert("名字重复！"+' \n '+"Duplicate name");                     //提示框
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

        function nameYZ(param){
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/WholeHotel/nameYZ.do',       //地址 type 带参数
                data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result==1){
                        alert("名字重复！"+' \n '+"Duplicate name");                     //提示框
                        falgs=false;
                        return falgs;
                    }else {
                        falgs=true;
                        return falgs;
                    }
                },
                error: function(data) {  }

            })
            return falgs;
		}
       window.checkroom=function (vuale) {
		    window.location='${ctx}/WholeHotel/roomByType.do?id='+vuale;
        }

        function data(value, value2) {
            index = layer.open({
                type: 2,
                area: ['90%', '90%'],
                anim: 2,
                title: value2,
                maxmin: true,
                shadeClose: true, //点击遮罩关闭
                content: '../date2/date.html?roomId=' + value,
                cancel: function () {
                    window.location.reload();
                }
            });
        }


	</script>


</html>
