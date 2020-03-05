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
  <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
	 <%-- <script type="text/javascript" src="${ctx}/js/easyui/jquery.min.js"></script>
	  <script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>--%>
	  <script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>

	 <%-- <script type="text/javascript" src="${ctx}/js/financialstatics/financialstatics.js"></script>--%>

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
    <div class="span12" style="margin-top:10px;">
       <div class="row-fluid">
           <div class="span5">
              <label style="float:left;">结账区段：<br/><span style="font-size: 12px;">Checkout area</span> </label>
	          <!--最大日期为 id="datemax"的选中值或者当前系统日期-->
	          <input style="width:25%;height:26px;" type="text" id="datemin" class="input-text Wdate"
	          onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" value="${min}"> ~ 
		      <!--最大日期为当前系统日期，最小日期为id="datemin选中值"-->
			  <input style="width:25.5%;height:26px;" type="text" id="datemax" class="input-text Wdate"
			  onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${max}">
	          <button onclick="timeSelect()" type="button" class="btn-success" style="margin-top:-12px;height:25px;"><li class="icon-search icon-white"></li>search</button>
              <button onclick="particulars()" type="button" class="btn-info" style="margin-top:-12px;height:25px;"><li class="icon-zoom-in icon-white"></li>details</button>
           </div>
	          <label style="float:left;">出租房间数：<br/><span style="font-size: 12px;">Number of rental rooms</span></label>
              <label style="float:left;margin-right:15px;">${chuZuFangJianShu}</label>
              <label style="float:left;">住宿人数：<br/><span style="font-size: 12px;">Number of residents</span></label>
              <label style="float:left;margin-right:15px;">${zhuSuRenShu}</label>
              <label style="float:left;">应收人民币总计：<br/><span style="font-size: 12px;">RMB receivable</span></label>
              <label style="float:left;margin-right:15px;color:blue;">￥${xiaoFeiJinE}</label>
              <label style="float:left;">已收人民币总计：<br/><span style="font-size: 12px;">Received money</span></label>
              <label style="float:left;color:red;">￥${accountsReceived}</label>
		      <label style="float:left;">未收人民币总计：<br/><span style="font-size: 12px;">No money collected</span></label>
		      <label style="float:left;color:red;">￥${unpaidAccounts}</label>
		   <br/>
		   <label style="float:left;">应收菲律宾币总计：<br/><span style="font-size: 12px;">PHP receivable</span></label>
		   <label style="float:left;margin-right:15px;color:blue;">₱${fxiaoFeiJinE}</label>
		   <label style="float:left;">已收菲律宾币总计：<br/><span style="font-size: 12px;">Received money</span></label>
		   <label style="float:left;color:red;">₱${faccountsReceived}</label>
		   <label style="float:left;">未收菲律宾币总计：<br/><span style="font-size: 12px;">No money collected</span></label>
		   <label style="float:left;color:red;">₱${funpaidAccounts}</label>
       </div>
    </div>
    <div class="span12" style="margin-top:10px;">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid" id="dataTable">
	      <thead class="theadone">
	        <tr>
	          <th >选择<br/><span style="font-size: 12px;">Choice</span></th>
				<th>供应商<br/><span style="font-size: 12px;">Supplier</span></th>
	          <th >房间号<br/><span style="font-size: 12px;">Room number</span></th>
	          <th>平台<br/><span style="font-size: 12px;">platform</span></th>
	          <th >订单号<br/><span style="font-size: 12px;">Order number</span></th>
	          <th >入住时间<br/><span style="font-size: 12px;">Check-in time</span></th>
	          <th >退房时间<br/><span style="font-size: 12px;">Check-out time</span></th>
	          <th >应收账<br/><span style="font-size: 12px;">Accounts receivable</span></th>
				<th >是否到账<br/><span style="font-size: 12px;">Arrival account</span></th>
				<th >到账时间<br/><span style="font-size: 12px;">Payment date</span></th>
				<th >旅客姓名<br/><span style="font-size: 12px;">Name of passenger</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr >
		          <td><input type="radio" name="id" value="${item.id}"></td>
					<td>${item.supplierName}</td>
		          <td>${item.roomNumber}</td>
					<th>${item.platformName}</th>
					<th >${item.codeNumber}</th>
		          <td><fmt:formatDate value="${item.checkintime}" pattern="yyyy-MM-dd" /></td>
		          <td><fmt:formatDate value="${item.checkouttime}" pattern="yyyy-MM-dd" /></td>

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
		          <td hidden>${item.stayregisterdetailsId}</td>
					<td hidden>${item.registerTime}</td>
					<td>${item.passengerName}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
		   <a id="consumesOutExcel" class="easyui-linkbutton" style="" data-options="iconCls:'icon-redo'">导出当前数据<span style="font-size: 12px;">Export current data</span></a>

	    </table>
    </div>
    </div>
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
 

   function timeSelect(){
     var datemin=document.getElementById("datemin").value;
     var datemax=document.getElementById("datemax").value;
     parent.document.getElementById('Mainid').src='${ctx}/FinancialStatistics/tolist.do?datemin='+
     datemin+'&datemax='+datemax;
   }
   
   function particulars(){
     var id=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var stayregisterdetailsId="";
     var registerTime="";
     var datemin=document.getElementById("datemin").value;
     var datemax=document.getElementById("datemax").value;
     $('input[name="id"]:checked').each(function(){             // 遍历获取input被checked的
  		id.push($(this).val());                             // 获取选中的ID
  	    selectedIndex=this.parentNode.parentNode.rowIndex;
  	    stayregisterdetailsId=table.rows[selectedIndex-1].cells[10].innerHTML;
         registerTime=table.rows[selectedIndex-1].cells[11].innerHTML;
  	});

  	if(stayregisterdetailsId==""){
  	   alert("请选择一个房间再按 详情"+' \n '+"Please select a room and press");
  	   return false;
	}
  	if(id!=""){
  	   parent.document.getElementById('Mainid').src='${ctx}/FinancialStatistics/toinformation.do?id='
  	   +id+'&stayregisterdetailsId='+stayregisterdetailsId+'&min='+datemin+'&max='+datemax+'&registerTime='+registerTime;
  	}else{
  	   alert("请选择一个房间再按 详情"+' \n '+"Please select a room and press");
  	}
   }
   
   
   
   
 /!* 分页要用的 *!/
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
	     var datemin=document.getElementById("datemin").value;
	     var datemax=document.getElementById("datemax").value;
	     location.href="${ctx}/FinancialStatistics/tolist.do?currentPage="+p+
	     "&datemin="+datemin+"&datemax="+datemax;
     }
   });

  function change(value) {
      var falg=confirm("是否确认收款？"+' \n '+"Confirm collection");
      if (falg==true){
          location.href="${ctx}/FinancialStatistics/confirmReceipt.do?id="+value+"&isdao="+2;
	  }
  }



 $(function() {
       //导出excel表
       $("#consumesOutExcel").on('click',function(){
           var datemin=document.getElementById("datemin").value;
           var datemax=document.getElementById("datemax").value;
           $.messager.progress({
               title : '处理中',
               msg : '请稍后',
           });
           $.messager.progress('close');
           location.href="${ctx }/FinancialStatistics/export.do?datemin="+datemin+"&datemax="+datemax;

       });
   });

 </script>
   
  </body>
</html>
