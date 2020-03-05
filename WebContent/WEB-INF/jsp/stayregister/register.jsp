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
   
   .theadone{
     background-color: #CCFF99;
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
    }
    
    .inputtwo{
      width:46.8%;
    }
    
    .inputthree{
      width:46.8%;
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
    
     @media(min-width:731px) and (max-width:767px){
      .inputthree{
      width: 50.5%;
    }
    }
    
    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 49.2%;
    }
    }
    
    
     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 47.5%;
    }
    }
    
    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 46%;
    }
    }
    
     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 44%;
    }
    }
    
     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 40%;
    }
    }
    .span12{
      width:95%;
    }
    
    .yansered{
      color:red;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">旅客登记<span style="font-size: 12px">Passenger registration</span> </h3>
        
      </div>
    </div>
    <a href="#lvke" style="margin-left:20px;margin-top:10px;" data-toggle="modal" class="btn btn-info btn-small" onclick="souSuo()">
		<li class="icon-plus icon-white"></li>选择旅客<span style="font-size: 12px">Choice of passengers</span></a>
    <form id="form1" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    
	    <input id="lvKeId" name="lvKeID" type="hidden">                                       <!-- 旅客ID -->
	    <input id="stayRegisterId" name="stayRegisterID" type="hidden" value="${stayRegisterId}">     <!-- 住宿登记ID -->
	    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>房间号：<span style="font-size: 12px">room Number</span></label>
		        <input type="text" style="width:100%;height:25px;" readonly="readonly" value="${roomNumber}"> 
		     </div>
		     <div class="span3">
		        <label>姓名：<span style="font-size: 12px">name</span></label>
		        <input id="nameId" name="name" onblur="nameOne(this.value)" 
		        type="text" style="width:97%;height:27px;" onchange="onchangeOne()">
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>
		     <div class="span3">
		        <label>性别：<span style="font-size: 12px">gender</span></label>
		        <select id="genderId" name="genderID" onchange="gender(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listGender}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==31}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

		<!--   ------------------------------------------------------------------------------------------------------------   -->
	    	    <div class="span12">
	      <div class="row-fluid">
		    <div class="span3">
		   	   <label class="labelroomnumber" style="font-size:15px">联系电话：<span style="font-size: 12px">Contact number</span></label>
	           <input id="contactPhoneNUmberId" name="contactPhoneNUmber" onblur="contactPhoneNUmberOne(this.value)" 
	           style="width:100%;height:27px;" type="text" onchange="onchangeOne()">
			</div>
			  <c:if test="${predetermineID==null}">
			  <div class="span3">
				  <label class="labelroomnumber" style="font-size:15px">平台名称：<span style="font-size: 12px">Platform name</span></label>
				  <select id="platformId" name="platformID" onchange="platformIDOne(this.value)" style="width:100%;height:27px;">
					  <c:forEach items="${platformPoList}" var="item">
						  <option value="${item.id}"selected="selected">
								  ${item.name}
						  </option>
					  </c:forEach>
				  </select>
			  </div>
			  <div class="span3">
				  <label class="labelroomnumber" style="font-size:15px">订单号：<span style="font-size: 12px">Order number</span></label>
				  <input id="codeNumberId" name="codeNumber" onblur="codeNumberOne(this.value)"
						 style="width:100%;height:27px;" type="text" onchange="onchangeOne()">
			  </div>
			  </c:if>
			  <c:if test="${predetermineID!=null}">
				  <div class="span3">
					  <label class="labelroomnumber" style="font-size:15px">订单号：<span style="font-size: 12px">Order number</span></label>
					  <input id="codeNumberId" name="codeNumber"style="width:100%;height:27px;" type="text" value="${orderID}">
					  <input id="predetermineID" name="predetermineID"style="display: none" type="text" value="${predetermineID}">
				  </div>
			  </c:if>
	      </div>
	    </div>
	    <div class="span12">
	      <label style="float: left;">备注：Remarks</label>
	      <input id="remarksId" name="remarks" onblur="remarksOne(this.value)" type="text" style="width:100%;height:27px;"> 
	    </div>
	    
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="button" onclick="tijiao()">
				   	 <li class="icon-check icon-white"></li>save</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      
      <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：<span style="font-size: 12px">Name of passenger</span></label>
			   <input id="txtnameid" name="txtname" class="textone" style="width:55%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="souSuo()" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>search</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()">
				  <li class="icon-plus icon-white"></li>确定选择<span style="font-size: 12px">Definite choice</span></button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择<br/><span style="font-size: 12px">choice</span></th>
	          <th >姓名<br/><span style="font-size: 12px">name</span></th>
	          <th >性别<br/><span style="font-size: 12px">gender</span></th>
	          <th >联系电话<br/><span style="font-size: 12px">Contact number</span></th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list}" var="item">
		        <tr>
		          <td><input type="radio" name="id" value="${item.id}"></td>
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
      
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>cancel</button>
		   </div>
	     </div>
      </div>
       
    </div>
  </div>

 
 <script type="text/javascript">
    var Name="";
    function verify(){
   }
   
    function deletefunction(){
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+LvKeLeiXingId;
   }
   
   
   
   function souSuo(){
     var tbody = document.getElementById("tbody");
     var name=document.getElementById("txtnameid").value;
     var i=0;
     $("#tbody").empty();
     $.ajax({      
         cache:false,
         type: "POST",
         url: '${ctx}/StayRegister/selectPassenger.do',
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
                
                tdcheckbox.innerHTML = "<input type='radio' name='id' value='"+item.id+"'>";
                tdName.innerHTML = item.name;
                tdGender.innerHTML = item.genderName;
                tdPhone.innerHTML=item.contactPhoneNumber;
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据"+' \n '+"\n" +
                  "I'm sorry! No data found");
            }               
          },
          error: function(data) {
           }
     });
   }
   
   var xingMing="";
   var xingBie="";
   var lianXiDianHua="";
   var beiZhu="";
   function confirmfunction(){
     var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个用户"+' \n '+"Only one user can be selected");
		}else{
	        $.ajax({      
	         cache:false,
	         type: "POST",
	         url: '${ctx}/StayRegister/confirmPassenger.do',
	         data:"id="+chk_value,
	         async:false,
	         success: function (result) {
	             document.getElementById("divOne").style.display="none";
	            document.getElementById("lvKeId").value=result.id;
	            document.getElementById("nameId").value=result.name;
	            document.getElementById("genderId").value=result.genderID;
	            document.getElementById("contactPhoneNUmberId").value=result.contactPhoneNumber;
	            document.getElementById("remarksId").value=result.remarks;

	            document.getElementById("genderId").style.color='blue';
	            xingMing=result.name;
	            xingBie=result.genderID;
	            lianXiDianHua=result.contactPhoneNumber;
	            beiZhu=result.remarks;
	            
	            if(result.name!=""){
	              document.getElementById("nameId").style.color='blue';
	            }else{
	             document.getElementById("nameId").style.color='black';
	            }
	            if(result.contactPhoneNumber!=""){
	              document.getElementById("contactPhoneNUmberId").style.color='blue';
	            }else{
	              document.getElementById("contactPhoneNUmberId").style.color='black';
	            }
	            if(result.remarks!=""){
	              document.getElementById("remarksId").style.color='blue';
	            }else{
	              document.getElementById("remarksId").style.color='black';
	            }
	          },
	          error: function(data) {
	           }
	         });		 
		}
	}else{
	  alert("你还没有选择旅客哦！"+' \n '+"You haven't chosen a passenger yet");
	}
   }
   
   function nameOne(value){
     if(value!=xingMing){
       document.getElementById("nameId").style.color='black';
     }else{
       document.getElementById("nameId").style.color='blue';
     }
   }

            
   function contactPhoneNUmberOne(value){
     if(value!=lianXiDianHua){
       document.getElementById("contactPhoneNUmberId").style.color='black';
     }else{
       document.getElementById("contactPhoneNUmberId").style.color='blue';
     }
   }
   
   function remarksOne(value){
     if(value!=beiZhu){
       document.getElementById("remarksId").style.color='black';
     }else{
       document.getElementById("remarksId").style.color='blue';
     }
   }
   
   
    function gender(value){
     if(value!=xingBie){
       document.getElementById("genderId").style.color='black';
     }else{
       document.getElementById("genderId").style.color='blue';
     }
   }
   

   
   function tijiao(){
	    if(document.getElementById("nameId").value==""){
	       alert("姓名  是必填项，不能为空哦！"+' \n '+"Name is required");
	       document.getElementById("nameId").focus();
	       return false;
	    }else if(document.getElementById("contactPhoneNUmberId").value==""){
	       alert("电话号码  是必填项，不能为空哦！"+' \n '+"Phone number is required");
	       document.getElementById("contactPhoneNUmberId").focus();
	       return false;
	    }else if(document.getElementById("nameId").value.length>10){
	     alert("你输入的   姓名  太过长了  请不要超出  10  位长度"+' \n '+"The name is too long. Please don't exceed 10 digits");
	     document.getElementById("nameId").focus();
	     return false;
        }else if(document.getElementById("remarksId").value.length>50){
	     alert("你输入的   备注  太过长了  请不要超出  50 位长度"+' \n '+"Note too long, please do not exceed 50 digits");
	     document.getElementById("remarksId").focus();
	     return false;
        }else if (document.getElementById("codeNumberId").value==""){
            alert("订单号  是必填项，不能为空哦！"+' \n '+"Order number is required");
            document.getElementById("codeNumberId").focus();
            return false;
		}
      var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
      form1.action="${ctx}/StayRegister/register.do?LvKeLeiXingId="+LvKeLeiXingId;
      form1.submit();
   }
   
   
   
   
   function onchangeOne(){
     //姓名
     if(document.getElementById("nameId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }

     //联系电话 
     if(document.getElementById("contactPhoneNUmberId").value!=""){
        if(!document.getElementById("contactPhoneNUmberId").value.trim().match("^[1][0-9]{10}$"))
	       {
	          document.getElementById("contactPhoneNUmberId").focus();
	          document.getElementById("contactPhoneNUmberId").value="";
	          alert("你输入的手机号码有误，请重新输入！"+' \n '+"The mobile number you entered is wrong");
	       }
     }
   }

		//订单号判重
    function codeNumberOne(value){
        var codeNumber=document.getElementById("codeNumberId").value.trim();
        var is= /^\d+$/;
        if (codeNumber!="") {
            if (is.test(codeNumber) == false) {
                alert("订单号只能有数字组成"+' \n '+"Order number can only be composed of numbers");
                document.getElementById("codeNumberId").value = "";
                return;
            }
        }
        if(value!=""){
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/StayRegister/codeNumberYZ.do',       //地址 type 带参数
                data:"codeNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result>=1){
                        alert("订单号重复！"+' \n '+"Duplicate order number");                     //提示框
                        document.getElementById("codeNumberId").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("codeNumberId").focus();      // 给这个id的文本框提供焦点
                        document.getElementById("divOne").style.display="block"; //显示
                    }else{ }
                },
                error: function(data) { }
            });
		}
  
	}

 </script>
   
  </body>
</html>
