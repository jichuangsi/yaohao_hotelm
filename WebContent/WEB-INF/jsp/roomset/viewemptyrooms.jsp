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
  <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
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
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:16px;
    }
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .dgvone{
      margin-top: 12px;
    }
    
    .roomnumberwidth{
      width:70%;
    }
    
  
  </style>
  
 </head>
  
 
  <body>
  <input  value="${user}" type="hidden" id="user"/>
  <div class="container" style="height:630px;overflow-x:auto;">
    <div class="span12">
	    <div class="row-fluid">
			<form action="${ctx}/RoomSet/toroomlist.do" method="post">
				<div class="span12">
					<div class="span3">
						<label class="labelroomnumber">房间号：Room number</label>
						<input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="height:26px;"
							   type="text" placeholder="Please input keywords." value="${txtname}">
					</div>
					<div class="span3">
						<label>开始时间：start time</label>
						<input id="timeOne" name="timeOne" style="height:26px;float:left;" id="timeOne" class="Wdate" type="text"
							   onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:pickedFunc})"
							   value="${timeOne}"/>
					</div>
					<div class="span3">
						<label>结束时间：End time</label>
						<input id="timeTwo" name="timeTwo" style="height:26px;float:left;" id="timeTwo" class="Wdate" type="text"
							   onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:pickedFunc})"
							   value="${timeTwo}"/>
					</div>
					<div class="span2">
						<div class="input-append">
							<button type="submit" class="btn-success textone">
							<li class="icon-search icon-white"></li>search</button>
						</div>
					</div>
				</div>

			</form>

    <br>
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择<br/><span style="font-size: 14px">Choice</span></th>
				<th >供应商<br/><span style="font-size: 14px">Supplier</span></th>
	          <th>房间号<br/><span style="font-size: 14px">Room Number</span></th>
	          <th>床位数<br/><span style="font-size: 14px">Number of beds</span></th>
	          <th>标准客房/天<br/><span style="font-size: 14px">Standard room / day</span></th>
				<th >入住时间<br/><span style="font-size: 14px">Check-in time</span></th>
				<th>退房时间<br/><span style="font-size: 14px">Check-out time</span></th>
			</tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr>
		          <td><input type="checkbox" name="id" value="${item.id}"></td>
					<td>${item.supplierName}</td>
					<td>${item.roomNumber}</td>
		          <td>${item.roomAcount}</td>
		          <td>￥${item.standardPriceDay}</td>

                    <td> <fmt:formatDate value="${item.checkin}" pattern="yyyy-MM-dd"/></td>
					<td> <fmt:formatDate value="${item.checkout}" pattern="yyyy-MM-dd"/></td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
	</div>
 
	</div>
 
 <script type="text/javascript">
   
    /* 分页要用的 */
   $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
     var txtname=document.getElementById("txtnameid").value;
     var timeOne=document.getElementById("timeOne").value;
     var timeTwo=document.getElementById("timeTwo").value;
     location.href="${ctx}/RoomSet/toroomlist.do?currentPage="+p+"&txtname="+txtname
     +"&timeOne="+timeOne+"&timeTwo="+timeTwo;
     }
   });
   var shijian="";
   function pickedFunc() {
       shijian = $dp.cal.getNewDateStr();
   }



 </script>
   
  </body>
</html>
