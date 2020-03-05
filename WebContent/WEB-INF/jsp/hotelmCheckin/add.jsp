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
     margin-left:10px;
     width:88%;
     font-size:15px;
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
    
    .theadone{
     background-color: #CCFF99;
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
    
    .heigthone{
      height:26px;
    }
    .widthone{
     width:95%;
     float:left;
    }
    .widthtwo{
     width:100%;
    }
    .yansered{
      color:red;
    }
  
  </style>
  </head>
 
 
  <body>
  <div class="container" style="height:630px;overflow-x:auto;border: solid; border-color: #DDDDDD;">
    
    <div class="span12" style="text-align: center;">
      <div class="row-fluid">
        <h3>客房预订新增(New room reservation)</h3>
      </div>
    </div>
    
    <form id="form1"  method="post">
    <div class="span12" >
      <div class="row-fluid">
        <div class="span1">
            <button class="btn btn-info btn-small" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>save</button>
        </div>
         <div class="span1">
            <button class="btn btn-warning btn-small" type="button" onclick="lastStep()"><li class="icon-remove icon-white"></li>cancel</button>
        </div>
      </div>
    </div>

        <div class="span12" style="margin-top:12px;">
            <div class="row-fluid">
                <div class="span3">
                    <label>房间号：<br/><span style="font-size: 12px;">roomNumber</span></label>
                    <input id="roomNumber" name="roomNumber" type="text" style="width:97%;height:27px;float:left;" readonly value="${roomNumber}">
                    <input id="roomid" name="roomid" type="hidden"value="${roomid}">
                    <div id="div1" style="float:right;">
                        <label class="yansered" style="margin-top:7px;">*</label>
                    </div>
                </div>
                <div class="span3">
                    <label>供应商：<br/><span style="font-size: 12px;">supperName</span></label>
                    <input id="supperName" name="supperName" type="text" style="width:97%;height:27px;float:left;" readonly value="${supperName}">
                    <input id="supperId" name="supperId" type="hidden"value="${supperId}">
                    <div id="div2" style="float:right;">
                        <label class="yansered" style="margin-top:7px;">*</label>
                    </div>
                </div>
            </div>
        </div>
    <div class="span12" style="margin-top:12px;">
      <div class="row-fluid">
          <div class="span3">
              <label>姓名：<br/><span style="font-size: 12px;">Name</span></label>
              <input id="nameId" name="name" type="text" style="width:97%;height:27px;float:left;" onchange="onchangeOnes()" onblur="YZ();">
              <div id="divOne" style="float:right;">
                  <label class="yansered" style="margin-top:7px;">*</label>
              </div>
          </div>
          <div class="span3">
              <label>性别：<br/><span style="font-size: 12px;">Gender</span></label>
              <select name="genderID" id="genderID" style="width:100%;height:27px;">
                  <c:forEach items="${listGender}" var="item">
                      <option value="${item.far_id}" <c:if test="${item.far_id==31}">selected="selected"</c:if>>
                          <c:if test="${item.far_id==31}">
                              ${item.attributeDetailsName}male
                          </c:if>
                          <c:if test="${item.far_id==32}">
                              ${item.attributeDetailsName}female
                          </c:if>
                      </option>
                  </c:forEach>
              </select>
          </div>
          <div class="span3">
              <label>联系电话：<br/><span style="font-size: 12px;">Contact number</span></label>
              <input id="contactPhoneNumberId" name="contactPhoneNumber" type="text"
                     style="width:100%;height:27px;"  placeholder="只能为手机号码" onchange="onchangeOnes()" onblur="YZ();">
          </div>
      </div>

      </div>
        <div class="span12" style="margin-top:12px;">
          <div class="span3">
              <label>应收款：<span style="font-size: 12px;">Receivables</span></label>
              <input id="accountsreceivableid" name="accountsreceivable" type="text" onchange="onchangeOne()" style="width:97%;height:27px;float:left;" >
              <div id="divaccountsreceivable">
                  <label class="yansered" style="margin-top:12px;">*</label>
              </div>
          </div>
        <div class="span3">
           <label>支付方式<span style="font-size: 12px;">Payment method</span></label>
           <select name="payWayID" id="payWayID" style="height:26px;width:100%;">
		            <c:forEach items="${listOne}" var="item">
                        <c:if test="${item.far_id==21}">
                            <option value="${item.far_id}" <c:if test="${item.far_id==21}" >selected="selected"</c:if>>
                                    ${item.attributeDetailsName}(cash)
                            </option>
                        </c:if>
                        <c:if test="${item.far_id==22}">
                            <option value="${item.far_id}" <c:if test="${item.far_id==21}" >selected="selected"</c:if>>
                                    ${item.attributeDetailsName}(Transfer accounts)
                            </option>
                        </c:if>
                        <c:if test="${item.far_id==23}">
                            <option value="${item.far_id}" <c:if test="${item.far_id==21}" >selected="selected"</c:if>>
                                    ${item.attributeDetailsName}(Credit Card)
                            </option>
                        </c:if>
			        </c:forEach> 
		    </select>
        </div>
          <div class="span3">
              <label>货币类型：<span style="font-size: 12px;">Currency type</span></label>
              <select  name="currency" id="currency" style="width: 100%;height:27px;">
                  <option value="1">人民币(RMB)</option>
                  <option value="0">菲律宾币(PHP)</option>
              </select>
          </div>
      </div>
        <!----------------- ------------------------------------------------------------------------------------------------------------- -->
        <div class="span12">
            <div class="row-fluid">
                <div class="span3">
                    <label>是否到账：<span style="font-size: 12px;">Arrival account</span></label>
                    <select  name="isdao" id="isdao" style="width: 100%;height:27px;">
                        <option value="2">是(yes)</option>
                        <option value="1">否(no)</option>
                    </select>

                </div>
                <div class="span3">
                    <label>入住时间：<span style="font-size: 12px;">check-in time</span></label>
                    <input id="checkintimeId" name="checkintime"  style="width:97%; height:27px;float:left;" readonly value="${checkin}"/>
                    <div id="divcheckintime">
                        <label class="yansered" style="margin-top:12px;">*</label>
                    </div>
                </div>
                <div class="span3">
                    <label>退房时间：<span style="font-size: 12px;">check-out time</span></label>
                    <input id="checkouttimeId" name="checkouttime"  style="width:97%; height:27px;float:left;" class="Wdate" type="text"
                           onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc})" onchange="onchangeOne()"/>
                    <div id="divcheckouttime">
                        <label class="yansered" style="margin-top:12px;">*</label>
                    </div>
                </div>
            </div>
        </div>
        <!--  =========================================================================================================================================== -->
        <div class="span12" style="margin-top:12px;">
            <div class="row-fluid">
                <div class="span3">
                    <label>平台<span style="font-size: 12px;">platform</span></label>
                    <select name="platformId" style="height:26px;width:100%;" id="platformId">
                        <c:forEach items="${listP}" var="item">
                            <option value="${item.id}" <c:if test="${item.id==4}" >selected="selected"</c:if>>
                                    ${item.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="span3">
                    <label>订单号：<span style="font-size: 12px;">Order number</span></label>
                    <input id="orderID" name="orderID" style="height:26px;float:left;" class="widthone" type="text" onblur="codeNumberYZ(this.value)"/>
                    <div id="divFour">
                        <label class="yansered" style="margin-top:12px;">*</label>
                    </div>
                </div>
                <div class="span3">
                    <label>是否折扣价：<span style="font-size: 12px;">Discount price or not</span></label>
                        <select name="isdicount" istyle="height:26px;width:100%;" id="isdicountId">
                                <option value="1"selected="selected">不是(no) </option>
                            <option value="0">  是(yes) </option>
                        </select>
                </div>
            </div>
        </div>
    </form>
  </div>
  
 
 
 
 
 <script type="text/javascript">
   
 
  
   var shijian="";
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
        }

   
   var roomIdShuZu=[];
   function onchangeOnes(){
       //姓名
       if(document.getElementById("nameId").value!=""){
           document.getElementById("divOne").style.display="none";
       }else{
           document.getElementById("divOne").style.display="block"; //显示
       }

       //联系电话
       if(document.getElementById("contactPhoneNumberId").value!=""){
           if(!document.getElementById("contactPhoneNumberId").value.trim().match("^[1][0-9]{10}$"))
           {
               document.getElementById("contactPhoneNumberId").focus();
               document.getElementById("contactPhoneNumberId").value="";
               alert("你输入的手机号码有误，请重新输入！"+' \n '+"The mobile number you entered is wrong");
           }
       }
   }

   
   function addfunction(){
      /* var roomNumber= document.getElementById("roomNumber").value;
       var supperName= document.getElementById("supperName").value;
       var nameId= document.getElementById("nameId").value;
       var genderID= document.getElementById("genderID").value;
       var contactPhoneNumberId= document.getElementById("contactPhoneNumberId").value;
       var accountsreceivableid= document.getElementById("accountsreceivableid").value;
       var payWayID= document.getElementById("payWayID").value;
       var currency= document.getElementById("currency").value;
       var isdao= document.getElementById("isdao").value;
       /!*var checkintimeId= document.getElementById("checkintimeId").value;
       var checkouttimeId= document.getElementById("checkouttimeId").value;*!/
       var platformId= document.getElementById("platformId").value;
       var orderID= document.getElementById("orderID").value;
       var isdicount= document.getElementById("isdicount").value;*/
       var checkin=document.getElementById("checkintimeId").value;
       var checkout =document.getElementById("checkouttimeId").value;
       var stay=new Date(Date.parse(checkin .replace('/-/g','/'))).getTime();
       var end=new Date(Date.parse(checkout .replace('/-/g','/'))).getTime();
     if(document.getElementById("checkintimeId").value==""){
         alert("入住时间不能为空"+' \n '+"Check in time cannot be empty");
         document.getElementById("checkintimeId").focus();
         return false;
     }else if(document.getElementById("checkouttimeId").value==""){
         alert("退房时间不能为空"+' \n '+"Check out time cannot be empty");
         document.getElementById("checkouttimeId").focus();
         return false;
     }else if(end<stay){
         alert("退房时间不能早于入住时间"+' \n '+"Check out time cannot be earlier than check in time");
         document.getElementById("checkouttimeId").focus();
         return false;
     }else if (document.getElementById("accountsreceivableid").value=="") {
         alert("应付款不能为空" + ' \n ' + "Payable cannot be empty");
         document.getElementById("accountsreceivableid").focus();
         return false;

     }

       if(document.getElementById("orderID").value==""){
           alert("订单号必填！"+' \n '+"Order number is required");
           return false;
       }
     var flag=listAllYZ();
     if (flag==false){
         alert("入住失败，请检查入住时间！"+' \n '+"Check in failed, please check in time");
         return false;
     }

     form1.action="${ctx}/Hotelm/addRoom.do";
     form1.submit();
   }


   function listAllYZ() {
       var f=true;
       var roomid=document.getElementById("roomid").value;
       var checkin=document.getElementById("checkintimeId").value;
       var checkout=document.getElementById("checkouttimeId").value;
       if(roomid!="" && checkin!=null){
           $.ajax({
               cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
               type: "POST",                                           //上面3行都是必须要的
               url: '${ctx}/Predetermine/listsYZ.do',       //地址 type 带参数
               data:"roomid="+roomid.trim()+"&checkin="+checkin.trim()+"checkout="+checkout.trim(),                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
               async:false,                                          // 是否 异步 提交
               success: function (result) {                          // 不出现异常 进行立面方
                   if(result>=1){
                       alert("入住失败"+' \n '+"Check in failure");                     //提示框
                       document.getElementById("checkouttimeId").value="";
                       f= false;
                   }else{
                       f= true;
                   }
               },
               error: function(data) { }
           });
       }
       return f;
   }


   function lastStep(){
       var spplierId=document.getElementById("supperId").value;
       var roomid=document.getElementById("roomid").value;
    // parent.document.getElementById('Mainid').src='${ctx}/Predetermine/tolist.do';
       window.location="${ctx}/Hotelm/day.do?id="+roomid+"&supplierId="+spplierId;
   }
   
   

   //验证
   function onchangeOne(){


     //抵达时间 
     if(document.getElementById("arriveTimeId").value!=""){
       document.getElementById("divThree").style.display="none";
     }else{
       document.getElementById("divThree").style.display="block"; //显示
     }
       //订单号
       if(document.getElementById("orderID").value!=""){
           document.getElementById("divFour").style.display="none";
       }else{
           document.getElementById("divFour").style.display="block"; //显示
       }
   }
   function codeNumberYZ(value) {
       var codeNumber=document.getElementById("orderID").value.trim();
       var is= /^\d+$/;
       if (codeNumber!="") {
           if (is.test(codeNumber) == false) {
               alert("订单号只能有数字组成"+' \n '+"Order number can only be composed of numbers");
               document.getElementById("orderID").value = "";
               return;
           }
       }
       if(value!=""){
           $.ajax({
               cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
               type: "POST",                                           //上面3行都是必须要的
               url: '${ctx}/Predetermine/codeNumberYZ.do',       //地址 type 带参数
               data:"orderID="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
               async:false,                                          // 是否 异步 提交
               success: function (result) {                          // 不出现异常 进行立面方
                   if(result>=1){
                       alert("订单号重复！"+' \n '+"Duplicate order number");                     //提示框
                       document.getElementById("orderID").value="";     //这个id的文本框的值 将会清空
                       document.getElementById("orderID").focus();      // 给这个id的文本框提供焦点
                       document.getElementById("divFour").style.display="block"; //显示
                   }else{ }
               },
               error: function(data) { }
           });
       }
   }
 </script>
   
  </body>
</html>
