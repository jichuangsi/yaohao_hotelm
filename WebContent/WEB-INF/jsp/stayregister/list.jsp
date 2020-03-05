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
  <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>


   <style>
   
   .container{
     margin-top: 10px;
     margin-left:0px;
     margin-right:0px;
     width:98%;
     font-size:15px;
   }
   .span12{
     width:98%;
   }
   
    .labelroomnumber{
      position: relative;
      font-size: 15px;
      float: left;
      margin-top: 15px;
    }
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:15px;
    }
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .roomnumberwidth{
      width:60%;
    }
    
    .heigthone{
      height:25px;
    }
    .widthone{
     width:100%;
    }
    .widthtwo{
     width:100%;
    }
    
    .XuanXiangKa{
      .active
    }
  
  </style>
  
 
 
  <body>
  <div class="container" style="height:630px;overflow-x:auto;">
    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
    <input id="tuanDuiId" type="hidden" value="${tuanDui}">
    <div class="span12">
    <div class="tabbable" >  <!-- style="border:1px solid red"  -->
      <ul class="nav nav-tabs">
        <li class="active"><a id="oneid" href="#tab1" data-toggle="tab" onclick="lvKefunction()">散客登记(Individual registration)</a></li>
       <%-- <li ><a id="twoid" href="#tab2" data-toggle="tab" onclick="teamfunction()">团队登记(Team Registration)</a></li>--%>
      </ul>
      
      <div class="tab-content">
        <div class="tab-pane active" id="tab1">
			<label style="float:left;">房间号：<br/><span style="font-size: 14px">Room number</span></label>
		    <form action="" method="post" style="width:18%;float: left;">
			   <input id="txtnameid" name="txtname" class="roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">
			      <button onclick="selectfunction()" type="button" class="btn-success" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>search</button>
			   </div>
		    </form>
			<div class="span4" style="margin-left: -40px;margin-top: -10px">
				<div class="row-fluid">
					<label class="labelroomnumber">订单号：<br/><span style="font-size: 14px">Order number</span></label>
					<form action="${ctx}/StayRegister/tolists.do" method="post" style="float: left;">
						<input id="ordernumber" name="ordernumber" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入订单号" value="${ordernumber}">
						<div class="input-append">
							<button type="submit" class="btn-success textone" style="margin-left:-5px;height:26px;"><li class="icon-search icon-white"></li>search</button>
						</div>
					</form>
				</div>
			</div>
		  <%--  <div class="span1" style="margin-right: 4px;">
				<button class="btn btn-info btn-small" type="button" onclick="registerfunction()"><li class="icon-plus icon-white">
				</li>登记<br/><span style="font-size: 13px;">register</span></button>
		    </div>--%>
		    <button class="btn btn-info btn-small" type="button" onclick="arrangefunction()">
				<li class="icon-plus icon-white"></li>安排房间<br/><span style="font-size: 13px;">Arrange rooms</span></button>
		    <button class="btn btn-info btn-small" type="button" onclick="changroomfunction()">
				<li class="icon-refresh icon-white"></li>换房<br/><span style="font-size: 13px;">exchange houses</span></button>
            <button class="btn btn-info btn-small" type="button" onclick="consumptionfunction()">
				<li class="icon-gift icon-white"></li>旅客消费<br/><span style="font-size: 13px;">Passenger consumption</span></button>
            <button class="btn btn-info btn-small" type="button" onclick="payfunction()">
				<li class="icon-heart icon-white"></li>结账<br/><span style="font-size: 13px;">Settle accounts</span></button>
		</div>
        <div class="tab-pane" id="tab2">
       
        <div class="span12" style="margin-left:0px;">
          <div class="row-fluid">
             <div class="span2">
	              <label>接待对象：Receptionist</label>
			      <input id="teamNameId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${teamNameId}">
             </div>
              <div class="span2">
                  <label>团队编号：Team number</label>
			      <input id="teamCodeId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${teamCodeId}">
             </div>
              <div class="span2">
                  <label>负责人：Person in charge</label>
			      <input id="principalId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${principalId}">
             </div>
              <div class="span2">
                  <label>联系电话：Contact number</label>
			      <input id="contactPhoneNUmberId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${contactPhoneNUmberId}">
             </div>
              <div class="span2">
                  <label>登记时间：Registration time</label>
			      <input id="registerTimeId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${registerTimeId}">
             </div>
              <div class="span2">
                  <label>总费用：Total cost</label>
			      <input id="sumConstId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${teamSumConst}">
             </div>
            </div>
         </div>
         <div class="span12" style="margin-left:0px;">
          <div class="row-fluid">
            <label style="float:left;">房间号：<br/><span style="font-size: 12px;">Room number</span></label>
		    <form action="" method="post" style="width:16%; float: left;">
			   <input id="roomNumberId" class="roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="teamSelect()" type="button" class="btn-success" style="margin-left:-5px;height:26px;"><li class="icon-search icon-white"></li>search</button>
			   </div>
		    </form>
			  <div class="span4" style="margin-left: -30px;margin-top: -10px">
				  <div class="row-fluid">
					  <label class="labelroomnumber">订单号：<br/><span style="font-size: 12px;">Order number</span></label>
					  <form action="" method="post" style="float: left;">
						  <input id="orderID" name="orderID" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入订单号" value="${orderID}">
						  <div class="input-append">
							  <button type="button"onclick="teamSelects()" class="btn-success textone" style="margin-left:-5px;height:26px;"><li class="icon-search icon-white"></li>search</button>
						  </div>
					  </form>
				  </div>
			  </div>
           <%-- <a href="#duixiang" data-toggle="modal" class="btn btn-info btn-small" onclick="selectTarget()">
				<li class="icon-plus icon-white"></li>选择对象<br/><span style="font-size: 12px;">Select target</span> </a>
		    <button class="btn btn-info btn-small" type="button" onclick="teamArrangefunction()">
				<li class="icon-plus icon-white"></li>安排房间<br/><span style="font-size: 12px;">Arrange rooms</span></button>
		    <button class="btn btn-info btn-small" type="button" onclick="teamChangroomfunction()">
				<li class="icon-refresh icon-white"></li>换房<br/><span style="font-size: 12px;">exchange houses</span></button>
            <button class="btn btn-info btn-small" type="button" onclick="teamConsumptionfunction()">
				<li class="icon-gift icon-white"></li>旅客消费<br/><span style="font-size: 12px;">Passenger consumption</span></button>
            <button class="btn btn-info btn-small" type="button" onclick="teampayfunction()"><li class="icon-heart icon-white">
			</li>结账<br/><span style="font-size: 12px;">Settle accounts</span></button>--%>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
    <div class="span12">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
				<th >选择<br/><span style="font-size: 12px;">Choice</span></th>
				<th >供应商<br/><span style="font-size: 12px;">Supplier</span></th>
	          <th >房间号<br/><span style="font-size: 12px;">room number</span></th>
	          <th >订单号<br/><span style="font-size: 12px;">Order number</span></th>
	          <th >换房次数<br/><span style="font-size: 12px;">Room change</span></th>
	          <th >登记时间<br/><span style="font-size: 12px;">Registration time</span></th>
				<th >入住时间<br/><span style="font-size: 12px;">Check-in time</span></th>
				<th >退房时间<br/><span style="font-size: 12px;">Check-out time</span></th>
	          	<th>应收款<br/><span style="font-size: 12px;">Receivables</span></th>
				<th >是否到账<br/><span style="font-size: 12px;">Arrival account</span></th>
				<th >到账时间<br/><span style="font-size: 12px;">Payment date</span></th>
				<th >出租方式<br/><span style="font-size: 12px;">Rental mode</span></th>
				<th >住宿人<br/><span style="font-size: 12px;">Boarder</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <c:if test="${item.remind==1}">
			        <tr style="color: red;">
			          <td><input type="checkbox" name="id" value="${item.id}"></td>
						<td>${item.supplierName}</td>
			          <td>${item.roomNumber}</td>
						<c:if test="${item.codeNumber!=null}">
							<td><a href="${ctx}/StayRegister/orderDetails.do?orderID=${item.codeNumber}">${item.codeNumber}</a></td>
						</c:if>
						<c:if test="${item.codeNumber==null}">
							<td></td>
						</c:if>
			          <td>${item.changingRoomNumber}</td>
			          <td><fmt:formatDate value="${item.registerTime}" pattern="yyyy-MM-dd"/> </td>
			          <td><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/> </td>
						<td><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/> </td>
						<c:if test="${item.currency==1}">
							<td>￥${item.accountsreceivable}</td>
						</c:if>
						<c:if test="${item.currency==2}">
							<td>₱${item.accountsreceivable}</td>
						</c:if>
						<c:if test="${item.isdao==1}">
							<td><a onclick="change(${item.id})">否<br/><span style="font-size: 12px;">not</span></a></td>
						</c:if>
						<c:if test="${item.isdao==2}">
							<td>是<br/><span style="font-size: 12px;">yes</span></td>
						</c:if>
						<td><fmt:formatDate value="${item.paymentdate}" pattern="yyyy-MM-dd" /></td>
						<c:if test="${item.rentOutTypeID==25}">
							<td>钟点</td><br/><span style="font-size: 12px;">Hour</span>
						</c:if>
						<c:if test="${item.rentOutTypeID==26}">
							<td>全日<br/><span style="font-size: 12px;">Full-time</span></td>
						</c:if>
						<c:if test="${item.rentOutTypeID==72}">
							<td>床位<br/><span style="font-size: 12px;">Bed</span></td>
						</c:if>
			          <td hidden>${item.isBillID}</td>
			          <td hidden>${item.stayregisterdetailsId}</td>
						<td hidden>${item.predetermineID}</td>
						<td hidden>${item.passengerName}</td>
						<td>${item.passengerName}</td>
			        </tr>
		        </c:if>
		        <c:if test="${item.remind==0}">
			        <tr >
			          <td><input type="checkbox" name="id" value="${item.id}"></td>
						<td>${item.supplierName}</td>
						<td>${item.roomNumber}</td>
						<c:if test="${item.codeNumber!=null}">
							<td><a href="${ctx}/StayRegister/orderDetails.do?orderID=${item.codeNumber}">${item.codeNumber}</a></td>
						</c:if>
						<c:if test="${item.codeNumber==null}">
							<td>${item.codeNumber}</td></c:if>
						<td>${item.changingRoomNumber}</td>
						<td><fmt:formatDate value="${item.registerTime}" pattern="yyyy-MM-dd"/> </td>
						<td><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/> </td>
						<td><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/> </td>
						<c:if test="${item.currency==1}">
						<td>￥${item.accountsreceivable}</td>
						</c:if>
						<c:if test="${item.currency==2}">
							<td>₱${item.accountsreceivable}</td>
						</c:if>
						<c:if test="${item.isdao==1}">
							<td><a onclick="change(${item.id})">否<br/><span style="font-size: 12px;">not</span></a></td>
						</c:if>
						<c:if test="${item.isdao==2}">
							<td>是<br/><span style="font-size: 12px;">yes</span></td>
						</c:if>
						<td><fmt:formatDate value="${item.paymentdate}" pattern="yyyy-MM-dd" /></td>
						<c:if test="${item.rentOutTypeID==25}">
							<td>钟点<br/><span style="font-size: 12px;">Hour</span></td>
						</c:if>
						<c:if test="${item.rentOutTypeID==26}">
							<td>全日<br/><span style="font-size: 12px;">full-time</span></td>
						</c:if>
						<c:if test="${item.rentOutTypeID==72}">
							<td>床位<br/><span style="font-size: 12px;">bed</span></td>
						</c:if>

			          <td hidden>${item.isBillID}</td>
			          <td hidden>${item.stayregisterdetailsId}</td>
						<td hidden>${item.predetermineID}</td>
						<td hidden>${item.passengerName}</td>
						<td>${item.passengerName}</td>
			        </tr>
		        </c:if>
	        </c:forEach>

	      </tbody>
	    </table>
    </div>
    </div>
  </div>
    
    
    
    
    <div class="modal hide fade" id="duixiang" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
            <div class="span8">
				<label class="labelroomnumber">团队名称：<br/><span>Team name</span></label>
			   <input id="txtnameidTwo" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字">
			   <div class="input-append">  
			      <button class="btn-success textone" style="margin-left:-4px;height:26px;" onclick="selectTarget()"><li class="icon-search icon-white"></li>search</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="confirmRarget()" data-dismiss="modal">
				  <li class="icon-plus icon-white"></li>确定选择(Definite choice)</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
				<th rowspan="2">选择<br/><span style="font-size: 12px;">Choice</span></th>
	          <th rowspan="2">对象类别<br/><span style="font-size: 12px;">Object class</span></th>
	          <th rowspan="2">团队名称<br/><span style="font-size: 12px;">Team name</span></th>
	          <th rowspan="2">团队编号<br/><span style="font-size: 12px;">Team number</span></th>
	          <th rowspan="2">负责人<br/><span style="font-size: 12px;">Person in charge</span></th>
	          <th rowspan="2">登记时间<br/><span style="font-size: 12px;">Registration time</span></th>
	          <th rowspan="2">电话号码<br/><span style="font-size: 12px;">Phone number</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="radio" id="idTwo" value=""></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    </div>
    
    
    <%--<div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：Name of passenger</label>
			   <input name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>search</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>Determine</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择<span style="font-size: 12px;">Choice</span></th>
	          <th >房间号<span style="font-size: 12px;">Choice</span></th>
	          <th >性别<span style="font-size: 12px;">Choice</span></th>
	          <th >证件类型<span style="font-size: 12px;">Choice</span></th>
	          <th >证件号码<span style="font-size: 12px;">Choice</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="twoid" value="${item.id}"></td>
		          <td>${item.roomNumber}</td>
		          <td>${item.guestRoomLevelName}</td>
		          <td>${item.roomName}</td>
		          <td>${item.roomAmount}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    </div>--%>
    
    
    
    
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
 
   function registerfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var roomNumber="";
     var TOF=0;
     var predetermineID="";
       var registerTime=null;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		roomNumber=table.rows[selectedIndex-1].cells[2].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
        predetermineID=table.rows[selectedIndex-1].cells[14].innerHTML;
        registerTime=table.rows[selectedIndex-1].cells[5].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！"+' \n '+"I'm sorry! This operation cannot be performed after the data has been closed");
       return;
     }
       if (registerTime!=null && registerTime!=" "){
           alert("次数据已经登记过了！"+' \n '+"It's registered");
           return;
       }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("登记只能根据一个房间登记"+' \n '+"Registration can only be based on one room");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toregister.do?id='+chk_value+
		   '&roomNumber='+roomNumber+'&LvKeLeiXingId='+55+"&predetermineID="+predetermineID;
		}
	}else{
	  alert("请选择一条房间进行登记"+' \n '+"Please select a room to register");
	}
     /* parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toregister.do'; */
   }
   
   function teamRegisterfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var roomNumber="";
     var TOF=0;
     var predetermineID="";
       var registerTime=null;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		roomNumber=table.rows[selectedIndex-1].cells[2].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
        predetermineID=table.rows[selectedIndex-1].cells[14].innerHTML;
        registerTime=table.rows[selectedIndex-1].cells[5].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！"+' \n '+"I'm sorry! This operation cannot be performed after the data has been closed");
       return;
     }
       if (registerTime!=null && registerTime!=" "){
           alert("次数据已经登记过了！"+' \n '+"It's registered");
           return;
       }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("登记只能根据一个房间登记"+' \n '+"Registration can only be based on one room");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toregister.do?id='+chk_value+
		   '&roomNumber='+roomNumber+'&LvKeLeiXingId='+56+"&predetermineID="+predetermineID;
		}
	}else{
	  alert("请选择一条房间进行登记"+' \n '+"Please select a room to register");
	}

   }
   
   
 
   function addfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Predetermine/toadd.do';
   }
   
   function arrangefunction(){
      /* var id=document.getElementById("id").value;
       alert(id);+"&id"+id*/
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toarrangeroom.do?LvKeLeiXingId='+55;
   }
   
   function teamArrangefunction(){
     var tuanDuiID=document.getElementById("tuanDuiId").value;
     /*var id=document.getElementById("id").value;+"&id="+id*/
     if(tuanDuiID!=""){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toarrangeroom.do?tuanDuiID='+tuanDuiID+
        '&LvKeLeiXingId='+56;
     }else{
        alert("请选择对象再安排房间！"+' \n '+"Please select an object to arrange the room again");
     }
   }
   
   function changroomfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
     var TOF=0;
     var rent=null;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[15].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  		rent=table.rows[selectedIndex-1].cells[11].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！"+' \n '+"I'm sorry! This operation cannot be performed after the data has been closed");
       return;
     }
       if (lvKeName==""){
           alert("请先登记!"+' \n '+"Please register first.");
           return;
       }
       if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间进行换房哦"+' \n '+"Only one room can be selected for room change");
		}else{
		   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tochangroom.do?id='+
		   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+55;
		}
	}else{
	  alert("请选择一条数据进行换房"+' \n '+"Please select a piece of data to change rooms");
	}
   }
   
   function teamChangroomfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var rentId=null;
     var selectedIndex="";
     var lvKeName="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[15].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
        rentId=table.rows[selectedIndex-1].cells[11].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！"+' \n '+"I'm sorry! This operation cannot be performed after the data has been closed");
       return;
     }
      /* if (rentId=="床位") {
           alert("该数据没法进行此操作!");
           return;
       }*/
      if (lvKeName==""){
          alert("请先登记!")+' \n '+"";
          return;
	  }
  	if(chk_value!=""){

		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间进行换房哦"+' \n '+"Only one room can be selected for room change");
		}else{
		   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tochangroom.do?id='+
		   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+56;
		}
	}else{
	  alert("请选择一条数据进行换房"+' \n '+"Please select a piece of data to change rooms");
	}

   }
   function consumptionfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var roomNumber="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[15].innerHTML;
  		roomNumber=table.rows[selectedIndex-1].cells[2].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间添加消费哦"+' \n '+"Only one room can be selected to add consumption");
		}else{
		    if(lvKeName==""){
			   alert("请先登记");
			}else{
			   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toconsumption.do?id='+
			   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+55+'&roomNumber='+roomNumber+'&isBillID='+TOF;
		   }
		}
	}else{
	  alert("请选择一条数据进行添加消费"+' \n '+"Please select a piece of data to add consumption");
	}
   }
   
   function teamConsumptionfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var roomNumber="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[15].innerHTML;
  		roomNumber=table.rows[selectedIndex-1].cells[2].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间添加消费哦"+' \n '+"Only one room can be selected to add consumption");
		}else{
			if(lvKeName==""){
			   alert("请先登记");
			}else{
			   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toconsumption.do?id='+
			   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+56+'&roomNumber='+roomNumber+'&isBillID='+TOF;
			}
		}
	}else{
	  alert("请选择一条数据进行添加消费"+' \n '+"Please select a piece of data to add consumption");
	}
   }
   
   
   
   function payfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var TOF=0;
     var name="";
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[15].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  		name=table.rows[selectedIndex-1].cells[15].innerHTML;
  	});
  	if (name==""){
        alert("很抱歉！请先登记！"+' \n '+"I'm sorry! Please register first.");
        return;
	}
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！"+' \n '+"I'm sorry! This operation cannot be performed after the data has been closed");
       return;
     }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间进行结账哦"+' \n '+"Only one room can be selected for checkout");
		}else{
		    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/topay.do?id='+chk_value+'&lvKeName='+lvKeName;
		}
	}else{
	  alert("请选择一条数据进行结账"+' \n '+"Please select a piece of data for closing");
	}
   }
   
   function volumeroomfunction(){
     var tuanDuiID=document.getElementById("tuanDuiId").value;
     var teamName=document.getElementById("teamNameId").value;
     if(tuanDuiID!=""){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tovolumeroom.do?tuanDuiID='+
        tuanDuiID+'&teamName='+teamName;
     }else{
        alert("请选择对象再安排房间！"+' \n '+"Please select an object to arrange the room again");
     }
   }
   
   function teamdepositfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toteamdeposit.do';
   }
   
   function teampayfunction(){
      // var table=document.getElementById("tbody");
     var tuanDuiID=document.getElementById("tuanDuiId").value;
     var teamIsBillId=document.getElementById("teamIsBillId").value;


     if(teamIsBillId==69){
       alert("很抱歉！该状态为已结账没法进行此操作！"+' \n '+"I'm sorry! This operation cannot be performed if the status is closed");
       return;
     }
     if(tuanDuiID!=""){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toteampay.do?tuanDuiID='+tuanDuiID;
     }else{
        alert("请选择对象再结账！"+' \n '+"Please select an object and close again");
     }
   }
   
   /* function shiftpersonagefunction(){
	    var id=[];
	    var table=document.getElementById("tbody");
	    var selectedIndex="";
	    var stayregisterdetailsId="";
	  	$('input[name="id"]:checked').each(function(){
	  		id.push($(this).val());
	  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		    stayregisterdetailsId=table.rows[selectedIndex-1].cells[13].innerHTML;
	  	});
	  	if(stayregisterdetailsId==""){
	  	   alert("此房间还没有登记哦！不能进行此操作");
	  	   return false;
	  	}
	  	if(id!=""){
	  	  if(id.toString().indexOf(",")>0){
			   alert("转为散客只能选择一条");
			}else{
			    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toshiftpersonage.do?id='+id+
		    '&stayregisterdetailsId='+stayregisterdetailsId
			}
	  	}else{
		  alert("请选择一条数据进行转为散客");
		}
   }*/
   
   
   /*function shiftteamfunction(){
    var id=[];
    var table=document.getElementById("tbody");
    var selectedIndex="";
    var stayregisterdetailsId="";
  	$('input[name="id"]:checked').each(function(){
  		id.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		stayregisterdetailsId=table.rows[selectedIndex-1].cells[13].innerHTML;
  	});
  	if(stayregisterdetailsId==""){
  	   alert("此房间还没有登记哦！不能进行此操作");
  	   return false;
  	}
  	if(id!=""){
  	  if(id.toString().indexOf(",")>0){
		   alert("转入团队只能选择一条");
		}else{
		    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toshiftteam.do?id='+id+
		    '&stayregisterdetailsId='+stayregisterdetailsId;
		}
  	}else{
	  alert("请选择一条数据进行转入团队");
	}
   }*/

   
   /*function updatefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("修改只能选择一条");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/ReceiveTarget/toupdate.do?id='+chk_value;
		}
	}else{
	  alert("请选择一条数据进行修改");
	}
  }*/
  
   /*function deletefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
  	var flag=window.confirm("注意：您确定要永久删除该信息吗?");
     if(flag){
  	  parent.document.getElementById("Mainid").src='${ctx}/ReceiveTarget/delete.do?id='+chk_value;
  	}
  	}else{
	  alert("请选择一条或多条数据进行删除");
	}
	
  }*/
  
  
 if(${LvKeLeiXingId==55}){
    $('#oneid').tab('show');
  }else if(${LvKeLeiXingId==56}){
    $('#twoid').tab('show');
  } 

  
  
  function selectChange(){
    var isBillID=document.getElementById("isBillID").value;
    parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?isBillID='+isBillID+
    '&LvKeLeiXingId='+55;
  }
  
  
  function selectfunction(){
    var isBillID=document.getElementById("isBillID").value;
    var txtname=document.getElementById("txtnameid").value;
    parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+55+
    '&isBillID='+isBillID+"&txtname="+txtname;
  }
  
  
  function teamSelect(){
    var isBillID=document.getElementById("teamIsBillId").value;
    var txtname=document.getElementById("roomNumberId").value;
    var tuanDuiID=document.getElementById("tuanDuiId").value;
    var teamNameId=document.getElementById("teamNameId").value;
  	var teamCodeId=document.getElementById("teamCodeId").value;
  	var principalId=document.getElementById("principalId").value;
  	var contactPhoneNUmberId=document.getElementById("contactPhoneNUmberId").value;
  	var registerTimeId=document.getElementById("registerTimeId").value;
    parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toteamlist.do?LvKeLeiXingId='+56+
    '&isBillID='+isBillID+"&txtname="+txtname+"&tuanDuiID="+tuanDuiID+"&teamNameId="+teamNameId
    +"&teamCodeId="+teamCodeId+"&principalId="+principalId+
    "&contactPhoneNUmberId="+contactPhoneNUmberId+"&registerTimeId="+registerTimeId;
  }
  
  
  function teamfunction(){
     parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+56;
  }
   function lvKefunction(){
     parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+55;
  }
  
  
  function selectTarget(){
     var tbody = document.getElementById("tbodyTwo");
     var name=document.getElementById("txtnameidTwo").value;
     var i=0;
     $("#tbodyTwo").empty();
     $.ajax({      
         cache:false,
         type: "POST",
         url: '${ctx}/Predetermine/selectTarget.do',
         data:"txtname="+name,
         async:false,
         success: function (result) { 
            for (var key in result) { 
                i++;               
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数
               
                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdTargetTypeName = tr.insertCell(-1);
                var tdTeamName = tr.insertCell(-1);
                var tdTeamCode = tr.insertCell(-1);
                var tdPrincipal = tr.insertCell(-1);
                var tdRegisterTime = tr.insertCell(-1);
                var tdContactPhoneNUmber=tr.insertCell(-1);
                
                tdcheckbox.innerHTML = "<input type='radio' name='idTwo' value='"+item.id+"'>";
                tdTargetTypeName.innerHTML = item.targetTypeName;
                tdTeamName.innerHTML = item.teamName;
                tdTeamCode.innerHTML =item.teamCode;         //中间这个是数据
                tdPrincipal.innerHTML =item.principal;
                tdRegisterTime.innerHTML =new Date(item.registerTime).Format("yyyy-MM-dd hh:mm:ss");
                tdContactPhoneNUmber.innerHTML=item.contactPhoneNUmber;
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据");
            }               
          },
          error: function(data) {
           }
     });
   }
   
   
   function confirmRarget(){
    var chk_value=[];
    var table=document.getElementById("tbodyTwo");                         
    var selectedIndex="";                     
	var teamName="";
    var teamCode="";
    var principal="";
    var contactPhoneNUmber="";
    var registerTime="";
  	$('input[name="idTwo"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
  		teamName=table.rows[selectedIndex-1].cells[2].innerHTML;     // 获取选中的索引的 单元格的值
  		teamCode=table.rows[selectedIndex-1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
  		principal=table.rows[selectedIndex-1].cells[4].innerHTML;     // 获取选中的索引的 单元格的值
  		contactPhoneNUmber=table.rows[selectedIndex-1].cells[6].innerHTML;     // 获取选中的索引的 单元格的值
  		registerTime=table.rows[selectedIndex-1].cells[5].innerHTML;     // 获取选中的索引的 单元格的值
  	});
  	document.getElementById("tuanDuiId").value=chk_value;
  	document.getElementById("teamNameId").value=teamName;
  	document.getElementById("teamCodeId").value=teamCode;
  	document.getElementById("principalId").value=principal;
  	document.getElementById("contactPhoneNUmberId").value=contactPhoneNUmber;
  	document.getElementById("registerTimeId").value=registerTime;
  	
  	var isBillID=document.getElementById("teamIsBillId").value;
    var tuanDuiID=document.getElementById("tuanDuiId").value;
  	teamSelect();

   }
   
   
  
  
  $('#duixiang').modal().css({
       'width':'72%',
	   'margin-left':function(){
	   return -($(this).width()/2);
	   }
   });
 $('#duixiang').modal('hide');
  
   
   
   
   
   
  /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
      var isBillID=document.getElementById("isBillID").value;
      var txtname=document.getElementById("txtnameid").value;
      var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
     location.href="${ctx}/StayRegister/tolist.do?currentPage="+p+"&txtname="+txtname+
     "&isBillID="+isBillID+"&LvKeLeiXingId="+LvKeLeiXingId;
     }
   });


  function consumption() {
      var chk_value=[];
      $('input[name="id"]:checked').each(function(){
          chk_value.push($(this).val());
      });
      if(chk_value!=""){
          if(chk_value.toString().indexOf(",")>0){
              alert("修改只能选择一条");
          }else{
              parent.document.getElementById("Mainid").src='${ctx}/StayRegister/roomConsumption.do?id='+chk_value;
          }
      }else{
          alert("请选择一条数据进行修改");
      }
  }


   function teamSelects(){
       var isBillID=document.getElementById("teamIsBillId").value;
       var orderID=document.getElementById("orderID").value;
       var tuanDuiID=document.getElementById("tuanDuiId").value;
       var teamNameId=document.getElementById("teamNameId").value;
       var teamCodeId=document.getElementById("teamCodeId").value;
       var principalId=document.getElementById("principalId").value;
       var contactPhoneNUmberId=document.getElementById("contactPhoneNUmberId").value;
       var registerTimeId=document.getElementById("registerTimeId").value;
       parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toteamlists.do?LvKeLeiXingId='+56+
           '&isBillID='+isBillID+"&orderID="+orderID+"&tuanDuiID="+tuanDuiID+"&teamNameId="+teamNameId
           +"&teamCodeId="+teamCodeId+"&principalId="+principalId+
           "&contactPhoneNUmberId="+contactPhoneNUmberId+"&registerTimeId="+registerTimeId;
   }
   function change(value) {
       var falg=confirm("是否确认收款？"+' \n '+"Confirm collection?");
       if (falg==true){
           location.href="${ctx}/StayRegister/confirmReceipt.do?id="+value+"&isdao="+2;
       }
   }
 </script>
   
  </body>
</html>
