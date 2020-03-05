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
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
  <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.js"></script>
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
    
    .dgvone{
      margin-top: 12px;
    }
    
    .roomnumberwidth{
      width:55%;
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
  
  </style>
  
 
  <body>
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <input type="hidden" id="oneId">     <!-- 房间ID -->
    <input type="hidden" id="twoId">    
    <div class="span4">
	    <div class="row-fluid">
		       <label class="labelroomnumber">团队(team)/旅客(Passenger)：</label>
			   <input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="selectOne()" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>search</button>
			   </div>
	    </div>
    </div>
    <div class="span2">
      <select id="stateId" style="width:80%;height:26px; float:left;margin-top:12px;" onchange="selectTwo()">
        <c:forEach items="${listOne}" var="item">
			<c:if test="${item.far_id==66}">
				<option value="${item.far_id}" <c:if test="${item.far_id==state}">selected="selected"</c:if>>
						${item.attributeDetailsName}(Unscheduled)
				</option>
			</c:if>
			<c:if test="${item.far_id==67}">
				<option value="${item.far_id}" <c:if test="${item.far_id==state}">selected="selected"</c:if>>
						${item.attributeDetailsName}(Arranged)
				</option>
			</c:if>
        </c:forEach> 
	  </select>
    </div>
    <div class="span6">
      <div class="row-fluid">
       <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>add</button>
       </div>
		  <div class="span3">
			  <button class="btn btn-info btn-small textone" type="button" onclick="addBedfunction()"><li class="icon-plus icon-white"></li>床位(Beds sold)</button>
		  </div>
      <%-- <div class="span3">
         <button class="btn btn-warning btn-small textone" type="button" &lt;%&ndash;onclick="updatefunction()"&ndash;%&gt;><li class="icon-pencil icon-white"></li></button>
       </div>--%>

        <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="arrangeRoom()"><li class="icon-plus icon-white"></li>安排房间(Arrange rooms)</button>
       </div>
		  <div class="span3">
			  <button class="btn btn-info btn-small textone" type="button" onclick="arrangeRoomBed()"><li class="icon-plus icon-white"></li>床位安排房间(Room by bed)</button>
		  </div>
		  <div class="span3">
			  <button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>delete</button>
		  </div>
      </div>
    </div>
    <br>
    
    
    
    <div class="span12">
    <div class="tabbable" >  <!-- style="border:1px solid red"  -->
      <ul class="nav nav-tabs">
        <li class="active" id="tabOneId"><a href="#tab1" data-toggle="tab">接待对象(Receptionist)</a></li>
        <li ><a href="#tab2" data-toggle="tab">旅客信息(Passenger information)</a></li>
      </ul>
      
      <div class="tab-content">
        <div class="tab-pane active" id="tab1">
          <div class="row-fluid">
             <div class="span2">
                  <label>接待对象：<br/><span style="font-size: 12px;">Receptionist</span> </label>
			      <input id="teamNameId" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
              <div class="span2">
                  <label>团队编号：<br/><span style="font-size: 12px;">Team number</span></label>
			      <input id="teamCodeId" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
              <div class="span2">
                  <label>负责人：<br/><span style="font-size: 12px;">Person in charge</span></label>
			      <input id="principalId" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
              <div class="span2">
                  <label>联系电话：<br/><span style="font-size: 12px;">Contact number</span></label>
			      <input id="contactPhoneNUmberId" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
              <div class="span2">
                  <label>登记时间：<br/><span style="font-size: 12px;">Registration time</span></label>
			      <input id="registerTimeId" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
             <div class="span2" style="margin-top:23px;text-align: center;">
                <a href="#duixiang" data-toggle="modal" class="btn btn-info btn-small" onclick="selectTarget()">
					<li class="icon-plus icon-white"></li>选择对象(Select object)</a>
             </div>
          </div>
        </div>
        <div class="tab-pane" id="tab2">
          <div class="row-fluid">
             <div class="span2">
                  <label>姓名：<br/><span style="font-size: 12px;">name</span></label>
			      <input id="nameId" class="widthone" style="height: 25px;" type="text" readonly="readonly">
             </div>
              <div class="span2">
                 <label>性别：<br/><span style="font-size: 12px;">gender</span></label>
                 <input id="genderId" class="widthone" style="height: 25px;" type="text" readonly="readonly">
             </div>
               <div class="span2">
                  <label>联系电话：<br/><span style="font-size: 12px;">Contact number</span></label>
			      <input id="contactPhoneNumberId" name="commodityName" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
              <div class="span2" style="margin-top:23px;;text-align: center;">
                <a href="#lvke" data-toggle="modal" class="btn btn-info btn-small" onclick="souSuo()">
					<li class="icon-plus icon-white"></li>选择旅客(Choice of passengers)</a>
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
	          <th >选择<br/><span style="font-size: 12px;">Choice</span> </th>
	          <th >房间号<br/><span style="font-size: 12px;">Room number</span> </th>
				<th >旅客姓名<br/><span style="font-size: 12px;">Name of passenger</span> </th>
	          <th >应收款<br/><span style="font-size: 12px;">Receivables</span> </th>
				<th>是否到账<br/><span style="font-size: 12px;">Arrival account</span> </th>
				<th>到账时间<br/><span style="font-size: 12px;">Payment date</span> </th>
				<th>预定时间<br/><span style="font-size: 12px;">Scheduled time</span> </th>
				<th >入住时间<br/><span style="font-size: 12px;">Check-in time</span> </th>
				<th>退房时间<br/><span style="font-size: 12px;">Check-out time</span> </th>
				<th>订单号<br/><span style="font-size: 12px;">Order number</span> </th>
				<th >联系电话<br/><span style="font-size: 12px;">Contact number</span> </th>
	          <th >预定状态<br/><span style="font-size: 12px;">Predetermined condition</span> </th>
				<th >出租方式<br/><span style="font-size: 12px;">Rental mode</span> </th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		           <tr>
			          <c:if test="${item.passengerID!=0}">
				          <td><input type="checkbox" name="id" value="${item.id}"></td>
						  <td>${item.roomNumber}</td>
				          <td>${item.passengerName}</td>
						  <c:if test="${item.currency==1}">
							  <td>￥${item.accountsreceivable}</td>
						  </c:if>
						  <c:if test="${item.currency==2}">
							  <td>₱${item.accountsreceivable}</td>
						  </c:if>
						  <c:if test="${item.isdao==1}">
							  <td><a onclick="change(${item.id})">否(no)</a></td>
						  </c:if>
						  <c:if test="${item.isdao==2}">
							  <td>是(yes)</td>
						  </c:if>
						  <td><fmt:formatDate value="${item.paymentdate}" pattern="yyyy-MM-dd" /></td>
						  <td><fmt:formatDate value="${item.arriveTime}" pattern="yyyy-MM-dd"/> </td>
						  <td><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/> </td>
						  <td><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/> </td>
						  <td>${item.codeNumber}</td>
						  <td>${item.passengerContactPhoneNumber}</td>
						  <td>${item.predetermineStateName}</td>
						  <c:if test="${item.rentOutTypeID==25}">
							  <td>钟点(Hour)</td>
						  </c:if>
						  <c:if test="${item.rentOutTypeID==26}">
							  <td>全日(Full-time)</td>
						  </c:if>
						  <c:if test="${item.rentOutTypeID==72}">
							  <td>床位(beds)</td>
						  </c:if>
			          </c:if>
			          <c:if test="${item.passengerID==0}">
				          <td><input type="checkbox" name="id" value="${item.id}"></td>
						  <td>${item.roomNumber}</td>
						  <td>${item.passengerName}</td>
						  <c:if test="${item.currency==1}">
							  <td>￥${item.accountsreceivable}</td>
						  </c:if>
						  <c:if test="${item.currency==2}">
							  <td>₱${item.accountsreceivable}</td>
						  </c:if>
						  <c:if test="${item.isdao==1}">
							  <td><a onclick="change(${item.id})">否(no)</a></td>
						  </c:if>
						  <c:if test="${item.isdao==2}">
							  <td>是(yes)</td>
						  </c:if>
						  <td><fmt:formatDate value="${item.paymentdate}" pattern="yyyy-MM-dd" /></td>
						  <td><fmt:formatDate value="${item.arriveTime}" pattern="yyyy-MM-dd"/> </td>
						  <td><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd"/> </td>
						  <td><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd"/> </td>
						  <td>${item.codeNumber}</td>
						  <td>${item.contactPhoneNumber}</td>
						  <td>${item.passengerContactPhoneNumber}</td>
						  <c:if test="${item.rentOutTypeID==25}">
							  <td>钟点(Hour)</td>
						  </c:if>
						  <c:if test="${item.rentOutTypeID==26}">
							  <td>全日(Full-time)</td>
						  </c:if>
						  <c:if test="${item.rentOutTypeID==72}">
							  <td>床位(beds)</td>
						  </c:if>
					  </c:if>
		           </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    
    
    
    <div class="modal hide fade" id="duixiang" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
            <div class="span8">
				<label class="labelroomnumber">团队名称：<span style="font-size: 12px;">Team name</span></label>
			   <input id="txtnameidTwo" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
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
	          <th rowspan="2">选择<br/><span style="font-size: 12px;">choice</span></th>
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
    
    <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：<span style="font-size: 12px;">Name of passenger</span></label>
			   <input id="txtnameidThree" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;" onclick="souSuo()"><li class="icon-search icon-white"></li>search</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()" data-dismiss="modal">
				  <li class="icon-plus icon-white"></li>确定选择(Definite choice)</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择<br/><span style="font-size: 12px;">choice</span></th>
	          <th >姓名<br/><span style="font-size: 12px;">name</span></th>
	          <th >性别<br/><span style="font-size: 12px;">Gender</span></th>
	          <th >联系电话<br/><span style="font-size: 12px;">Phone number</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbodyThree">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="radio" name="idThree" value=""></td>
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
    
    
    
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
 $('#duixiang').modal().css({
       'width':'72%',
	   'margin-left':function(){
	   return -($(this).width()/2);
	   }
   });
 $('#duixiang').modal('hide');
   
   function addfunction(){
     var classone=document.getElementById("tabOneId").className;
     var one=document.getElementById("oneId").value;
     var two=document.getElementById("twoId").value;
     var lvKeName=document.getElementById("nameId").value;
     var teamName=document.getElementById("teamNameId").value;
     if(classone == "active"){
        if(one == ""){
          alert("你还没有添加对象信息哦！")
        }else{
          parent.document.getElementById('Mainid').src='${ctx}/Predetermine/toadd.do?id='+one+
          '&name='+teamName+'&type=1';
        }
     }else{
       if(two == "" ){
          alert("你还没有添加旅客信息哦！")
        }else{
          parent.document.getElementById('Mainid').src='${ctx}/Predetermine/toadd.do?id='+two+
          '&name='+lvKeName+'&type=2';
        }
     }
     
   }


   
   function updatefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("修改只能选择一条");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/Predetermine/toupdate.do?id='+chk_value;
		}
	}else{
	  alert("请选择一条数据进行修改");
	}
  }
  
   function deletefunction(){
    var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
  	var flag=window.confirm("注意：删除该预订信息会扣除该房间的押金的哦！您确定要永久删除该信息吗?");
     if(flag){
  	  parent.document.getElementById("Mainid").src='${ctx}/Predetermine/delete.do?id='+chk_value;
  	}
  	}else{
	  alert("请选择一条或多条数据进行删除");
	}
  }
  
  
  
  function souSuo(){
     var tbody = document.getElementById("tbodyThree");
     var name=document.getElementById("txtnameidThree").value;
     var i=0;
     $("#tbodyThree").empty();
     $.ajax({      
         cache:false,
         type: "POST",
         url: '${ctx}/Predetermine/selectPassenger.do',
         data:"txtname="+name,
         async:false,
         success: function (result) {
            for (var key in result) {
                i++;
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdName = tr.insertCell(-1);
                var tdGender = tr.insertCell(-1);
                var tdPhone = tr.insertCell(-1);


                tdcheckbox.innerHTML = "<input type='radio' name='idThree' value='"+item.id+"'>";
                tdName.innerHTML = item.name;
                tdGender.innerHTML = item.genderName;
                tdPhone.innerHTML =item.contactPhoneNumber;         //中间这个是数据
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据");
            }               
          },
          error: function(data) {
           }
     });
   }
  
  
   function confirmfunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyThree");                         
    var selectedIndex="";                     
	var name="";
	var gender="";
	 var phone="";
  	$('input[name="idThree"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
  		name=table.rows[selectedIndex-1].cells[1].innerHTML;     // 获取选中的索引的 单元格的值
        gender=table.rows[selectedIndex-1].cells[2].innerHTML;
        phone=table.rows[selectedIndex-1].cells[3].innerHTML;
  	});
      $.ajax({      
         cache:false,
         type: "POST",
         url: '${ctx}/Predetermine/confirmPassenger.do',
         data:"id="+chk_value,
         async:false,
         success: function (result) {
             document.getElementById("twoId").value=chk_value;
             document.getElementById("contactPhoneNumberId").value=phone;
             document.getElementById("nameId").value=name;
             document.getElementById("genderId").value=gender;
          },
          error: function(data) {
           }
     });
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
		//alert(principal);
  	});
  	document.getElementById("oneId").value=chk_value;
  	document.getElementById("teamNameId").value=teamName;
  	document.getElementById("teamCodeId").value=teamCode;
  	document.getElementById("principalId").value=principal;
  	document.getElementById("contactPhoneNUmberId").value=contactPhoneNUmber;
  	document.getElementById("registerTimeId").value=registerTime;
   }
   
   
   
   function selectOne(){
     var txtname=document.getElementById("txtnameid").value;
     var state=document.getElementById("stateId").value;
     parent.document.getElementById("Mainid").src='${ctx}/Predetermine/tolist.do?txtname='
     +txtname+'&state='+state;
   }
   
   function selectTwo(){
     var state=document.getElementById("stateId").value;
     parent.document.getElementById("Mainid").src='${ctx}/Predetermine/tolist.do?state='+state;
   }
   
   function arrangeRoom(){
      var chk_value=[];
       var table=document.getElementById("tbody");
       var selectedIndex="";
      var rentout=[];

  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
        rentout=table.rows[selectedIndex-1].cells[10].innerHTML;     // 获取选中的索引的 单元格的值

  	});
  	if(chk_value!=""){
  	    if (rentout=="床位"){
            alert("请选择按床位安排房间！");
            return;
		}

  	var flag=window.confirm("注意：房间已安排成功，是否转到，住宿登记界面，便于登记旅客信息");
	     if(flag){
	  	  parent.document.getElementById("Mainid").src='${ctx}/Predetermine/arrangeRoom.do?id='
	  	  +chk_value+'&tiaoZhuang='+1;
	  	}else{
	  	  parent.document.getElementById("Mainid").src='${ctx}/Predetermine/arrangeRoom.do?id='
	  	  +chk_value+'&tiaoZhuang='+2;
	  	}
  	}else{
	  alert("请选择一条或多条数据进行安排房间");
	}
   }
   
   
   
  /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
     var txtname=document.getElementById("txtnameid").value;
     var state=document.getElementById("stateId").value;
     location.href="${ctx}/Predetermine/tolist.do?currentPage="+p+"&txtname="+txtname+"&state="+state;
     }
   });

 function addBedfunction() {
     var classone=document.getElementById("tabOneId").className;
     var one=document.getElementById("oneId").value;
     var two=document.getElementById("twoId").value;
     var lvKeName=document.getElementById("nameId").value;
     var teamName=document.getElementById("teamNameId").value;
     if(classone == "active"){
         if(one == ""){
             alert("你还没有添加对象信息哦！")
         }else{
             parent.document.getElementById('Mainid').src='${ctx}/Predetermine/toaddBed.do?id='+one+
                 '&name='+teamName+'&type=1';
         }
     }else{
         if(two == "" ){
             alert("你还没有添加旅客信息哦！")
         }else{
             parent.document.getElementById('Mainid').src='${ctx}/Predetermine/toaddBed.do?id='+two+
                 '&name='+lvKeName+'&type=2';
         }
     }
 }

 function arrangeRoomBed() {
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var rentout=[];
     $('input[name="id"]:checked').each(function(){
         chk_value.push($(this).val());
         selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
         rentout=table.rows[selectedIndex-1].cells[10].innerHTML;     // 获取选中的索引的 单元格的值
     });
     if(chk_value!=""){
         if (rentout!="床位"){
             alert("改数据不属于按床位安排房间，请选择其他安排房间方式！");
             return;
         }
         var flag=window.confirm("注意：房间已安排成功，是否转到，住宿登记界面，便于登记旅客信息");
         if(flag){
             parent.document.getElementById("Mainid").src='${ctx}/Predetermine/arrangeRoomBed.do?id='
                 +chk_value+'&tiaoZhuang='+1;
         }else{
             parent.document.getElementById("Mainid").src='${ctx}/Predetermine/arrangeRoomBed.do?id='
                 +chk_value+'&tiaoZhuang='+2;
         }
     }else{
         alert("请选择一条或多条数据进行安排房间");
     }
 }

 </script>
   
  </body>
</html>
