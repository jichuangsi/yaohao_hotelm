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

    .margin-top-one{
      margin-top: -10px;
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
        <h3 style="text-align: center;">旅客新增  New passenger</h3>
        
      </div>
    </div>
    
    <form action="${ctx}/Passenger/add.do" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
				 <label>姓名：<br/><span style="font-size: 12px;">Name</span></label>
		        <input id="nameId" name="name" type="text" style="width:97%;height:27px;float:left;" onchange="onchangeOne()" onblur="YZ();">
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		      </div>
		     <div class="span3">
		        <label>性别：<br/><span style="font-size: 12px;">Gender</span></label>
		        <select name="genderID" style="width:100%;height:27px;">
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
						 style="width:100%;height:27px;"  placeholder="只能为手机号码" onchange="onchangeOne()" onblur="YZ();">
			  </div>
	    </div>

	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <label style="float: left;">备注：<br/><span style="font-size: 12px;">Remarks</span></label>
	      <input name="remarks" type="text" style="width:100%;height:27px;"> 
	    </div>
	    
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>save</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      
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
    function verify(){
	    if(document.getElementById("nameId").value==""){
	       alert("姓名  是必填项，不能为空哦！"+' \n '+"Name is required");
	       document.getElementById("nameId").focus();
	       return false;
	    }else if(document.getElementById("nameId").value.length>10){
	     alert("你输入的   姓名  太过长了  请不要超出  10  位长度"+' \n '+"The name is too long");
	     document.getElementById("nameId").focus();
	     return false;
        }else if(document.getElementById("remarks").value.length>50){
	     alert("你输入的   备注  太过长了  请不要超出  50 位长度"+' \n '+"The note is too long,Please do not exceed the length of 50 digits");
	     document.getElementById("remarks").focus();
	     return false;
        } else{
	       return true;
	    }
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Passenger/tolist.do';
   }
   
   function onchangeOne(){
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


    function YZ(){
        var name=document.getElementById("nameId").value;
        var number=document.getElementById("contactPhoneNumberId").value;
        console.log(11);
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Passenger/YZ.do',       //地址 type 带参数
                data:"name="+name+"&number="+number,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result>=1){
                        alert("次客户已存在！"+' \n '+"Secondary customer already exists");                     //提示框
                        document.getElementById("contactPhoneNumberId").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("contactPhoneNumberId").focus();      // 给这个id的文本框提供焦点
                        document.getElementById("nameId").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("divOne").style.display="block"; //显示
						return false;
                    }else {
                        return false;
                    }
                },
                error: function(data) {  }
            });
    }
 </script>
   
  </body>
</html>
