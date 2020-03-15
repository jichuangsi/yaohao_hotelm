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

		.labelroomnumber{
			position: relative;
			font-size: 17px;
			float: left;
			margin-top: 15px;
		}

		.marginrightone{
			margin-right: 33px;
		}

		.marginrighttwo{
			margin-right: 16.5px;
		}

		.marginrightthree{
			margin-right: 43px;
		}

		.textone{
			margin-top:12px;
		}

		.inputone{
			width:54.2%;
		}

		.inputtwo{
			width:46.8%;
		}

		.inputthree{
			width:46.8%;
		}

		.cboone{
			margin-top:10px;
			height: 27px;
		}

		.margin-top-one{
			margin-top: -10px;
		}

		.margin-top-two{
			margin-top: -20px;
		}

		.textwidth{
			width: 138px;
		}

		.radiusone{
			margin-left: -4px;
		}

		@media(min-width:731px) and (max-width:767px){
			.inputthree{
				width: 50.5%;
			}
		}

		@media(min-width:550px) and (max-width:730px){
			.inputtwo{
				width: 46.2%;
			}
			.inputthree{
				width: 49.2%;
			}
		}


		@media(min-width:431px) and (max-width:550px){
			.inputtwo{
				width: 43.2%;
			}
			.inputthree{
				width: 47.5%;
			}
		}

		@media(min-width:366px) and (max-width:430px){
			.inputtwo{
				width: 40.2%;
			}
			.inputthree{
				width: 46%;
			}
		}

		@media(min-width:285px) and (max-width:366px){
			.inputtwo{
				width: 37.2%;
			}
			.inputthree{
				width: 44%;
			}
		}

		@media(min-width:237px) and (max-width:285px){
			.inputtwo{
				width: 30%;
			}
			.inputthree{
				width: 40%;
			}
		}
		.span12{
			width:95%;
		}

		.roomnumberwidth{
			width:50%;
		}

		.table th,.table td{
			text-align: center;
		}

	</style>

</head>


<body >
<div class="container" style="height:630px;overflow-x:auto;">

	<div class="span11" style=" border: solid; border-color: #DDDDDD;">
		<div class="span9 margin-top-one">
			<div class="row-fluid">
				<h3 style="text-align: center;">团队结账<span style="font-size: 12px;">Team checkout</span></h3>

			</div>
		</div>
		<form method="post" onsubmit="return verify()">
			<input id="receiveTargetID" type="hidden" name="receiveTargetID" value="${tuanDuiID}"/>

			<div class="span3" style="text-align:right;">
				<div class="row-fluid">
					<div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
						<button class="btn btn-primary" type="button" onclick="payFunction()">
							<li class="icon-check icon-white"></li>结账<span style="font-size: 12px;">Settle accounts</span></button>
					</div>

				</div>
			</div>

			<div class="span3" style="text-align:center;">
				<div class="row-fluid">
					<div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
						<button class="btn btn-danger " type="button" onclick="removefunction()">
							<li class="icon-check icon-white"></li>remove</button>
					</div>

				</div>
			</div>

			<div class="span4" style="text-align:left;">
				<div class="row-fluid">
					<div class="span4"  style="margin-top: 10px;margin-bottom: 8px;">
						<button class="btn btn-warning" type="button" onclick="deletefunction()">
							<li class="icon-remove icon-white"></li>cancel</button>
					</div>
				</div>
			</div>


			<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
			<div class="span12" style="margin-top:20px;">
				<div class="row-fluid">
					<div class="span4">
						<label class="floatont">接待对象：<br/><span style="font-size: 12px;">Receptionist</span></label>
						<label style="color:blue;">${list[0].receiveTeamName}</label>
					</div>
					<div class="span4">
						<label class="floatont">团队编号：<br/><span style="font-size: 12px;">Team number</span></label>
						<label>${list[0].receiveTeamCode}</label>
					</div>
					<div class="span4">
						<label class="floatont">负责人：<br/><span style="font-size: 12px;">Person in charge</span></label>
						<label>${list[0].receivePrincipal}</label>
					</div>
				</div>
			</div>

			<div class="span10">
				<fieldset>
					<legend></legend>
				</fieldset>
			</div>

			<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
			<div class="span12" >
				<div class="row-fluid">
					<div class="span4">
						<label class="floatont">房间数：<br/><span style="font-size: 12px;">Number of rooms</span></label>
						<label id="labelId">${fangJianShu}</label>
					</div>
					<div class="span4">
						<label class="floatont">结账时间：<br/><span style="font-size: 12px;">Checkout time</span></label>
						<label id="payTime">${timestamp}</label>
					</div>
					<div class="span4">
						<label class="floatont">结账方式：<br/><span style="font-size: 12px;">Checkout method</span></label>
						<select id="payWay" style="width:70%;height:27px;">
							<c:forEach items="${listPayWay}" var="item">
								<c:if test="${item.far_id==21}">
								<option value="${item.far_id}"selected="selected">
										${item.attributeDetailsName}(cash)
								</option>
							</c:if>
								<c:if test="${item.far_id==22}">
									<option value="${item.far_id}"selected="selected">
											${item.attributeDetailsName}(Transfer accounts)
									</option>
								</c:if>
								<c:if test="${item.far_id==23}">
									<option value="${item.far_id}"selected="selected">
											${item.attributeDetailsName}(Credit Card)
									</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->



			<div class="span10">
				<fieldset>
					<legend></legend>
				</fieldset>
			</div>

			<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
			<div class="span12" >
				<div class="row-fluid">
					<div class="span8">
						<label class="floatont">登记区段：<br/><span style="font-size: 12px;">Registration section</span></label>
						<!--最大日期为 id="datemax"的选中值或者当前系统日期-->
						<input style="width:32%;height:27px;" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate"> 一
						<!--最大日期为当前系统日期，最小日期为id="datemin选中值"-->
						<input style="width:33%;height:27px;" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate">
						<button onclick="timeAjaxSelectRoom()" type="button" class="btn-success" style="margin-top:-12px;height:25px;"><li class="icon-search icon-white"></li>查询</button>
					</div>
					<div class="span4">
						<label class="floatont">备注：<br/><span style="font-size: 12px;">Remarks</span></label>
						<input id="remarks" type="text" style="width:80%;height:27px;">
					</div>
				</div>
			</div>
			<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

			<div class="span12">
				<div style="height:278px;overflow-x:auto;">
					<table class="table table-condensed table-bordered table-striped" id="tableid">
						<thead class="theadone">
						<tr>
							<th>选择<br/><span style="font-size: 12px;">choice</span> </th>
							<th >房间号<br/><span style="font-size: 12px;">Room Number</span></th>
							<th >入住时间<br/><span style="font-size: 12px;">Checkin time</span></th>
							<th >退房时间<br/><span style="font-size: 12px;">Checkout time</span></th>
							<th >出租方式<br/><span style="font-size: 12px;">Rental mode</span></th>
							<th >登记时间<br/><span style="font-size: 12px;">Registration time</span></th>
							<th >总费用<br/><span style="font-size: 12px;">Total cost</span></th>
						</tr>
						</thead>
						<tbody id="tbody">
						<c:forEach items="${list}" var="item">
							<tr>
								<td ><input type="checkbox" name="id" value="${item.id}"></td>
								<td>${item.roomNumber}</td>
								<td>${item.checkintime}</td>
								<td>${item.checkouttime}</td>
								<td>${item.rentOutTypeName}</td>
								<td>${item.registerTime}</td>
								<td>${item.accountsreceivable}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</form>

	</div>


</div>


	<script type="text/javascript">
        function verify(){
        }

        function deletefunction(){
            parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+56;
        }


        function timeAjaxSelectRoom(){
            var receiveTargetID=document.getElementById("receiveTargetID").value;
            var datemin=document.getElementById("datemin").value;
            var datemax=document.getElementById("datemax").value;
            var tbody=document.getElementById("tbody");
            var tbodyOne=document.getElementById("tbodyOne");
            var i=0;
            $("#tbody").empty();
            $("#tbodyOne").empty();
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/StayRegister/timeAjaxSelectRoomOne.do',       //地址 type 带参数
                data:"receiveTargetID="+receiveTargetID+"&datemin="+datemin+"&datemax="+datemax,
                //        dataType:"json",                                       // json 数据类型提交
                async:false,                                          // 是否 异步 提交
                success: function (result) {
                    for (var key in result) {
                        i++;
                        var item = result[key];
                        var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                        var trid=tr.insertCell(-1);
                        var tdroomNumber = tr.insertCell(-1);   // Table 有多少列就添加多少个这个
                        var tdroomGuestRoomLevelName = tr.insertCell(-1);
                        var tdroomStandardPriceDay = tr.insertCell(-1);
                        var tdroomStandardPrice = tr.insertCell(-1);
                        var tdrentOutTypeName = tr.insertCell(-1);
                        var tdregisterTime = tr.insertCell(-1);
                        var tdsumConst = tr.insertCell(-1);

                        trid.innerHTML = "<input type='checkbox' name='id' value='"+item.id+"'>";
                        tdroomNumber.innerHTML = item.roomNumber;
                        tdroomGuestRoomLevelName.innerHTML = item.roomGuestRoomLevelName;
                        tdroomStandardPriceDay.innerHTML =item.checkointime;         //中间这个是数据
                        tdroomStandardPrice.innerHTML =item.checkouttime;
                        tdrentOutTypeName.innerHTML =item.rentOutTypeName;
                        tdregisterTime.innerHTML =new Date(item.registerTime).Format("yyyy-MM-dd hh:mm:ss");
                        tdsumConst.innerHTML =item.accountsreceivable;

                    }
                },
                error: function(data) {
                }
            });
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/StayRegister/timeAjaxSelectRoomTwo.do',       //地址 type 带参数
                data:"receiveTargetID="+receiveTargetID+"&datemin="+datemin+"&datemax="+datemax,
                //        dataType:"json",                                       // json 数据类型提交
                async:false,                                          // 是否 异步 提交
                success: function (item) {
                    var tr = tbodyOne.insertRow(-1);            // FireFox必须使用-1这个参数

                    var tdstayMoney = tr.insertCell(-1);   // Table 有多少列就添加多少个这个
                    var tdchangRoomMoney = tr.insertCell(-1);
                    var tdotherMoney = tr.insertCell(-1);
                    var tdpayMoney = tr.insertCell(-1);
                    var tddepositMoney = tr.insertCell(-1);
                    var tdpayRepairMoney = tr.insertCell(-1);

                    tdstayMoney.innerHTML = item.stayMoney;
                    tdchangRoomMoney.innerHTML = item.changRoomMoney;
                    tdotherMoney.innerHTML =item.otherMoney;         //中间这个是数据
                    tdpayMoney.innerHTML =item.payMoney;
                    tddepositMoney.innerHTML =item.depositMoney;
                    tdpayRepairMoney.innerHTML =item.payRepairMoney;
                    tdpayRepairMoney.style.color="red";

                },
                error: function(data) {
                }
            });
            document.getElementById("labelId").innerHTML=i;
        }


        function payFunction(){
            if(document.getElementById("datemin").value=="" || document.getElementById("datemax").value==""){
                var flag=window.confirm("还没有区段查询哦！确定要结账吗？");
                if(flag){

                }else{
                    return false;
                }

            }
            var id=[];
            var remarks=document.getElementById("remarks").value;
            var payWay=document.getElementById("payWay").value;
            var payTime=document.getElementById("payTime").innerHTML;
            if(remarks.length>100){
                alert("你输入的  备注  太过长了，请控制为  100 位长度");
                return false;
            }
            $('input[name="id"]').each(function(){             // 遍历获取input被checked的
                id.push($(this).val());                             // 获取选中的ID
            });
            if(id==""){
                alert("没有可结账的数据！");
            }else{
                parent.document.getElementById('Mainid').src='${ctx}/StayRegister/teamPay.do?id='+id+
                    '&remarks='+remarks+'&payWay='+payWay+'&payTime='+payTime;
            }
        }

        function removefunction(){
            var id=[];
            var tbodyOne=$("#tbodyOne");
            var tbodyone=document.getElementById("tbodyOne");
            var i=0;
            var zhuSuFei=tbodyOne.children()[0].cells[0].innerHTML;

            var huanFangFei=tbodyOne.children()[0].cells[1].innerHTML;
            var qiTaXiaoFei=tbodyOne.children()[0].cells[2].innerHTML;
            var jieZhangJinE=tbodyOne.children()[0].cells[3].innerHTML;
            var yaJin=tbodyOne.children()[0].cells[4].innerHTML;
            var yingBuJinE=tbodyOne.children()[0].cells[5].innerHTML;
            $('input[name="id"]:checked').each(function(){             // 遍历获取input被checked的
                id.push($(this).val());
                $(this.parentNode.parentNode).remove();              //他的父节点的父节点，指：tr
                i++;
                $("#tbodyOne").html("");
            });




            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/StayRegister/timeAjaxSelectRoomThree.do',       //地址 type 带参数
                data:"id="+id+"&zhuSuFei="+zhuSuFei+"&huanFangFei="+huanFangFei+"&qiTaXiaoFei="+qiTaXiaoFei
                +"&jieZhangJinE="+jieZhangJinE+"&yaJin="+yaJin+"&yingBuJinE="+yingBuJinE,
//                 dataType:"json",                                       // json 数据类型提交 
                async:false,                                          // 是否 异步 提交
                success: function (item) {
                    var tr = tbodyone.insertRow(-1);            // FireFox必须使用-1这个参数

                    var tdstayMoney = tr.insertCell(-1);   // Table 有多少列就添加多少个这个
                    var tdchangRoomMoney = tr.insertCell(-1);
                    var tdotherMoney = tr.insertCell(-1);
                    var tdpayMoney = tr.insertCell(-1);
                    var tddepositMoney = tr.insertCell(-1);
                    var tdpayRepairMoney = tr.insertCell(-1);

                    tdstayMoney.innerHTML = item.stayMoney;
                    tdchangRoomMoney.innerHTML = item.changRoomMoney;
                    tdotherMoney.innerHTML =item.otherMoney;         //中间这个是数据
                    tdpayMoney.innerHTML =item.payMoney;
                    tddepositMoney.innerHTML =item.depositMoney;
                    tdpayRepairMoney.innerHTML =item.payRepairMoney;
                    tdpayRepairMoney.style.color="red";
                },
                error: function(data) {
                }
            });
            document.getElementById("labelId").innerHTML=parseInt(document.getElementById("labelId").innerHTML)-i;
        }
	</script>

</body>
</html>