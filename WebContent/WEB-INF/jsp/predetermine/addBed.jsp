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
    
    <input id="lvkeorteamId" type="hidden" value="${id}" >  <!-- 是团队还是旅客的ID -->
    <input id="teamId" type="hidden" value="${type}" >  <!-- 是团队还是旅客 -->
    
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

          <div class="span2">
              <button href="#xuanzhe" data-toggle="modal" class="btn btn-info btn-small" onclick="selectBedRoom()">
                  <li class="icon-plus icon-white"></li>选择床位售出房间(choice room)</button>
          </div>
      </div>
    </div>
    
    
    <div class="span12" style="margin-top:12px;">
      <div class="row-fluid">
        <div class="span3">
          <label>预订对象/旅客：<span style="font-size: 12px;">Booking object / passenger</span></label>
          <input name="commodityName" class="widthone" style="height: 26px;"  type="text" readonly="readonly" value="${name}">
        </div>
          <div class="span3">
              <label>应收款：<span style="font-size: 12px;">Receivables</span></label>
              <input id="accountsreceivableid" name="accountsreceivable" type="text" onchange="onchangeOne()" style="width:97%;height:27px;float:left;" >
              <div id="divaccountsreceivable">
                  <label class="yansered" style="margin-top:12px;">*</label>
              </div>
          </div>
          <div class="span3">
              <label>支付方式<span style="font-size: 12px;">Payment method</span></label>
              <select name="payWayID" style="height:26px;width:100%;">
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
              <select  name="currency" style="width: 100%;height:27px;">
                  <option value="1">人民币(RMB)</option>
                  <option value="0">菲律宾币(PHP)</option>
              </select>
          </div>
        </div>
      </div>
  <!----------------- ------------------------------------------------------------------------------------------------------------- -->
  <div class="span12">
      <div class="row-fluid">
          <div class="span3">
              <label>是否到账：<span style="font-size: 12px;">Arrival account</span></label>
              <select  name="isdao" style="width: 100%;height:27px;">
                  <option value="2">是(yes)</option>
                  <option value="1">否(no)</option>
              </select>

          </div>
          <div class="span3">
              <label>入住时间：<br/><span style="font-size: 12px;">check-in time</span></label>
              <input id="checkintimeId" name="checkintime"  style="width:97%; height:27px;float:left;" class="Wdate" type="text"
                     onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc})" onchange="onchangeOne()"/>
              <div id="divcheckintime">
                  <label class="yansered" style="margin-top:12px;">*</label>
              </div>
          </div>
          <div class="span3">
              <label>退房时间：<br/><span style="font-size: 12px;">check-out time</span></label>
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
                <div class="span2">
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
                    <label>剩余床位数：<span style="font-size: 12px;">Number of remaining beds</span></label>
                    <input id="already" name="already" readonly class="widthone" type="text"/>
                </div>
                <div class="span3">
                    <label>入住人数：<span style="font-size: 12px;">Check-in number</span></label>
                    <input id="peopleid" name="people" style="height:26px;float:left;" class="widthone" type="text"onblur="peopleYZ(this.value)"/>
                    <div id="divFour">
                        <label class="yansered" style="margin-top:12px;">*</label>
                    </div>
                </div>
            </div>
        </div>


    </form>
    
    
  
  
    <div class="span12">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableidOne">
	      <thead class="theadone">
	        <tr>
                <th >选择<br/><span style="font-size: 12px;">choice</span></th>
                <th >房间号<br/><span style="font-size: 12px;">room number</span></th>
                <th >客房等级<br/><span style="font-size: 12px;">Guest room rating</span></th>
                <th >床位数<br/><span style="font-size: 12px;">Number of beds</span></th>
                <th >标准客房/天<br/><span style="font-size: 12px;">Standard room/day</span></th>
                <th >供应商<br/><span style="font-size: 12px;">Supplier</span></th>
              <th>剩余床位数<br/><span style="font-size: 12px;">Number of remaining beds</span></th>
	      </thead>
	      <tbody id="tbodyOne">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="idOne" value=""></td>
		          <td></td>
		          <td></td>
		          <td id="acount"></td>
		          <td></td>
                    <td></td>
                    <td></td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    
    
     <div class="modal hide fade" id="xuanzhe" style="margin-top:10px;">
       <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
	    <div class="row-fluid">
		   <div class="span8">
               <label class="labelroomnumber">房间号：<br/><span style="font-size: 12px;">Room number</span></label>
			   <input id="txtnameid" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
               <label class="labelroomnumber">选择供应商：<br/><span style="font-size: 12px;">Supplier</span></label>
               <select name="supplier" id="supplierid">
                   <option value="" selected="selected">全部(all)</option>
                   <c:forEach items="${listS}" var="item">
                       <option value="${item.id}">
                               ${item.supplierName}</option>
                   </c:forEach>
               </select>

               <div class="input-append">
			      <button onclick="selectBedRoom()" class="btn-success textone" style="margin-left:-6px;height:26px;"><li class="icon-search icon-white"></li>search</button>
			   </div>
	       </div>

	       <div class="span4">
	          <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()">
                  <li class="icon-plus icon-white"></li>确定选择(Definite choice)</button>
	       </div>
	    </div>
	   <div class="dgvone" style="width:93%; margin-top:10px;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <  <th >选择<br/><span style="font-size: 12px;">choice</span></th>
                <th >房间号<br/><span style="font-size: 12px;">room number</span></th>
                <th >客房等级<br/><span style="font-size: 12px;">Guest room rating</span></th>
                <th >房态<br/><span style="font-size: 12px;">Room state</span></th>
                <th >床位数<br/><span style="font-size: 12px;">Number of beds</span></th>
                <th >标准客房/天<br/><span style="font-size: 12px;">Standard room/day</span></th>
                <th >供应商<br/><span style="font-size: 12px;">Supplier</span></th>
                <th>剩余床位数<br/><span style="font-size: 12px;">Number of remaining beds</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="idTwo" ></td>
		          <td></td>
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
    
    
    
    
    
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
   
 
  
   var shijian="";
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
        }

   
   var roomIdShuZu=[];
   
   function confirmfunction(){
     /*  roomIdShuZu.empty(); */

      var chk_value=[];
      var tableOne=document.getElementById("tbodyOne");
      var table=document.getElementById("tbodyTwo");
      var selectedIndex="";
      var roomNumber=[];
      var roomLevel=[];
      var roomAmount=[];
      var roomPrice=[];
      var supplierid=[];
       var surplusacount=[];
      $('#tbodyOne').empty();
	  $('input[name="idTwo"]:checked').each(function(){             // 遍历获取input被checked的
	   	chk_value.push($(this).val());                             // 获取选中的ID
	    roomIdShuZu=chk_value;
	    selectedIndex=this.parentNode.parentNode.rowIndex;
	    roomNumber.push(table.rows[selectedIndex-1].cells[1].innerHTML);
	    roomLevel.push(table.rows[selectedIndex-1].cells[2].innerHTML);
	    roomAmount.push(table.rows[selectedIndex-1].cells[4].innerHTML);
	    roomPrice.push(table.rows[selectedIndex-1].cells[5].innerHTML);
	    supplierid.push(table.rows[selectedIndex-1].cells[6].innerHTML);//供应商ID
          surplusacount.push(table.rows[selectedIndex-1].cells[7].innerHTML);
         // document.getElementById("already").innerHTML=table.rows[selectedIndex-1].cells[7].innerHTML;
	  });
   	 for(var i=0;i<chk_value.length;i++){
        var tr = tableOne.insertRow(-1);            // FireFox必须使用-1这个参数
       
        var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
        var tdroomNumber = tr.insertCell(-1);
        var tdguestRoomLevelName = tr.insertCell(-1);
        var tdroomAmount = tr.insertCell(-1);
        var tdstandardPriceDay = tr.insertCell(-1);
        var supplieriD=tr.insertCell(-1);
         var surplusAcount=tr.insertCell(-1);

        tdcheckbox.innerHTML = "<input type='radio' name='idOne' value='"+chk_value[i]+"'>";
        tdroomNumber.innerHTML = roomNumber[i];
        tdguestRoomLevelName.innerHTML = roomLevel[i];
        tdroomAmount.innerHTML =roomAmount[i];
        tdstandardPriceDay.innerHTML =roomPrice[i];
        supplieriD.innerHTML=supplierid[i];
         surplusAcount.innerHTML=surplusacount[i];
         if(chk_value!="") {
             document.getElementById("already").value = surplusacount[0];
         }
	 }

   }

   function addfunction(){
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
     }else if (document.getElementById("accountsreceivableid").value==""){
         alert("应付款不能为空"+' \n '+"Payable cannot be empty");
         document.getElementById("accountsreceivableid").focus();
         return false;
     }else if (document.getElementById("peopleid").value==""){
         alert("住房人数不能为空不能为空"+' \n '+"Housing number cannot be empty");
         document.getElementById("peopleid").focus();
         return false;
     }
      if(document.getElementById("tbodyOne").rows.length==0){
           alert("还没有添加房间哦！请选择房间"+' \n '+"No room has been added yet!");
           return false;
       }
       if(document.getElementById("orderID").value==""){
           alert("订单号必填！"+' \n '+"Order number is required");
           return false;
       }


       var acount=document.getElementById("peopleid").value;
     var id= document.getElementById("lvkeorteamId").value;
     var teamId= document.getElementById("teamId").value;

     form1.action="${ctx}/Predetermine/addBed.do?id="+id+"&type="+teamId+"&roomIdShuZu="+roomIdShuZu+"&people="+acount;
    form1.submit();
   }
   
   function lastStep(){
     parent.document.getElementById('Mainid').src='${ctx}/Predetermine/tolist.do';
   }
   
   

   //验证
   function onchangeOne(){
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
           if (is.test(codeNumber)==false) {
               alert("订单号只能有数字组成"+' \n '+"Order number can only be composed of numbers");
               document.getElementById("orderID").value="";
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

   function selectBedRoom() {
       var tbody = document.getElementById("tbodyTwo");
       var name=document.getElementById("txtnameid").value;
       var supplier=document.getElementById("supplierid").value;
       var i=0;
       $("#tbodyTwo").empty();                              // 删除 tbody 所有行
       $.ajax({
           cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
           type: "POST",                                           //上面3行都是必须要的
           url: '${ctx}/Predetermine/selectBedRoom.do',       //地址 type 带参数
           data:"roomNumber="+name+"&supplierid="+supplier,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
//        dataType:"json",                                       // json 数据类型提交
           async:false,                                          // 是否 异步 提交
           success: function (result) {
               for (var key in result) {
                   i++;
                   var item = result[key];
                   var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                   var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                   var tdroomNumber = tr.insertCell(-1);
                   var tdguestRoomLevelName = tr.insertCell(-1);
                   var tdroomName = tr.insertCell(-1);
                   var tdroomAmount = tr.insertCell(-1);
                   var tdbedDayPrice = tr.insertCell(-1);
                   var supplierName = tr.insertCell(-1);
                   var surplusAcount=tr.insertCell(-1);

                   tdcheckbox.innerHTML = "<input type='checkbox' name='idTwo' value='"+item.id+"'>";
                   tdroomNumber.innerHTML = item.roomNumber;
                   tdguestRoomLevelName.innerHTML = item.guestRoomLevelName;
                   tdroomName.innerHTML =item.roomName;         //中间这个是数据
                   tdroomAmount.innerHTML =item.roomAmount;
                   tdbedDayPrice.innerHTML ='￥'+item.bedDayPrice;
                   supplierName.innerHTML =item.supplierName;
                   surplusAcount.innerHTML=item.surplusAcount;
               }
               if(i==0){
                   alert("很抱歉！没有查找到你要找的数据"+' \n '+"I'm sorry!No data found");
               }
           },
           error: function(data) {

           }
       });
   }

   function peopleYZ(value) {
       var already=document.getElementById("already").value;
       var acount=document.getElementById("peopleid").value;
       if (acount>already){
           alert("入住人数不能大于剩余床位数！"+' \n '+"he number of check-in persons cannot be greater than the number of remaining beds");
       }
   }
 </script>
   
  </body>
</html>
