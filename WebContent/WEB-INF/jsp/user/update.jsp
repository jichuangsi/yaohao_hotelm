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
        <h3 style="text-align: center;">操作员修改 Operator modification</h3>
        
      </div>
    </div>
    
    <form action="${ctx}/User/update.do" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <input type="hidden" name="id" value="${list.id}" />
	    <div class="span12">
	      <div class="row-fluid">
			  <div class="span3">
				  <label>姓名：<br/><span style="font-size: 12px">name</span> </label>
				  <input id="userName" name="userName" type="text" onblur="YZ(this.value)"
						 style="width:97%;height:26px;float:left;" onchange="onchangeOne()" value="${list.userName}">
				  <div id="divOne" style="float:right;" hidden>
					  <label class="yansered" style="margin-top:7px;">*</label>
				  </div>
			  </div>
		     <div class="span3">
		        <label>密码：<br/><span style="font-size: 12px">password</span></label> <%--value="${list.password}"--%>
		        <input id="password" name="password" type="password" value="${list.password}"
		        style="width:97%;height:26px;float:left;" onchange="onchangeOne()">
		        <div id="divTwo" style="float:right;" hidden>
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		      </div>
			  <div class="span3">
				  <label>确认密码：<br/><span style="font-size: 12px">Confirm password</span></label>
				  <input id="repassword" name="repassword" type="password" value=""
						 style="width:97%;height:26px;float:left;" onchange="onchangeOne()">
				  <div id="divTwo2" style="float:right;" hidden>
					  <label class="yansered" style="margin-top:7px;">*</label>
				  </div>
			  </div>
			  <div class="span3">
				  <label>等级：<br/><span style="font-size: 12px">Grade</span></label>
				  <select name="grade" id="gradeid">
					  <c:if test="${list.grade==1}">
						  <option value="1" selected>超级<span style="font-size: 12px">super</span></option>
						  <option value="2">普通<span style="font-size: 12px">ordinary</span></option>
					  </c:if>
					  <c:if test="${list.grade==2}">
						  <option value="2" selected>普通<span style="font-size: 12px">ordinary</span></option>
						  <option value="1">超级<span style="font-size: 12px">super</span></option>
					  </c:if>

				  </select>
			  </div>
	    </div>
		</div>
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>modify</button>
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
        var password=document.getElementById("password").value;
        var repassword=document.getElementById("repassword").value;
	    if(document.getElementById("userName").value==""){
	       alert("姓名  是必填项，不能为空哦！"+' \n '+"Name is required");
	       document.getElementById("userName").focus();
	       return false;
	    }else if(document.getElementById("password").value==""){
	       alert("密码  是必填项，不能为空哦！"+' \n '+"Password is required");
	       document.getElementById("password").focus();
	       return false;
	    }else if(document.getElementById("userName").value.length>10){
	     alert("你输入的   姓名  太过长了  请不要超出  10  位长度"
             +' \n '+"The name you entered is too long. Please don't exceed 10 digits.");
	     document.getElementById("userName").focus();
	     return false;
        }else if(document.getElementById("password").value.length>12 || document.getElementById("password").value.lengt<4){
	     alert("你输入的   密码在4-12个字符之间"+' \n '+"Password between 4-12 characters");
	     document.getElementById("password").focus();
	     return false;
        }else if (password!=repassword) {
            alert("两次输入密码不一致"+' \n '+"The two passwords are inconsistent");
            document.getElementById("password").focus();
            document.getElementById("repassword").focus();
            return false;
        }else{
	       return true;
	    }
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/User/tolist.do';
   }
   
   function onchangeOne(){

     //姓名
     if(document.getElementById("userName").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
     //密码
     if(document.getElementById("password").value!=""){
       document.getElementById("divTwo").style.display="none";
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }

   }
   
   
   function YZ(value){
       var Name=document.getElementById("userName").value;
     if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/User/YZ.do',       //地址 type 带参数
          data:"userName="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(Name==document.getElementById("userName").value){
                
              }else if(result>=1){                                  
                   alert("改名字已存在！"+' \n '+"Name already exists");                     //提示框
                   document.getElementById("userName").value="";     //这个id的文本框的值 将会清空
                   document.getElementById("userName").focus();      // 给这个id的文本框提供焦点
                   document.getElementById("divTwo").style.display="block"; //显示
              }else{
	          document.getElementById("userName").value=Name;
           }
          },
          error: function(data) { }
      });
     }
   }


 </script>
   
  </body>
</html>
