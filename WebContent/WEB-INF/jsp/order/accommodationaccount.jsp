<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>酒店管理-已到账</title>
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
		<link rel="stylesheet" href="${ctx}/js/lib/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>

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
			font-size: 16px;
		}
	</style>
	<body>
	<div class="layui-container">
		<div class="layui-row">
		<c:forEach items="${list.result}" var="item">
			<div class="layui-col-md6 layui-col-xs12 layui-col-md6">
				<div class="rmb-box-ht">
					<div class="rmb-title layui-row">
						<div class="layui-col-xs2"><span class="layui-badge-rim">${item.platformName}</span></div>
						<div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
						<div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs1"><span class="layui-badge layui-bg-gray">${item.checkinNumber}间</span></div>
						<div class="layui-col-xs4">${item.roomNumber}房</div>
						<div class="layui-col-xs7 "><span style="padding:0px 10px;">${item.name}</span><span>联系电话：${item.phoneNumber}</span></div>
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
					<%--<div class="rmb-title layui-row">
						<div class="layui-col-xs2 layui-col-xs-offset8"><span class="layui-btn layui-btn-normal layui-btn-sm">确认</span></div>
						<div class="layui-col-xs2 "><span class="layui-btn layui-btn-normal layui-btn-sm">撤销</span></div>
					</div>--%>
				</div>
			</div>
</c:forEach>
			<div class="layui-col-md6 layui-col-xs12 layui-col-md6">
				<div class="rmb-box-ht">
					<div class="rmb-title layui-row">
						<div class="layui-col-xs2"><span class="layui-badge-rim">安可达</span></div>
						<div class="layui-col-xs4 layui-col-md3">12088799533</div>
						<div class="layui-col-xs4"><span class="layui-badge-rim">JDH酒店公寓</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs1"><span class="layui-badge layui-bg-gray">1间</span></div>
						<div class="layui-col-xs4">2529房</div>
						<div class="layui-col-xs7 "><span style="padding:0px 10px;">林萌</span><span>联系电话：17578778757</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs1"><span class="layui-badge layui-bg-gray">1晚</span></div>
						<div class="layui-col-xs7"><span>2020-03-06</span> 至 <span>2020-03-07</span></div>
						<div class="layui-col-xs4 layui-col-md3"><span>10:00</span> 至 <span>14:00</span></div>
					</div>
					<div class="rmb-title layui-row">
						<div class="layui-col-xs4"><span>总价：RMB 534555</span></div>
						<div class="layui-col-xs3"><span>账户：支付宝</span></div>
						<div class="layui-col-xs5"><span>到账：2020-03-06 10:30</span></div>
					</div>
					<%--<div class="rmb-title layui-row">
						<div class="layui-col-xs2 layui-col-xs-offset8"><span class="layui-btn layui-btn-normal layui-btn-sm">确认</span></div>
						<div class="layui-col-xs2 "><span class="layui-btn layui-btn-normal layui-btn-sm">撤销</span></div>
					</div>--%>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="x-body">
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
    </div> -->
	<script type="text/html" id="add">
		<div class="layui-btn layui-btn-normal" onclick="add()"><i class=" layui-icon layui-icon-addition "></i>添加</div>
	</script>
	<script type="text/html" id="operation">
		<!-- <div class="layui-btn layui-btn-normal" onclick="modify()"><i class=" layui-icon layui-icon-edit "></i>修改</div> -->
		{{# if(d.status=="A"){ }},
		< div class="layui-btn layui-btn-sm layui-btn-normal">确认入住</div>
		{{# }else if(d.status=="B"){ }}
		< div class="layui-btn layui-btn-sm layui-btn-normal">撤销入住</div>
		{{# }else if(d.status==""){ }}
		< div class="">确认入住</div>
		{{# }else if(d.status=="D"){ }}
		< div class="">已撤销</div>
		{{# }}}
	</script>
	</body>
	<script>
        function add() {
            index = layer.open({
                type: 1,
                area: ['40%', '85%'],
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
	</script>
	<!-- 添加部分 -->
	<div id="add_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label">订单号：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">平台：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">酒店：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">房间号：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">旅客姓名：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">联系方式：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">币种：</label>
				<div class="layui-input-block widths">
					<input type="radio" name="sex" value="" title="人民币-￥">
					<input type="radio" name="sex" value="男" title="菲律宾币-₱">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">参考价：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入住时间：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">退房时间：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入住人数：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<div class="layui-btn" lay-submit lay-filter="update_Pwd">添加</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 修改部分 -->
	<div id="modify_apar" class="layui-fluid">
		<form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
			<div class="layui-form-item">
				<label class="layui-form-label">平台：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">酒店：</label>
				<div class="layui-input-block widths">
					<input type="password" name="firstPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">房间号：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">旅客姓名：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">币种：</label>
				<div class="layui-input-block widths">
					<input type="radio" name="sex" value="" title="人民币-￥">
					<input type="radio" name="sex" value="男" title="菲律宾币-₱">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">参考价：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入住时间：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">退房时间：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input time" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入住人数：</label>
				<div class="layui-input-block widths">
					<input type="password" name="secondPwd" class="layui-input " lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">参考价：</label>
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
                            title: '平台'
                        },
                        {
                            field: 'account',
                            align: 'center',
                            title: '酒店名'
                        },
                        {
                            field: 'account',
                            align: 'center',
                            title: '房间号'
                        },
                        {
                            field: 'userName',
                            align: 'center',
                            title: '等级'
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
                            title: '订单号'
                        },
                        {
                            field: 'userName',
                            align: 'center',
                            title: '到账时间'
                        },
                        {
                            field: '',
                            align: 'center',
                            title: '预定时间'
                        },
                        {
                            field: '',
                            align: 'center',
                            title: '入住时间'
                        },
                        {
                            field: 'userName',
                            align: 'center',
                            title: '退房时间'
                        },
                        {
                            field: 'userName',
                            align: 'center',
                            title: '参考价'
                        },
                        {
                            field: 'account',
                            align: 'center',
                            title: '操作',
                            width: 300,
                            toolbar: '#operation'
                        }
                    ]
                ],
                toolbar: '#add',
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
