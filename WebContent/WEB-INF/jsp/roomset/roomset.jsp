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
		    <form action="${ctx}/RoomSet/tolist.do" method="post" style="float: left;">
				<input  value="${user}" type="hidden" name="user" id="user"/>
				<div class="span12">
				<div class="span3">
					<label class="labelroomnumber">房间号：Room number</label>
					<input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text"
						   placeholder="Please input keywords" value="${txtname}">
				</div>
				<div class="span2">
					<label class="labelroomnumber">供应商：Supplier</label>
					<select name="supplier" class="cboone inputone" id="supplierid" onchange="selectChange()" style="width: 100px;">
						<option value=""<c:if test="${supplier==null}">selected="selected"</c:if>>全部&nbsp;All</option>
						<c:forEach items="${slist}" var="item">
							<option value="${item.id}"<c:if test="${item.id==supplier}">selected="selected"</c:if>>
									${item.supplierName}
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="span2">
					<label class="labelroomnumber">房态：Room state</label>
					<select name="roomStateID" class="cboone inputone" id="roomStateID" onchange="selectChange()" style="width: 100px;">
                        <option value=""<c:if test="${roomStateID==null}">selected="selected"</c:if>>全部&nbsp;All</option>
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
                    <div class="span3">
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
		</div>
	</div>
			</form>


    <div class="span12">
      <div class="row-fluid">
       <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()" >
			 <li class="icon-plus icon-white"></li>add</button>
       </div>
       <div class="span3">
         <button class="btn btn-warning btn-small textone" type="button" onclick="updatefunction()">
			 <li class="icon-pencil icon-white"></li>modify</button>
       </div>
		  <c:if test="${user==1}">
			  <div class="span3">
				  <button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()" >
					  <li class="icon-remove icon-white"></li>delete</button>
			  </div>
		  </c:if>
      </div>
    </div>
    <br>
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
				<th rowspan="2">选择<br/><span style="font-size: 14px">Choice</span></th>
				<th rowspan="2">房间号<br/><span style="font-size: 14px">Room Number</span></th>
				<th rowspan="2">客房等级<br/><span style="font-size: 14px">Guest room rating</span></th>
				<th rowspan="2">房态<br/><span style="font-size: 14px">Room state</span></th>
				<th rowspan="2">床位数<br/><span style="font-size: 14px">Number of beds</span></th>
				<th rowspan="2">标准客房/天<br/><span style="font-size: 14px">Standard room / day</span></th>
	          <th colspan="4">钟点房价设置Hourly rate setting</th>
				<th rowspan="2">供应商<br/><span style="font-size: 14px">Supplier</span></th>
				<th rowspan="2">新增时间<br/><span style="font-size: 14px">Newly added time</span></th>

	        </tr>
			<tr>
				<th >标准房价/小时<br/><span style="font-size: 14px">Standard room rate / hour</span></th>
				<th >时长限制(小时)<br/><span style="font-size: 14px">Time limit (hours)</span></th>
				<th >首段时长(小时)<br/><span style="font-size: 14px">First paragraph Duration (hours)</span></th>
				<th >首段价格<br/><span style="font-size: 14px">First paragraph Price</span></th>
			</tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr>
		          <td><input type="checkbox" name="id" value="${item.id}"></td>
					<td><a href="${ctx}/RoomSet/detail.do?id=${item.id}">${item.roomNumber}</a></td>
		        <%--  <td>${item.guestRoomLevelName}</td>--%>
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


		          <c:if test="${item.roomStateID==1}">
					  <td style="background:#99FF99;">${item.roomName}<br/><span style="font-size: 14px">Vacant room</span></td>
		          </c:if>
		          <c:if test="${item.roomStateID==2}">
					  <td style="background:#DDDDDD;">${item.roomName}<br/><span style="font-size: 14px">Private housing</span></td>
		          </c:if>
		          <c:if test="${item.roomStateID==4}">
					  <td style="background:#99FFFF;">${item.roomName}<br/><span style="font-size: 14px">Reserve</span></td>
		          </c:if>
		          <c:if test="${item.roomStateID==5}">
					  <td style="background:#BBBB00;">${item.roomName}<br/><span style="font-size: 14px">To be cleaned</span></td>
		          </c:if>
		          <c:if test="${item.roomStateID==6}">
					  <td style="background:#FF7744;">${item.roomName}<br/><span style="font-size: 14px">Pending maintenance</span></td>
		          </c:if>
		          <c:if test="${item.roomStateID==7}">
					  <td style="background:#FF0088;">${item.roomName}<br/><span style="font-size: 14px">Unavailable</span></td>
		          </c:if>
		          <c:if test="${item.roomStateID==65}">
					  <td style="background:#FF00FF;">${item.roomName}<br/><span style="font-size: 14px">full</span></td>
		          </c:if>
		          <td>${item.roomAmount}</td>
		          <td>￥${item.standardPriceDay}</td>
		          <td>￥${item.standardPrice}</td>
		          <td>${item.maxDuration}</td>
		          <td>${item.firstDuration}</td>
		          <td>￥${item.firstPrice}</td>
					<td>${item.supplierName}</td>
                    <td> <fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd"/></td>
					<%--<c:if test="${item.roomStateID==4}">
						<td><a href="${ctx}/RoomSet/roomdetail.do?id=${item.id}&roomNumber=${item.roomNumber}">详情</a></td>
					</c:if>--%>
					<%--<c:if test="${item.roomStateID!=4}">
						<td><a href="#" >无</a></td>
					</c:if>--%>

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
  
 
 
 
 
 <script type="text/javascript">
   function addfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/RoomSet/toadd.do';
   }
   
   function updatefunction(){
       var user=document.getElementById("user").value;
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("修改只能选择一条"+' \n '+"Only one can be selected for modification");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/RoomSet/toupdate.do?id='+chk_value;
		}
	}else{
	  alert("请选择一条数据进行修改"+' \n '+"Please select a piece of data to modify");
	}
  }
  
   function deletefunction(){
       var user=document.getElementById("user").value;
           var chk_value=[];
           $('input[name="id"]:checked').each(function(){
               chk_value.push($(this).val());
           });

           if(chk_value!=""){
              /* if (user!=1) {
                   alert("您没有权限删除");
               }else {*/
               var flag=window.confirm("注意：您确定要永久删除该信息吗?"+' \n '+"Note: are you sure you want to permanently delete this information?");
               if(flag){
                   parent.document.getElementById("Mainid").src='${ctx}/RoomSet/delete.do?id='+chk_value;
               }
			  // }
           }else{
               alert("请选择一条或多条数据进行删除"+' \n '+"Please select one or more data to delete");
           }
  }


   
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
     location.href="${ctx}/RoomSet/tolist.do?currentPage="+p+"&txtname="+txtname+"&supplier="+supplier
     +"&user="+user+"&roomStateID="+roomStateID+"&guestRoomLevelID="+guestRoomLevelID;
     }
   });
   var shijian="";
   function pickedFunc() {
       shijian = $dp.cal.getNewDateStr();
   }

  /* function selectChange() {
       var txtname=document.getElementById("txtnameid").value;
       var supplier=document.getElementById("supplierid").value;
       var user=document.getElementById("user").value;
       var roomStateID=document.getElementById("roomStateID").value;
       var timeOne=document.getElementById("timeOne").value;
       var timeTwo=document.getElementById("timeTwo").value;
       location.href="${ctx}/RoomSet/tolist.do?currentPage="+p+"&txtname="+txtname+"&supplier="+supplier
           +"&user="+user+"&roomStateID="+roomStateID+"&timeOne="+timeOne+"&timeTwo="+timeTwo;
   }*/

 </script>
   
  </body>
</html>
