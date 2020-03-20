<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<html>
	<head>
		<meta charset="utf-8">
		<title>财务管理-财务明细</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />

		<link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/css/index.css" />
		<link rel="stylesheet" href="${ctx}/css/administration.css" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css" />
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
		<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>


		<script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>

		<script type="text/javascript" src="${ctx}/js/language.js"></script>
	</head>
	<style>
		.x-body{
			padding: 10px;
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
				<div class="layui-input-inline">
					<input type="text" name="time" id="time" placeholder="订单时间" autocomplete="off" class="layui-input time" style="width: 200px;">
				</div>

				<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
			</form>

		</div>

	<div class="x-body">
		<p id="exc" value="导出">
			<a id="consumesOutExcel" class="easyui-linkbutton" style="" data-options="iconCls:'icon-redo'"  lang>excel</a></p>
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
						<td onclick="change(${item.id})">否</td>
					</c:if>
					<c:if test="${item.isdao==2}">
						<td>是</td>
					</c:if>
					<td>${item.daotime}</td>


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
	</div>

	<script type="text/javascript">
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
        /* 分页要用的 */
        $(".tcdPageCode").createPage({

            pageCount:${list.totalPage},
            current:${list.currentPage},
            backFn:function(p){
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                location.href="${ctx}/Hotelm/myfinance.do?currentPage="+p+
                    "&orderNumber="+orderNumber+"&pname="+pname;
            }
        });

        $(function() {
            //导出excel表
            $("#consumesOutExcel").on('click',function(){
                var time=document.getElementById("time").value;
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                $.messager.progress({
                    title : '处理中',
                    msg : '请稍后',
                });
                $.messager.progress('close');
                location.href='${ctx}/Hotelm/excel.do?time='+time+'&orderNumber='+orderNumber+'&pname='+pname;

            });
        });
	</script>

	<script>

            layui.use(['form', 'table'], function() {
                var form = layui.form,
                    table = layui.table;

                form.render()
                form.on('submit(search)',function (obj) {
                    var orderNumber=document.getElementById("orderNumber").value;
                    var pname=document.getElementById("pname").value;
                    location.href="${ctx}/Hotelm/myfinance.do?orderNumber="+orderNumber+"&pname="+pname;


                });
            });

            $("#exc").click(function () {
                var time=document.getElementById("time").value;
                var orderNumber=document.getElementById("orderNumber").value;
                var pname=document.getElementById("pname").value;
                $.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Hotelm/excel.do',       //地址 type 带参数
                    data:"time="+time+"&orderNumber="+orderNumber+"&pname="+pname,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if(result!=1){
                            /* alert("新增订单失败，"+' \n '+"Failed to add order");*/
                            return false;
                        }else {
                            /* alert("新增订单成功！"+' \n '+"New order succeeded");*/
                            location.href='${ctx}/Hotelm/myfinance.do?time='+time+"&orderNumber="+orderNumber+"&pname="+pname;
                            return true;
                        }
                    },
                    error: function(data) {  }
                });
            })
	</script>

	<script>
        function setExcel() {
           /* var data = {
                dpid: getUser().deptId,
                openid: getUser().wechat,
                timeStart: dateStart,
                timeEnd: dateEnd
            }*/
            $.ajax({
                type: "post",
                url: httpUrl() + "/kq/importDailyList?dpid=" + getUser().deptId + "&openid=" + getUser().wechat + "&timeStart=" + dateStart + "&timeEnd=" + dateEnd,
                async: false,
                headers: {
                    'content-type': 'application/x-www-form-urlencoded',
                    'accessToken': getToken()
                },
                contentType: "application/json",
                dataType: 'json',
                success: function(res) {
                    var tableStr = '<table border="0" cellspacing="" cellpadding="">'
                    tableStr += '<tr>';
                    tableStr += '<th width="15%">' + '序号' + '</td>';
                    tableStr += '<th width="15%">' + '姓名' + '</td>';
                    tableStr += '<th width="15%">' + '部门' + '</td>';
                    tableStr += '<th width="15%">' + '考勤' + '</td>';
                    tableStr += '<th width="15%">' + '打卡时间' + '</td>';
                    tableStr += '<th width="15%">' + '考勤时间' + '</td>';
                    tableStr += '<th width="15%">' + '状态' + '</td>';
                    tableStr += '</tr>';
                    var len = res.data.length;
                    var data = res.data;
                    for(var i = 0; i < len; i++) {
                        tableStr += '<tr>';
                        tableStr += '<td>' + i+1 + '</td>';
                        tableStr += '<td>' + data[i].peopleName + '</td>';
                        tableStr += '<td>' + data[i].department + '</td>';
                        tableStr += '<td>' + data[i].jurisdiction + '</td>';
                        if(data[i].stuas == 1) {
                            tableStr += '<td>' + '上班打卡' + '</td>';
                        } else if(data[i].stuas == 2) {
                            tableStr += '<td>' + '下班打卡' + '</td>';
                        }
                        tableStr += '<td>' + new Date(+new Date(data[i].chockinTime) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '') + '</td>'
                        tableStr += '<td>' + new Date(+new Date(data[i].time) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '') + '</td>'
                        if(data[i].stuas2 == 0) {
                            tableStr += '<td>' + '正常' + '</td>';
                        } else if(data[i].stuas2 == 1) {
                            tableStr += '<td>' + '考勤异常' + '</td>';
                        } else if(data[i].stuas2 == 2) {
                            tableStr += '<td>' + '迟到' + '</td>';
                        } else if(data[i].stuas2 == 3) {
                            tableStr += '<td>' + '早退' + '</td>';
                        }
                        tableStr += '</tr>';
                    }
                    if(len == 0) {
                        tableStr += '<tr style="text-align: center">';
                        tableStr += '<td colspan="6">' + '暂无记录' + '</font></td>';
                        tableStr += '</tr>'
                    }
                    tableStr +='</table>';
                    //添加到div中
                    document.getElementById("exportBtn").onclick = function() {
                        exporExcel("考勤记录", tableStr);
                    }
                }
            });
        }
        /**
         * 注：如果想设置单元格格式，比如数字太多，默认导出会按科学计数法转换，这个时候要写成文本格式
         * 可以这样使用 在td 上 使用style；如：<td style='mso-number-format:"@";'>第一行 </td>
         *   style='mso-number-format:"@";'  转文本
         * **/
        /**
         * @params: FileName:导出Excel的文件名称，excel:需要导出的table
         * 如果没有table列表，只有json数据的话，将json数据拼接成table字符串模板即可
         * **/
        function exporExcel(FileName, excel) {
            var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
            excelFile += '<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
            excelFile += '<meta http-equiv="content-type" content="application/vnd.ms-excel';
            excelFile += '; charset=UTF-8">';
            excelFile += "<head>";
            excelFile += "<!--[if gte mso 9]>";
            excelFile += "<xml>";
            excelFile += "<x:ExcelWorkbook>";
            excelFile += "<x:ExcelWorksheets>";
            excelFile += "<x:ExcelWorksheet>";
            excelFile += "<x:Name>";
            excelFile += "{worksheet}";
            excelFile += "</x:Name>";
            excelFile += "<x:WorksheetOptions>";
            excelFile += "<x:DisplayGridlines/>";
            excelFile += "</x:WorksheetOptions>";
            excelFile += "</x:ExcelWorksheet>";
            excelFile += "</x:ExcelWorksheets>";
            excelFile += "</x:ExcelWorkbook>";
            excelFile += "</xml>";
            excelFile += "<![endif]-->";
            excelFile += "</head>";
            excelFile += "<body>";
            excelFile += excel;
            excelFile += "</body>";
            excelFile += "</html>";

            var uri = 'data:application/vnd.ms-excel;charset=utf-8,' + encodeURIComponent(excelFile);

            var link = document.createElement("a");
            link.href = uri;

            link.style = "visibility:hidden";
            link.download = FileName; //格式默认为.xls

            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
	</script>
	</body>
</html>
