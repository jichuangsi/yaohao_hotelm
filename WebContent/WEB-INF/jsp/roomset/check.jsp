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
    float:left;
    }
    
    .{
      width:46.8%;
    }
    
    .inputthree{
      width:38%;
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
    
    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 35.%;
    }
    }
    
    
     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 40%;
    }
    }
    
    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 33%;
    }
    }
    
     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 25%;
    }
    }
    
     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 20%;
    }
    }
    .yansered{
      color:red;
    }
    .yansegreen{
      color:green;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">查看<br/> check</h3>
      </div>
    </div>
		<div class="span12 margin-top-two">
			<div class="row-fluid">
				<div class="span5">
					<div class="row-fluid">
						<label class="labelroomnumber">供应商：<br/><span style="font-size: 16px;">Supplier</span></label>
						<input id="supplierName" name="supplierName" class="textone inputone"
							   style="height:26px;" type="text" value="${roomSet.supplierName}">
					</div>
				</div>
			</div>
		</div>
	    <div class="span12 margin-top-two">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber marginrighttwo">房间号：<br/>Room Number</label>
			      <input id="roomNumberId" name="roomNumber" class="textone inputone"
			       style="height:26px;" type="text"value="${roomSet.roomNumber}">
			       <div id="divOne">
			         <label class="yansered" style="margin-top:18px;">*</label>
			       </div>
			  </div>
		  </div>
	    </div>
	    <div class="span12 margin-top-one" >
	      <div class="row-fluid">
	           <div class="span2" style="height:1px; margin-top:-25px;"></div>
		       <div class="span7">
			   	  <label class="labelroomnumber">标准房价/天：<br/>Standard room rate/day</label>
			   	  <div class="input-prepend" style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="standardPriceDayId" name="standardPriceDay" class="textone inputtwo radiusone" value="${roomSet.standardPriceDay}"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divThree">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			   </div>
		  </div>
		</div>
			  <div class="span12 margin-top-one" >
				  <div class="row-fluid">
			  <div class="span5">
				  <label class="labelroomnumber">折扣：<br/>Discount</label>
				  <div class="input-prepend" style="float:left;">
					  <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
				  </div>
				  <input id="discount" name="discount" class="textone inputtwo radiusone"value="${roomSet.discount}"
						 style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">

			  </div>
			  <div class="span4">
				  <label class="labelroomnumber">折后价：<br/>Discount price</label>
				  <div class="input-prepend" style="float:left;">
					  <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
				  </div>
				  <input id="discountPrice" name="discountPrice" class="textone inputtwo radiusone" value="${roomSet.discountPrice}"
						 style="border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">

			  </div>
		  </div>
	    </div>


		<div class="span9 margin-top-one">
			<fieldset>
				<legend>按床位<br/>Bedding</legend>
			</fieldset>
		</div>

		<div class="span12 margin-top-two">
			<div class="row-fluid">
				<div class="span5">
					<label class="labelroomnumber" style="margin-right:5px;">标准房价/小时：<br/>Standard room rate/hour</label>
					<div class="input-prepend"  style="float:left;">
						<span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
					</div>
					<input id="bedPrice" name="bedPrice" class="textone inputthree radiusone"value="${roomSet.bedPrice}"
						   style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
					<div id="divS1">
						<label class="yansered" style="margin-top:18px;">*</label>
					</div>
				</div>
				<div class="span5">
					<label class="labelroomnumber">时长限制(小时)：<br/>Time limit(hours)</label>
					<div class="input-prepend"  style="float:left;">
						<span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
					</div>
					<input id="bedHour" name="bedHour" class="textone inputthree radiusone"value="${roomSet.bedHour}"
						   style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
					<div id="divS2">
						<label class="yansered" style="margin-top:18px;">*</label>
					</div>
				</div>
			</div>
		</div>
		<div class="span12 margin-top-one">
			<div class="row-fluid">
				<div class="span5">
					<label class="labelroomnumber marginrightthree">标准房价/天：<br/>Standard room rate/day</label>
					<div class="input-prepend"  style="float:left;">
						<span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
					</div>
					<input id="bedDayPrice" name="bedDayPrice" class="textone inputthree radiusone"value="${roomSet.bedDayPrice}"
						   style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
					<div id="divS3">
						<label class="yansered" style="margin-top:18px;">*</label>
					</div>
				</div>

			</div>
		</div>
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()"style="width: 150px">
		   	  <li class="icon-remove icon-white"></li>取消(cancel)</button>
		   </div>
	     </div>
      </div>
       
    </div>
  
 
 
 
 
 <script type="text/javascript">

     function deletefunction(){
         parent.document.getElementById('Mainid').src='${ctx}/RoomSet/tolist.do';
     }
   
 </script>
   
  </body>
</html>
