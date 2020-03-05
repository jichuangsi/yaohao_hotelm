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
      width: 35.2%;
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
        <h3 style="text-align: center;">客房新增<br/>New rooms</h3>
      </div>
    </div>
    
    <div class="span9 margin-top-two">
      <fieldset>
		  <legend>标准房设置<span style="font-size: 16px;">(Standard room setting)</span></legend>
      </fieldset>
    </div>
    
    <form action="${ctx}/RoomSet/add.do" method="post" onsubmit="return verify()">
		<div class="span12 margin-top-two">
			<div class="row-fluid">
				<div class="span5">
					<div class="row-fluid">
						<label class="labelroomnumber">供应商：<br/><span style="font-size: 16px;">Supplier</span></label>
						<select name="supplierID" class="cboone inputone" id="supplierID">
							<c:forEach items="${slist}" var="item">
								<option value="${item.id}"selected="selected">
										${item.supplierName}
								</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="span5">
					<label class="labelroomnumber marginrighttwo">房间号：<br/>Room Number</label>
					<input id="roomNumberId" name="roomNumber" class="textone inputone"
						   style="height:26px;" type="text" onblur="YZ(this.value)" onchange="onchangeOne()">
					<div id="divOne">
						<label class="yansered" style="margin-top:18px;">*</label>
					</div>
				</div>
			</div>
		</div>
	    <div class="span12 margin-top-two">
	      <div class="row-fluid">
			  <div class="span5 ">
			   	  <label class="labelroomnumber marginrightone">房态：<br/>Room state</label>
			      <select name="roomStateID" class="cboone inputone">
		            <c:forEach items="${listTwo}" var="item">
						<c:if test="${item.far_id==1}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}&nbsp;&nbsp;Vacant room
							</option>
						</c:if>
						<c:if test="${item.far_id==2}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}&nbsp;&nbsp;Private housing
							</option>
						</c:if>
						<c:if test="${item.far_id==4}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}&nbsp;&nbsp;Reserve
							</option>
						</c:if>
						<c:if test="${item.far_id==5}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}&nbsp;&nbsp;To be cleaned
							</option>
						</c:if>
						<c:if test="${item.far_id==6}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}Pending maintenance
							</option>
						</c:if>
						<c:if test="${item.far_id==7}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}&nbsp;&nbsp;Unavailable
							</option>
						</c:if>
						<c:if test="${item.far_id==65}">
							<option value="${item.far_id}" <c:if test="${item.far_id==roomStateID}" >selected="selected"</c:if>>
									${item.attributeDetailsName}&nbsp;&nbsp;full
							</option>
						</c:if>
			        </c:forEach> 
		          </select>
			  </div>
			  <div class="span5">
				  <label class="labelroomnumber">客房等级：<br/>Guest room rating</label>
				  <select name="guestRoomLevelID" class="cboone inputone">
					  <c:forEach items="${listOne}" var="item">
						  <c:if test="${item.far_id==8}">
							  <option value="${item.far_id}" <c:if test="${item.far_id==guestRoomLevelID}">selected="selected"</c:if>>
									  ${item.attributeDetailsName}(Single room)
							  </option>
						  </c:if>
						  <c:if test="${item.far_id==10}">
							  <option value="${item.far_id}" <c:if test="${item.far_id==guestRoomLevelID}">selected="selected"</c:if>>
									  ${item.attributeDetailsName}(Double room)
							  </option>
						  </c:if>
						  <c:if test="${item.far_id==11}">
							  <option value="${item.far_id}" <c:if test="${item.far_id==guestRoomLevelID}">selected="selected"</c:if>>
									  ${item.attributeDetailsName}(Multihuman)
							  </option>
						  </c:if>
						  <c:if test="${item.far_id==12}">
							  <option value="${item.far_id}" <c:if test="${item.far_id==guestRoomLevelID}">selected="selected"</c:if>>
									  ${item.attributeDetailsName}(Deluxe Suite)
							  </option>
						  </c:if>
						  <c:if test="${item.far_id==13}">
							  <option value="${item.far_id}" <c:if test="${item.far_id==guestRoomLevelID}">selected="selected"</c:if>>
									  ${item.attributeDetailsName}(meeting room)
							  </option>
						  </c:if>
						  <c:if test="${item.far_id==14}">
							  <option value="${item.far_id}" <c:if test="${item.far_id==guestRoomLevelID}">selected="selected"</c:if>>
									  ${item.attributeDetailsName}(Presidential suite)
							  </option>
						  </c:if>
					  </c:forEach>
				  </select>
			  </div>
		  </div>
	    </div>
	    <div class="span12 margin-top-one">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber marginrighttwo">床位数：<br/>Number of beds</label>
			      <input id="roomAmountId" name="roomAmount" class="textone inputone" style="height:26px;" type="text" onblur="onchangeOne()">
			      <div id="divTwo">
			         <label class="yansered" style="margin-top:18px;">*</label>
			       </div>
			  </div>
			  <div class="span5">
					  <label class="labelroomnumber">采购价：<br/>Purchase price</label>
					  <div class="input-prepend" style="float:left;">
						  <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
					  </div>
					  <input id="purchasePriceId" name="purchasePrice" class="textone inputtwo radiusone" onblur="onchangeOne()"
							 style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
					  <div id="divT">
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
			      <input id="standardPriceDayId" name="standardPriceDay" class="textone inputtwo radiusone" onblur="onchangeOne()"
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
				  <input id="discount" name="discount" class="textone inputtwo radiusone" onblur="onchangeOne()"
						 style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			  </div>
			  <div class="span4">
				  <label class="labelroomnumber">折后价：<br/>Discount price</label>
				  <div class="input-prepend" style="float:left;">
					  <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
				  </div>
				  <input id="discountPrice" name="discountPrice" class="textone inputtwo radiusone" onblur="onchangePrice()"
						 style="border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">

			  </div>
		  </div>
	    </div>
	    
	   <div class="span9 margin-top-one">
	      <fieldset>
	        <legend>钟点房设置(<span style="font-size: 14px">Setting of hour room</span>)</legend>
	      </fieldset>
	    </div>
	    
	    <div class="span12 margin-top-two">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber" style="margin-right:5px;">标准房价/小时：<br/>Standard room rate/hour</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="standardPriceId" name="standardPrice" class="textone inputthree radiusone" onblur="onchangeOne()"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divFour">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">时长限制(小时)：<br/>Time limit(hours)</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="maxDurationId" name="maxDuration" class="textone inputthree radiusone" onblur="onchangeOne()"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divFive">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div>
		  </div>
	    </div>
	    <div class="span12 margin-top-one">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber marginrightthree">首段价格：<br/>First price</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="firstPriceId" name="firstPrice" class="textone inputthree radiusone" onblur="onchangeOne()"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divSix">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">首段时长(小时)：<br/>First paragraph Duration(hours)</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="firstDurationId" name="firstDuration" class="textone inputthree radiusone" onblur="onchangeOne()"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divSeven">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div>
		    </div>
	     </div>
		<div class="span9 margin-top-one">
			<fieldset>
				<legend>按床位出租设置(Set by bed rental)</legend>
			</fieldset>
		</div>

		<div class="span12 margin-top-two">
			<div class="row-fluid">
				<div class="span5">
					<label class="labelroomnumber" style="margin-right:5px;">标准房价/小时：<br/>Standard room rate/hour</label>
					<div class="input-prepend"  style="float:left;">
						<span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
					</div>
					<input id="bedPrice" name="bedPrice" class="textone inputthree radiusone" onblur="onchangeOne()"
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
					<input id="bedHour" name="bedHour" class="textone inputthree radiusone" onblur="onchangeOne()"
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
					<input id="bedDayPrice" name="bedDayPrice" class="textone inputthree radiusone" onblur="onchangeOne()"
						   style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
					<div id="divS3">
						<label class="yansered" style="margin-top:18px;">*</label>
					</div>
				</div>
				<div class="span5">
					<label class="labelroomnumber">是否可按床位售出：<br/>Whether it can be sold by bed</label>
					<select name="isBed">
						<option value="0">是(yes)</option>
						<option value="1">不是(not)</option>
					</select>

				</div>
			</div>
		</div>
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid"  style="float:left;">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit" style="width: 150px">
				   	 <li class="icon-check icon-white"></li>确定(save)</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()" style="width: 150px">
		   	  <li class="icon-remove icon-white"></li>取消(cancel)</button>
		   </div>
	     </div>
      </div>
       
    </div>
  </div>
 
 
 <script type="text/javascript">
 function onchangePrice(){
     var price=document.getElementById("standardPriceDayId").value;
     var count=document.getElementById("discount").value;

     var cout2=price*(count/10);
     document.getElementById("discountPrice").value=cout2;
	if (count=="" ||count==0){
		document.getElementById("discountPrice").value=price;
	}
 }
   
   $("#roomNumberId").focus();
 
    function verify(){
    if(document.getElementById("roomNumberId").value==""){
	     alert("房间号  是必填项，不能为空哦！"+' \n '+"Room number is required,cannot be empty!");
	     document.getElementById("roomNumberId").focus();
	     return false;
      }else if(document.getElementById("roomAmountId").value==""){
	     alert("床位数  是必填项，不能为空哦！"+' \n '+"Bed number is required,cannot be empty");
	     document.getElementById("roomAmountId").focus();
	     return false;
      }else if(document.getElementById("standardPriceDayId").value==""){
	     alert("标准房价/天  是必填项，不能为空哦！"+' \n '+"Standard room rate/day is required,cannot be empty!");
	     document.getElementById("standardPriceDayId").focus();
	     return false;
      }else if(document.getElementById("standardPriceId").value==""){
	     alert("标准房价/小时  是必填项，不能为空哦！"+' \n '+"Standard room rate/hour is required,cannot be empty!");
	     document.getElementById("standardPriceId").focus();
	     return false;
      }else if(document.getElementById("maxDurationId").value==""){
	     alert("时长限制（小时） 是必填项，不能为空哦！"+' \n '+"Time limit (hour) is required,cannot be empty");
	     document.getElementById("maxDurationId").focus();
	     return false;
      }else if(document.getElementById("firstPriceId").value==""){
	     alert("首段价格  是必填项，不能为空哦！"+' \n '+"First price is required,cannot be empty!");
	     document.getElementById("firstPriceId").focus();
	     return false;
      }else if(document.getElementById("bedDayPrice").value==""){
	     alert("标准房价/天 (床位)  是必填项，不能为空哦！"+' \n '+"Standard room rate/day(bed) is required,cannot be empty");
	     document.getElementById("bedDayPrice").focus();
	     return false;
      }else if(document.getElementById("bedPrice").value==""){
        alert("标准房价/小时(床）  是必填项，不能为空哦！"+' \n '+"Standard room rate/hour(bed) is required,cannot be empty!");
        document.getElementById("bedPrice").focus();
        return false;
    }else if(document.getElementById("bedHour").value==""){
        alert("时长限制(床）  是必填项，不能为空哦！"+' \n '+"Time limit (bed) is required,cannot be empty");
        document.getElementById("bedHour").focus();
        return false;
    }else if(document.getElementById("discount").value==""){
        alert("折扣必填(不打折甜10)  是必填项，不能为空哦！"+' \n '+"Discount required(no discount 10)is required,cannot be empty!");
        document.getElementById("discount").focus();
        return false;
    }else if(document.getElementById("discountPrice").value==""){
        alert("折扣价 是必填项，不能为空哦！"+' \n '+"Discount price is required, cannot be empty");
        document.getElementById("discountPrice").focus();
        return false;
    }else if(parseFloat(document.getElementById("firstDurationId").value)>parseFloat(document.getElementById("maxDurationId").value)){
	     alert("首段时长 (小时) 不能大于  时长限制(小时)  的哦！"+' \n '+"The first period of time (hour) cannot be longer than the time limit (hour)");
	     document.getElementById("firstDurationId").focus();
	     return false;
      }else if(parseFloat(document.getElementById("firstPriceId").value)>parseFloat(document.getElementById("standardPriceDayId").value)){
	     alert("首段价格   不能大于  标准房价/天   的哦！"+' \n '+"The first price cannot be greater than the standard price/day!");
	     document.getElementById("firstPriceId").focus();
	     return false;
      }else if(parseFloat(document.getElementById("standardPriceId").value)>parseFloat(document.getElementById("standardPriceDayId").value)){
        alert(document.getElementById("standardPriceId").value);alert(document.getElementById("standardPriceDayId").value);
	     alert("标准房价/小时     不能大于  标准房价/天   的哦！"+' \n '+"Standard room rate/hour cannot be greater than standard room rate/day");
	     document.getElementById("standardPriceId").focus();
	     return false;
      }else if(document.getElementById("roomNumberId").value.length>8){
	     alert("你输入的  房间号   太过长了  请不要超出  8 位长度"+' \n '+"The room number is too long. Please don't exceed 8 digits.");
	     document.getElementById("roomNumberId").focus();
	     return false;
      }else if(document.getElementById("roomAmountId").value.length>8){
	     alert("你输入的  床位数   太过长了  请不要超出  8 位长度"+' \n '+"The number of beds is too long");
	     document.getElementById("roomAmountId").focus();
	     return false;
      }else if(document.getElementById("standardPriceDayId").value.length>8){
	     alert("你输入的   标准房价/天  太过长了  请不要超出  8 位长度"+' \n '+"Standard room rate / day,should not exceed 8-digit length");
	     document.getElementById("standardPriceDayId").focus();
	     return false;
      }else if(document.getElementById("standardPriceId").value.length>8){
	     alert("你输入的   标准房价/小时   太过长了  请不要超出  8 位长度"+' \n '+"Standard room rate / hour, please do not exceed 8-digit length");
	     document.getElementById("standardPriceId").focus();
	     return false;
      }else if(document.getElementById("maxDurationId").value.length>8){
	     alert("你输入的   时长限制（小时） 太过长了  请不要超出  8 位长度"+' \n '+"Time limit (hours) please do not exceed 8-bit length");
	     document.getElementById("maxDurationId").focus();
	     return false;
      }else if(document.getElementById("firstPriceId").value.length>8){
	     alert("你输入的    首段价格   太过长了  请不要超出  8 位长度"+' \n '+"The first price is too long");
	     document.getElementById("firstPriceId").focus();
	     return false;
      }else if(document.getElementById("firstDurationId").value.length>8){
	     alert("你输入的    首段时长   太过长了  请不要超出  8 位长度"+' \n '+"Please do not exceed 8 digits in the first period");
	     document.getElementById("firstDurationId").focus();
	     return false;
      }else if(document.getElementById("purchasePriceId").value.length==0){
        alert("请输入采购价"+' \n '+"Please enter purchase price");
        return false;
    }else{
         return true;
      } 
   }
   
   function YZ(value){
        var supplierID=document.getElementById("supplierID").value;
     if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/RoomSet/YZ.do',       //地址 type 带参数
          data:"roomNumber="+value+"&supplierID="+supplierID,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(result>=1){                                  
                   alert("已存在此房间号，请另取房间号！"+' \n '+"This room number already exists.Please get another room number");                     //提示框
                   document.getElementById("roomNumberId").value="";     //这个id的文本框的值 将会清空
                   document.getElementById("roomNumberId").focus();      // 给这个id的文本框提供焦点
                   document.getElementById("divOne").style.display="block"; //显示
              }else{ }
          },
          error: function(data) { }
      });
     }
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/RoomSet/tolist.do';
   }
   
   
   //验证
   function onchangeOne(){
     //房间号 
     if(document.getElementById("roomNumberId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
       //采购价
       if(document.getElementById("purchasePriceId").value!=""){
           document.getElementById("divT").style.display="none";
           if(!document.getElementById("purchasePriceId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
           {
               document.getElementById("purchasePriceId").focus();
               document.getElementById("purchasePriceId").value="";
               document.getElementById("divT").style.display="block"; //显示
               alert("标准房价/天 :请输入正数"+' \n '+"Standard room rate/day: Please enter a positive number");
           }
       }else{
           document.getElementById("divT").style.display="block"; //显示
       }
     //床位数
     if(document.getElementById("roomAmountId").value!=""){
       document.getElementById("divTwo").style.display="none";
       if(!document.getElementById("roomAmountId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
       {
          document.getElementById("roomAmountId").focus();
          document.getElementById("roomAmountId").value="";
          document.getElementById("divTwo").style.display="block"; //显示
          alert("床位数:请输入正整数"+' \n '+"Number of beds: Please enter a positive integer");
       }
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //标准房价/天
     if(document.getElementById("standardPriceDayId").value!=""){
       document.getElementById("divThree").style.display="none";
       if(!document.getElementById("standardPriceDayId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("standardPriceDayId").focus();
          document.getElementById("standardPriceDayId").value="";
          document.getElementById("divThree").style.display="block"; //显示
          alert("标准房价/天 :请输入正数"+' \n '+"Standard room rate/day: Please enter a positive number");
       }
     }else{
       document.getElementById("divThree").style.display="block"; //显示
     }
     //标准房价/小时
     if(document.getElementById("standardPriceId").value!=""){
       document.getElementById("divFour").style.display="none";
       if(!document.getElementById("standardPriceId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("standardPriceId").focus();
          document.getElementById("standardPriceId").value="";
          document.getElementById("divFour").style.display="block"; //显示
          alert("标准房价/小时:请输入正数"+' \n '+"Standard room rate / hour: Please enter a positive number");
       }
     }else{
       document.getElementById("divFour").style.display="block"; //显示
     }
     //时长限制（小时）
     if(document.getElementById("maxDurationId").value!=""){
       document.getElementById("divFive").style.display="none";
       if(!document.getElementById("maxDurationId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("maxDurationId").focus();
          document.getElementById("maxDurationId").value="";
          document.getElementById("divFive").style.display="block"; //显示
          alert("时长限制（小时）:请输入正数"+' \n '+"Time limit (hours): Please enter a positive number");
       }
     }else{
       document.getElementById("divFive").style.display="block"; //显示
     }
     //首段价格
     if(document.getElementById("firstPriceId").value!=""){
       document.getElementById("divSix").style.display="none";
       if(!document.getElementById("firstPriceId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("firstPriceId").focus();
          document.getElementById("firstPriceId").value="";
          document.getElementById("divSix").style.display="block"; //显示
          alert("首段价格:请输入正数"+' \n '+"First price: Please enter a positive number");
       }
     }else{
       document.getElementById("divSix").style.display="block"; //显示
     }
     //首段时长（小时）
     if(document.getElementById("firstDurationId").value!=""){
       document.getElementById("divSeven").style.display="none";
       if(!document.getElementById("firstDurationId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("firstDurationId").focus();
          document.getElementById("firstDurationId").value="";
          document.getElementById("divSeven").style.display="block"; //显示
          alert("首段时长（小时）:请输入正数"+' \n '+"First period of time (hours): Please enter a positive number");
       }
     }else{
       document.getElementById("divSeven").style.display="block"; //显示
     }
       //采购价
       if(document.getElementById("firstDurationId").value!=""){
           document.getElementById("divT").style.display="none";
           if(!document.getElementById("firstDurationId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
           {
               document.getElementById("firstDurationId").focus();
               document.getElementById("firstDurationId").value="";
               document.getElementById("divT").style.display="block"; //显示
               alert("采购价:请输入正数"+' \n '+"Purchase price: Please enter a positive number");
           }
       }else{
           document.getElementById("divSeven").style.display="block"; //显示
       }
       //折扣
       if(document.getElementById("discount").value!=""){
           if(!document.getElementById("discount").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
           {
               document.getElementById("discount").focus();
               document.getElementById("discount").value="";
               alert("折扣:请输入正数"+' \n '+"Discount: Please enter a positive number");
           }
       }else{
       }
       //床位价
       if(document.getElementById("bedPrice").value!=""){
           document.getElementById("div1").style.display="none";
           if(!document.getElementById("bedPrice").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
           {
               document.getElementById("bedPrice").focus();
               document.getElementById("bedPrice").value="";
               document.getElementById("divS1").style.display="block"; //显示
               alert("床位价:请输入正数"+' \n '+"Bed price: Please enter a positive number");
           }
       }else{
           document.getElementById("divS1").style.display="block"; //显示
       }
       //床位（小时）
       if(document.getElementById("bedHour").value!=""){
           document.getElementById("divS2").style.display="none";
           if(!document.getElementById("bedHour").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
           {
               document.getElementById("bedHour").focus();
               document.getElementById("bedHour").value="";
               document.getElementById("divS2").style.display="block"; //显示
               alert("床位（小时）:请输入正数"+' \n '+"Bed (hours): Please enter a positive number");
           }
       }else{
           document.getElementById("divS2").style.display="block"; //显示
       }
       //床位（小时）
       if(document.getElementById("bedDayPrice").value!=""){
           document.getElementById("divS3").style.display="none";
           if(!document.getElementById("bedDayPrice").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
           {
               document.getElementById("bedDayPrice").focus();
               document.getElementById("bedDayPrice").value="";
               document.getElementById("divS3").style.display="block"; //显示
               alert("床位价:请输入正数"+' \n '+"Bed price: Please enter a positive number");
           }
       }else{
           document.getElementById("divS3").style.display="block"; //显示
       }
   }
   
   
 </script>
   
  </body>
</html>
