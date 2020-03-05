<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />


	<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
	<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
	<link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
	<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/common.js"></script>

	<style>

		.container{
			margin-top: 10px;
		}

		.theadone{
			background-color: #CCFF99;
		}

		.floatont{
			float:left;
		}


		.margin-top-one{
			margin-top: -15px;
		}


		.span12{
			width:95%;
		}

		.table th,.table td{
			text-align: center;
		}
		.yanseblue{
			color:blue;
		}
		.yansered{
			color:red;
		}

	</style>

</head>


<body >
<div class="container" style="height:630px;overflow-x:auto;">
	<input type="hidden" id="minId" value="${min}"/>
	<input type="hidden" id="maxId" value="${max}"/>

	<div class="span11" style=" border: solid; border-color: #DDDDDD;">
		<div class="span9 margin-top-one">
			<div class="row-fluid">
				<h3 style="text-align: center;">房间信息详情  Room information details </h3>

			</div>
		</div>

		<div class="span4" >
			<div class="row-fluid" >
				<div class="span4 pull-right"  style="margin-bottom: 8px;">
					<button class="btn btn-warning" type="button" onclick="deletefunction();">
						<li class="icon-remove icon-white"></li>cancel</button>
				</div>
			</div>
		</div>

		<div class="span6">
			<div class="row-fluid">
				<div class="span4"  style="margin-bottom:8px;">
					<button id="btn1" class="btn btn-warning btn-small pull-right" type="button" onclick="hedden();">
						<li class="icon-chevron-down icon-white"></li>show</button>
					<button id="btn2" class="btn btn-inverse btn-small pull-right" type="button" onclick="hedden2();" style="display: none" >
						<li class="icon-chevron-up icon-white"></li>hidden</button>
				</div>
			</div>
		</div>
		<div action="${ctx}/StayRegister/add.do" method="post" onsubmit="return verify();">
			<div id="divhidden" hidden>
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">房间号：<br/><span style="font-size: 12px;">Room Number</span></label>
							<label class="yanseblue">${list[0].roomNumber}</label>
						</div>
						<div class="span4">
							<label class="floatont">客房等级：<br/><span style="font-size: 12px;">Guest room rating</span></label>
							<label class="yanseblue">${list[0].roomGuestRoomLevelName}</label>
						</div>
						<div class="span4">
							<label class="floatont">接待对象：<br/><span style="font-size: 12px;">Reception object</span></label> <!-- 散客 -->
							<label class="yanseblue">${list[0].receiveTeamName==""?"散客":list[0].receiveTeamName}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">团队编码：<br/><span style="font-size: 12px;">Team coding</span></label>
							<label class="yanseblue">${list[0].receiveTeamCode}</label>
						</div>
						<div class="span4">
							<label class="floatont">负责人：<br/><span style="font-size: 12px;">Person in charge</span></label>
							<label class="yanseblue">${list[0].receivePrincipal}</label>
						</div>
						<div class="span4">
							<label class="floatont">团队电话：<br/><span style="font-size: 12px;">Team phone</span></label> <!-- 团队 -->
							<label class="yanseblue">${list[0].receiveTargetID==2?"":list[0].receiveContactPhoneNUmber}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">旅客姓名：<br/><span style="font-size: 12px;">Name of passenger</span></label>
							<label class="yanseblue">${list[0].passengerName}</label>
						</div>
						<div class="span4">
							<label class="floatont">旅客性别：<br/><span style="font-size: 12px;">Sex of passengers</span></label>
							<label class="yanseblue">${list[0].passengerGenderName}</label>
						</div>
						<div class="span4">
							<label class="floatont">旅客电话：<br/><span style="font-size: 12px;">Passenger telephone</span></label>
							<label class="yanseblue">${list[0].pssengerContactPhoneNumber}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">旅客类别：<br/><span style="font-size: 12px;">Passenger category</span></label>
							<label class="yanseblue">${list[0].passengerTypeName}</label>
						</div>
						<div class="span4">
							<label class="floatont">登记时间：<br/><span style="font-size: 12px;">Registration time</span></label>
							<label class="yanseblue">${list[0].registerTime}</label>
						</div>
						<div class="span3">
							<label class="floatont">出租方式：<br/><span style="font-size: 12px;">Rental mode</span></label>
							<label class="yanseblue">${list[0].rentOutTypeName}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">结账方式：<br/><span style="font-size: 12px;">Checkout method</span></label>
							<label class="yanseblue">${list[0].payWayName}</label>
						</div>
						<div class="span4">
							<label class="floatont">结账单位：<br/><span style="font-size: 12px;">Checkout unit</span></label>
							<c:if test="${list[0].currency==1}">
								<label class="yanseblue">人民币(RMB)</label>
							</c:if>
							<c:if test="${list[0].currency==2}">
								<label class="yanseblue">菲律宾币 PHP</label>
							</c:if>
						</div>
						<div class="span4">
							<label class="floatont">是否预订：<br/><span style="font-size: 12px;">Are you booking?</span></label>
							<label style="color:orange">${list[0].predetermineID==null?"否":"是"}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">房价/天：<br/><span style="font-size: 12px;">housing price/day</span></label>
							<label class="yanseblue">${list[0].roomStandardPriceDay}</label>
						</div>
						<div class="span4">
							<label class="floatont">房价/小时：<br/><span style="font-size: 12px;">housing price/hour</span></label>
							<label class="yanseblue">${list[0].roomStandardPrice}</label>
						</div>
						<div class="span3">
							<label class="floatont">首段价格：<br/><span style="font-size: 12px;">First price</span></label>
							<label class="yanseblue">${list[0].roomFirstPrice}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">入住时间：<br/><span style="font-size: 12px;">Checkin time</span></label>
							<label class="yanseblue">${list[0].checkintime}</label>
						</div>
						<div class="span4">
							<label class="floatont">退房时间：<br/><span style="font-size: 12px;">Checkout time</span></label>
							<label class="yanseblue">${list[0].checkouttime}</label>
						</div>
						<div class="span3">
							<label class="floatont">总费用:<br/><span style="font-size: 12px;">Total cost</span></label>
							<label class="yanseblue">${list[0].accountsreceivable}</label>
						</div>
					</div>
				</div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">平台名称：<br/><span style="font-size: 12px;">Platform name</span></label>
							<label class="yanseblue">${stay.name}</label>
						</div>
						<div class="span4">
							<label class="floatont">订单号：<br/><span style="font-size: 12px;">Order number</span></label>
							<label class="yanseblue">${stay.codeNumber}</label>
						</div>
						<div class="span3">
							<label class="floatont">订单状态：<br/><span style="font-size: 12px;">Order status</span></label>
							<c:if test="${stay.ostatus==0}">
								<label class="yanseblue">已预订<br/><span style="font-size: 12px;">Booked</span></label>
							</c:if>
							<c:if test="${stay.ostatus==1}">
								<label class="yanseblue">已入住<br/><span style="font-size: 12px;">Checked in</span></label>
							</c:if>
							<c:if test="${stay.ostatus==2}">
								<label class="yanseblue">已取消<br/><span style="font-size: 12px;">Cancelled</span></label>
							</c:if>
							<c:if test="${stay.ostatus==3}">
								<label class="yanseblue">已结账<br/><span style="font-size: 12px;">Settled accounts</span></label>
							</c:if>

						</div>
					</div>
				</div>
			</div></div>
				<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->


				<div class="span10 margin-top-one">
					<fieldset>
						<legend >预订信息：<br/><span style="font-size: 12px;">Reservation information</span></legend>
					</fieldset>
				</div>
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<label class="floatont">预订者姓名：<br/><span style="font-size: 12px;">Name of subscriber</span></label>
							<label class="yanseblue">${list[0].predeterminePassengerName}</label>
						</div>
						<div class="span3">
							<label class="floatont">联系电话：<br/><span style="font-size: 12px;">Contact number</span></label>
							<label class="yansered">${list[0].predeterminePassengerContactPhoneNumber}</label>
						</div>
					</div>
				</div>
			<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

			<div class="span10 margin-top-one">
				<fieldset>
					<legend>消费记录：<span style="font-size: 12px;">Records of consumption</span></legend>
				</fieldset>
			</div>

			<div class="dgvone">
				<div class="span12">
					<table class="table table-condensed table-bordered table-striped" id="tableid">
						<thead class="theadone">
						<tr>
							<th >商品名称<br/><span style="font-size: 12px;">Trade name</span></th>
							<th >商品类别<br/><span style="font-size: 12px;">Commodity category</span></th>
							<th >计量单位<br/><span style="font-size: 12px;">Unit of measurement</span></th>
							<th >消费数量<br/><span style="font-size: 12px;">Consumption quantity</span></th>
							<th >销售价格<br/><span style="font-size: 12px;">Selling price</span></th>
							<th >消费时间<br/><span style="font-size: 12px;">dissipate</span></th>
						</tr>
						</thead>
						<tbody id="tbodyTwo">
						<c:forEach items="${listXiaoFei}" var="item">
							<tr>
								<td>${item.commodityName}</td>
								<td>${item.commodityTypeName}</td>
								<td>${item.commodityUOMName}</td>
								<td>${item.consumptionNumber}</td>
								<td>${item.commoditySalePrice}</td>
								<td>${item.consumptionTime}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
			</div>
		</div>
	</div>
		</form>

	</div>



<script type="text/javascript">

    document.getElementById("btn2").style.display="none"; //隐藏



    function deletefunction(){
        var datemin=document.getElementById("minId").value;
        var datemax=document.getElementById("maxId").value;
        parent.document.getElementById('Mainid').src='${ctx}/FinancialStatistics/tolist.do?datemin='+
            datemin+'&datemax='+datemax;
    }




    function hedden(){
        document.getElementById("divhidden").style.display="block"; //显示
        document.getElementById("btn2").style.display="block"; //隐藏
        document.getElementById("btn1").style.display="none"; //隐藏
    }
    function hedden2(){
        document.getElementById("divhidden").style.display="none"; //显示
        document.getElementById("btn2").style.display="none"; //隐藏
        document.getElementById("btn1").style.display="block"; //隐藏
    }
</script>
</body>
</html>
