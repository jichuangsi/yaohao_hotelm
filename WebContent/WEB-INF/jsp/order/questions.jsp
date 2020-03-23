<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>酒店常见问题</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
		<link rel="stylesheet" href="${ctx}/css/index.css"/>
		<link rel="stylesheet" href="${ctx}/css/ht.css"/>
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>
	</head>
	<style>
	.gz{
		    padding: 20px;
		    line-height: 30px;
		    font-size: 16px;
	}
	</style>
	<body>
		<div class="x-body">
			<div class="layui-row">
				<div class="layui-col-md6 gz layui-col-xs12 layui-col-md-offset1">
					<h1 style="margin-bottom: 20px;">Hotel style apartment</h1>
					<c:forEach items="${list}" var="item">
						${item.id}.${item.title}</br>
					</c:forEach>
					<%--1. Address: Birch Tower, 1622 Jorge Bocobo Street, Malate, Manila </br>
					2. SECURITY DEPOSIT of Php2,000.00 in CASH will be collected upon check-in. The deposit will be refunded upon check-out.</br>
					3. Our mobile number is +639159，421460</br>
					4. Upon arrival at the LOBBY AREA, please ask the LOBBY SECURITY to call our office at Unit 3308 via intercom.</br> 
					Our office hours are from 9:00-18:00. After office hours, please call Unit 2811.
					5. Our staff will meet you at the lobby for registration, where you will be given an ENTRANCE ACCESS CARD.</br>
					6.The 9 level Pool is open from 9am-7pm</br>
					Sauna is open from 4pm-7pm</br>
					Gym is open from 7am-10pm</br>
					7.Nearby shopping mall parking lot，60 yuan for three hours，Then 10 yuan an hour。</br>
					Roadside parking space 40 yuan overnight</br>--%>
				</div>
				<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
					<div class="layui-btn layui-btn-sm layui-btn-normal" onclick="addQuestion()" lang>add</div>
				</div>
			</div>
			
		</div>
		<script>
            layui.use('element',function(){
                var element=layui.element;

                element.render();
			    window.addQuestion=function () {
                    layer.prompt({
                        formType: 2,
                        value: '',
                        title: '请输入值',
                        area: ['450px', '300px'] //自定义文本域宽高
                    }, function (value, index, elem) {
                        console.log(value.length)
						console.log(value.trim().length)
						if (value==null || value.trim().length==0){
                            alert("格式不正确")
							return;
						}
                        $.ajax({
                            cache: false,
                            type: "post",
                            url: "${ctx}/Order/addquestion.do",
                            data:"title="+value,
                            async: false,
                            success: function(res) {
                                window.location="${ctx}/Order/question.do"
                            }
						})
                    })
                }
            })

		</script>
	</body>
	
</html>
