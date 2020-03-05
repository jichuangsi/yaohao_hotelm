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
    float:left;
    }
    
    .inputtwo{
      width:46.8%;
    }
    
    .inputthree{
      width:47.8%;
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
    
    .yansered{
      color:red;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">平台修改Platform modification</h3>
      </div>
    </div>
    
    <form action="${ctx}/Platform/update.do" method="post" onsubmit="return verify()">
	    <input type="hidden" name="id" value="${listPo.id}">
	    <div class="span12">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber">平台名称：<br/><span style="font-size: 12px;">Platform name</span></label>
			      <input id="commodityNameId" name="name" class="textone inputone" value="${listPo.name}"
			       style="height:26px;" type="text" onchange="onchangeOne()" onblur="YZ(this.value)">
			      <div id="divOne" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			       </div>
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
    var Name=document.getElementById("commodityNameId").value;
 
    function verify(){
    if(document.getElementById("commodityNameId").value==""){
	     alert("平台名称  是必填项，不能为空哦！"+' \n '+"Platform name is required");
	     document.getElementById("commodityNameId").focus();
	     return false;
      }else{
         return true;
      }
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Platform/tolist.do';
   }
   
   function onchangeOne(){
   //平台名称
   if(document.getElementById("commodityNameId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
   //销售价格
   }
   
   
   function YZ(value){
     if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/Platform/YZ.do',       //地址 type 带参数
          data:"name="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(Name==document.getElementById("commodityNameId").value){
              
              }else if(result>=1){                                  
                   alert("已存在此平台名称，请另取平台名称！"+' \n '+"This platform name already exists");                     //提示框
                   document.getElementById("commodityNameId").value="";     //这个id的文本框的值 将会清空
                   document.getElementById("commodityNameId").focus();      // 给这个id的文本框提供焦点
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
