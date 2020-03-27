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
	p,.textarea{
		white-space:normal;
		word-wrap : break-word;
		width:100%;
	}
		#addType_apar{
			display: none;
		}

	.textarea{
		font-size: 16px;
		line-height: 24px;
		padding: 2px;
		overflow-x: hidden;
		overflow-y: auto;
		width:90%;
		height: 200px;
	}
	</style>
	<body>
		<div class="x-body ">
			<div class="layui-row ">
				<div class="layui-col-md6 gz layui-col-xs12 layui-col-md-offset1 ">
					<h1 style="margin-bottom: 20px;">Hotel style apartment</h1>
						<c:forEach items="${list}" var="item">
							<p class="divs "onclick="updates(${item.id})">
								${item.id}.${item.title}</p>
						</c:forEach>

				</div>
				<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
					<div class="layui-btn layui-btn-sm layui-btn-normal" onclick="addQuestion()" lang>add</div>
				</div>
			</div>
			
		</div>

		<!--新增消费类型部分 -->
		<div id="addType_apar" class="layui-fluid">
			<form class="layui-form" autocomplete="off"  lay-filter="testss">
				<div class="layui-form-item">
					<label class="layui-form-label"><span lang>type</span>：</label>
					<div class="layui-input-block widths">
						<input type="hidden" name="id" value="">
						<input type="hidden" name="hotelm" value="">
						<textarea class="textarea" name="title" lay-verify="required"  autoHeight="true" ></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<div class="layui-btn" lay-submit lay-filter="addType_Pwd" lang>Submission</div>
					</div>
				</div>
			</form>
		</div>
		<script>
            layui.use(['form','element'],function(){
                var form = layui.form,
					element=layui.element;


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


                function type() {
                    index = layer.open({
                        type: 1,
                        area: ['40%', '50%'],
                        anim: 2,
                        title: '修改问题',
                        maxmin: true,
                        shadeClose: true,
                        content: $("#addType_apar")
                    });
                }

                window.updates=function (value) {
                    var list;
                    $.ajax({
                        cache: false,
                        type: "post",
                        url: "${ctx}/Order/getquestion.do",
                        data:"id="+value,
                        async: false,
                        success: function(res) {
                            list=res;
                            form.val('testss', {
                                "id": list.id,
                                "title": list.title,
                                "hotelm": list.hotelm
                            });
                            type();
                            form.render();

                        }
                    })
                }

                form.on('submit(addType_Pwd)', function (obj) {
                    var param = obj.field;
                    console.log(param);
                    $.ajax({
                        cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "POST",                                           //上面3行都是必须要的
                        url: '${ctx}/Order/upquestion.do',       //地址 type 带参数
                        data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                        async: false,                                          // 是否 异步 提交
                        success: function (result) {                          // 不出现异常 进行立面方
                            if (result != 1) {
                                alert("失败！" + ' \n ' + "Failed");                     //提示框
                            } else {
                                alert("成功！" + ' \n ' + "succeeded");
                                window.location="${ctx}/Order/question.do";
                            }
                        }
                    })

                });
            })

			
			
		</script>
	</body>
	
</html>
