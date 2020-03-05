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
		    <form action="${ctx}/Hotelm/toRoom.do" method="post" style="float: left;">
				<input  value="${supper}" type="hidden" name="supperId" id="supperId"/>
				<div class="span12">
				<div class="span3">
					<label class="labelroomnumber">房间号：Room number</label>
					<input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text"
						   placeholder="Please input keywords" value="${txtname}">
				</div>
                    <div class="span4">
                        <label class="labelroomnumber">客房等级：Guest room rating</label>
                        <select name="guestRoomLevelID" class="cboone inputone"id="guestRoomLevelID"  onchange="selectChange()" style="width: 150px;">
                            <option value=""<c:if test="${guestRoomLevelID==null}">selected="selected"</c:if>>全部&nbsp;All</option>
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
					<div class="span2">
						<div class="input-append">
							<button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px">
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
				<th rowspan="2">选择<br/><span style="font-size: 14px">Choice</span></th>
				<th rowspan="2">房间号<br/><span style="font-size: 14px">Room Number</span></th>
				<th rowspan="2">客房等级<br/><span style="font-size: 14px">Guest room rating</span></th>
				<th rowspan="2">床位数<br/><span style="font-size: 14px">Number of beds</span></th>
				<th rowspan="2">标准客房/天<br/><span style="font-size: 14px">Standard room / day</span></th>
				<th rowspan="2">供应商<br/><span style="font-size: 14px">Supplier</span></th>
				<th rowspan="2">新增时间<br/><span style="font-size: 14px">Newly added time</span></th>

	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr><%--href="${ctx}/WebContent/jsp/hotelmCheckin/day2.jsp?id=${item.id}"--%>
		          <td><input type="checkbox" name="id" value="${item.id}"></td>
					<td><a  href="${ctx}/Hotelm/day.do?id=${item.id}&supplierId=${supper}">${item.roomNumber}</a></td>
					<c:if test="${item.guestRoomLevelID==8}">
						<td style="background:#99FF99;">${item.guestRoomLevelName}<br/><span style="font-size: 14px">Single room</span></td>
					</c:if>
					<c:if test="${item.guestRoomLevelID==10}">
						<td style="background:#99FF99;">${item.guestRoomLevelName}<br/><span style="font-size: 14px">Double room</span></td>
					</c:if>
					<c:if test="${item.guestRoomLevelID==11}">
						<td style="background:#99FF99;">${item.guestRoomLevelName}<br/><span style="font-size: 14px">Multihuman</span></td>
					</c:if>
					<c:if test="${item.guestRoomLevelID==12}">
						<td style="background:#99FF99;">${item.guestRoomLevelName}<br/><span style="font-size: 14px">Deluxe Suite</span></td>
					</c:if>
					<c:if test="${item.guestRoomLevelID==13}">
						<td style="background:#99FF99;">${item.guestRoomLevelName}<br/><span style="font-size: 14px">meeting room</span></td>
				</c:if>
					<c:if test="${item.guestRoomLevelID==14}">
						<td style="background:#99FF99;">${item.guestRoomLevelName}<br/><span style="font-size: 14px">Presidential suite</span></td>
					</c:if>
		          <td>${item.roomAmount}</td>
		          <td>￥${item.standardPriceDay}</td>
					<td>${item.supplierName}</td>
                    <td> <fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd"/></td>

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
     var supplier=document.getElementById("supplierid").value;
     var user=document.getElementById("user").value;
     var roomStateID=document.getElementById("roomStateID").value;
     var guestRoomLevelID=document.getElementById("guestRoomLevelID").value;
     location.href="${ctx}/Hotelm/toRoom.do?currentPage="+p+"&txtname="+txtname+"&supperId="+supplier
     +"&guestRoomLevelID="+guestRoomLevelID;
     }
   });
   var shijian="";
   function pickedFunc() {
       shijian = $dp.cal.getNewDateStr();
   }

 </script>
   
  </body>
</html>
