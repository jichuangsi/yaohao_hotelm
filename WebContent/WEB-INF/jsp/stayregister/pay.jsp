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
    
    .yangse{
      color:blue;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">旅客结账<span style="font-size: 12px;">Check-out</span> </h3>
        
      </div>
    </div>
    <form  method="post" onsubmit="return verify()">
    <input type="hidden" id="stayId" value="${stayId}">         <!-- 住宿ID -->
    <input type="hidden" id="roomId" value="${listDeposit[0].roomID}">         <!-- 住宿ID -->
    <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button type="button" class="btn btn-primary" onclick="payfunction()">
				   	 <li class="icon-check icon-white"></li>结账<span style="font-size: 12px;">Settle accounts</span></button>
				  </div> 
				 
			  </div>
	  </div>
      
      <div class="span4" style="text-align:center;">
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
		        <label class="floatont">房间号：<br/><span style="font-size: 12px;">Room number</span></label>
		        <label class="yangse">${listDeposit[0].roomNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客姓名：<br/><span style="font-size: 12px;">Name of passenger</span></label>
		        <label class="yangse">${lvKeName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">接待对象：<br/><span style="font-size: 12px;">Receptionist</span></label>
		        <label class="yangse">${listDeposit[0].receiveTargeTypeName}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">出租方式：<br/><span style="font-size: 12px;">Rental mode</span></label>
		        <label class="yangse">${listDeposit[0].rentOutTypeName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账单位：<br/><span style="font-size: 12px;">结账单位</span></label>
				 <c:if test="${listDeposit[0].currency==1}">
					 <label class="yangse">人民币(RMB)</label>
				 </c:if>
				 <c:if test="${listDeposit[0].currency==2}">
					 <label class="yangse">菲律宾币(Philippines dollar)</label>
				 </c:if>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账方式：<br/><span style="font-size: 12px;">Checkout method</span></label>
		         <select id="payWayId" class="yangse" style="width:70%;height:27px;">
		            <c:forEach items="${listOne}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==21}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">登记时间：<br/><span style="font-size: 12px;">Registration time</span></label>
		        <label class="yangse">${listDeposit[0].registerTime}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账时间：<br/><span style="font-size: 12px;">Settle accounts time</span></label>
		        <label id="payTimeId" class="yangse">${timestamp}</label>
		     </div>
			  <div class="span4">
				  <div class="span4">
					  <label class="floatont">入住时间：<br/><span style="font-size: 12px">Check-in time</span></label>
					  <label class="yangse">${listDeposit[0].checkintime}</label>
				  </div>
			  </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
			  <div class="span3">
				  <div class="span4">
					  <label class="floatont">退房时间：<br/><span style="font-size: 12px">Check-out time</span></label>
					  <label class="yangse">${listDeposit[0].checkouttime}</label>
				  </div>
			  </div>
		     <div class="span4">
		        <label class="floatont">房价/天：<br/><span style="font-size: 12px">housing price/day</span></label>
		        <label class="yangse">${listShangPin[0].roomStandardPriceDay}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">房价/小时：<br/><span style="font-size: 12px">housing price/hour</span></label>
		        <label class="yangse">${listShangPin[0].roomStandardPrice}</label>
		     </div>

		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">换房次数：<br/><span style="font-size: 12px">Room change</span></label>
		        <label class="yangse">${listShangPin[0].changingRoomNumber}</label>
		     </div>
			  <div class="span3">
				  <label class="floatont">应收账：<br/><span style="font-size: 12px">Accounts receivable</span></label>
				  <label class="yangse">${listDeposit[0].accountsreceivable}</label>
			  </div>
			 <%-- <div class="span4">
				  <label class="floatont">是否到账：<br/><span style="font-size: 12px">Arrival account</span></label>
				  <select id="isdao" class="yangse" style="width:70%;height:27px;">
					  <c:if test="${listDeposit[0].isdao==0}">
						  <option value="${listDeposit[0].isdao}"selected="selected">
							  否
						  </option>
						  <option value="1">
							  是
						  </option>
					  </c:if>
					  <c:if test="${listDeposit[0].isdao==1}">
						  <option value="${listDeposit[0].isdao}"selected="selected">
							  是
						  </option>
					  </c:if>
				  </select>
			  </div>--%>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

<!--======================================================================================================================-->
		<div class="span12" style="margin-top:10px;">
			<div class="row-fluid">
				<div class="span4">
					<label class="floatont">平台：<br/><span style="font-size: 12px">platform</span></label>
					<label class="yangse">${orderPo.pname}</label>
				</div>
				<div class="span4">
					<label class="floatont">订单号：<br/><span style="font-size: 12px">Order number</span></label>
					<label class="yangse">${orderPo.orderID}</label>
				</div>
				<div class="span3">
					<label class="floatont">订单状态：<br/><span style="font-size: 12px">Order status</span></label>
					<c:if test="${orderPo.status==0}">
						<label class="yangse"></label>
					</c:if>
					<c:if test="${orderPo.status==1}">
						<label class="yangse">已入住/待结账<span style="font-size: 12px">Checked in</span></label>
					</c:if>
					<c:if test="${orderPo.status==2}">
						<label class="yangse">已取消<span style="font-size: 12px">Cancelled</span></label>
					</c:if>
					<c:if test="${orderPo.status==3}">
						<label class="yangse">已结账<span style="font-size: 12px">Settled accounts</span></label>
					</c:if>

				</div>
			</div>
		</div>
	    <div class="span10">
          <fieldset>
            <legend></legend>
          </fieldset>
        </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
		<div class="span12">
			<label style="float: left;">备注：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　</label>
			<%--<label style="float: left;">应补缴金额：</label><label style="color:red;">${yingBuJinE}</label>--%>
			<input id="remarksId" class="yangse" type="text" style="width:100%;height:25px;">
		</div>
		  
      </form>
      
    </div>
  
  </div>
 
 
 
 <script type="text/javascript">
    function verify(){
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do';
   }
   function payfunction(){
       alert("结账成功！");
	   var id=document.getElementById('stayId').value;
	   var remarks=document.getElementById('remarksId').value;
	   var payTime=document.getElementById('payTimeId').innerHTML;
	   var payWay=document.getElementById('payWayId').value;
	   var roomId=document.getElementById('roomId').value;
	   if(remarks.length>100){
	      alert("你输入的  备注  太过长了，请控制为  100 位长度");
	      return false;
	   }
	   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/pay.do?id='+id+
	     '&remarks='+remarks+'&payTime='+payTime+'&payWay='+payWay+'&roomId='+roomId;
   }
 </script>
   
  </body>
</html>
