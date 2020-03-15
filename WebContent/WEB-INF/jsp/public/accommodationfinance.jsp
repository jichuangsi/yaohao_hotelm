<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>房型列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>
    <%--<link rel="stylesheet" href="../lib/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/ht.css" />
    <link rel="stylesheet" href="../css/administration.css" />
    <link rel="stylesheet" href="../lib/layui/css/modules/layui-icon-extend/iconfont.css" />
    <script src="../lib/js/jquery.min.js"></script>
    <script src="../lib/layui/layui.all.js"></script>--%>

    <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <link rel="stylesheet" href="${ctx}/css/administration.css"/>
    <link rel="stylesheet" href="${ctx}/css/ht.css"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/layui/layui.all.js"></script>

</head>
<style>
    body {
        background-color: gainsboro;
    }

    .layui-unselect {
        margin-bottom: 0.5rem;
    }

    /* 	.layui-colla-item{
            margin-top: 0.625rem;
        } */
    .layui-collapse {
        margin-bottom: 1.25rem;
    }

    #add {
        display: none;
        margin-top: 10px;
    }

    .bj {
        background-color: deepskyblue;
        color: white;
    }
</style>
<body>

<div class="layui-row">
    <div class="layui-col-xs12 layui-col-md6 layui-col-md-offset3">
        <div class="layui-row date">
            <div class="layui-col-xs5">
                <div class="layui-row grid-demo">
                    <div class="layui-col-xs4 todate bj">
                        <span>周四</span>
                        <h1>5</h1>
                        <span>2020-03</span>
                    </div>
                    <div class="layui-col-xs4 todate">
                        <span>周五</span>
                        <h1>6</h1>
                        <span>2020-03</span>
                    </div>
                    <div class="layui-col-xs4 todate">
                        <span>周六</span>
                        <h1>7</h1>
                        <span>2020-03</span>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs5">
                <div class="layui-row grid-demo">
                    <div class="layui-col-xs4 todate">
                        <span>周四</span>
                        <h1>5</h1>
                        <span>2020-03</span>
                    </div>
                    <div class="layui-col-xs4 todate">
                        <span>周四</span>
                        <h1>5</h1>
                        <span>2020-03</span>
                    </div>
                    <div class="layui-col-xs4 todate">
                        <span>周四</span>
                        <h1>5</h1>
                        <span>2020-03</span>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs2" style="margin-top: 20px;">
                选择</br>
                日期
            </div>
        </div>

        <div class=" layui-row ht-box">
            <div class="layui-row layui-form">
                <div class="layui-collapse">
                    <c:forEach items="${list.result}" var="item">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">
                                <div class="layui-col-xs4 " style="padding-left: 15px;">
                                    <h2>${item.roomNumber}</h2>
                                </div>
                                <div style="float: right;">
                                    <input type="checkbox" name="zzz" lay-skin="switch" lay-text="I|O">
                                </div>
                            </h2>
                            <div class="layui-colla-content layui-show">
                                <div class="layui-row">
                                    <input type="hidden" name="roomNumber" value="${item.roomNumber}">
                                    <input type="hidden" name="roomId" value="${item.roomId}">
                                    <div class="">${item.supplierName}-${item.roomNumber}</div>
                                </div>
                                <div class="layui-row">
                                    <div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">剩余
											<c:if test="${item.remainingBeds==null}">${item.roomAmount}</c:if>
											<c:if test="${item.remainingBeds!=null}">${item.remainingBeds}</c:if>
											间</span></div>
                                    <c:if test="${item.remainingBeds!=0}">
                                        <div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
                                            <div class="layui-btn layui-btn-sm layui-btn-normal toadd">
                                                新增
                                            </div>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<div id="add" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="test">
        <div class="layui-form-item">
            <label class="layui-form-label">订单：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="id"/>
                <input type="text" name="orderNumber" id="order" class="layui-input " lay-verify="required" onblur="order()">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">平台：</label>
            <div class="layui-input-block widths">
                <select name="platformId" lay-verify="required">
                    <c:forEach items="${slist}" var="item">
                        <option value="${item.id}">${item.supplierName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">供应商：</label>
            <div class="layui-input-block widths">
                <select name="hotelmId" lay-verify="required">
                    <c:forEach items="${plist}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">房间号：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="roomId"value="" lay-verify="required">
                <input type="text" name="roomNumber" class="layui-input" value="" readonly lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">币种：</label>
            <div class="layui-input-block widths">
                <select name="currency" lay-verify="required">
                    <option value="-1"></option>
                    <option value="1">人民币</option>
                    <option value="2">菲律宾币</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格：</label>
            <div class="layui-input-block widths">
                <input type="text" name="money" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">入住时间：</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkinTime" id="checkinTime" class="layui-input " readonly lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">退房时间：</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkoutTime" class="layui-input time" id="checkoutTime" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-block widths">
                <input type="text" name="name" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话：</label>
            <div class="layui-input-block widths">
                <input type="text" name="phoneNumber" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">入住人数：</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkinNumber" id="checkinNumber" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否到账：</label>
            <div class="layui-input-block widths">
                <input type="radio" name="isdao" value="2" title="是">
                <input type="radio" name="isdao" value="1" title="否" checked="">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账户：</label>
            <div class="layui-input-block widths">
                <select name="account" lay-verify="required">
                    <c:forEach items="${alist}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addMenu">提交</button>
            </div>
        </div>
    </form>
</div>

<script>


    function add() {
        index = layer.open({
            type: 1,
            area: ['80%', '90%'],
            anim: 2,
            title: '添加订单',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭
            content: $('#add')
        });
    }
</script>
<script>
    layui.use(['element', 'form', 'laydate'], function () {
        var element = layui.element,
            laydate = layui.laydate,
            form = layui.form;

        $('.time').each(function () {
            laydate.render({
                elem: this,
                type: 'datetime'
            });
        })
        $(document).on('click', '.todate', function () {
            $('this').addCss('bj');

        });
        element.init();
        form.render()

        $(document).on('click','.toadd',function(){
            getData($(this))
        });
        function getData(obj) {
            add();
            var id = $(obj).parent().parent().parent().find('input[name=roomId]').val();
            var roomNumber = $(obj).parent().parent().parent().find('input[name=roomNumber]').val();
            var time =getNowFormatDate();
            form.val('test', {
                "roomNumber": roomNumber,
                "roomId": id,
                "checkinTime": time+" 00:00:00"
            });
        }

        $('#order').blur(function() {
            var order=document.getElementById("order").value;
                $.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/codeNumberYZ.do',       //地址 type 带参数
                    data:"orderNumber="+order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if(result>=1){
                            alert("订单号重复！"+' \n '+"Duplicate order number");                     //提示框
                            document.getElementById("order").value="";     //这个id的文本框的值 将会清空
                            document.getElementById("order").focus();      // 给这个id的文本框提供焦点
                            return false;
                        }else {
                            return false;
                        }
                    },
                    error: function(data) {  }
                })
        })
        var falg;
        form.on('submit(addMenu)',function (obj) {
            var param =obj.field;
            //判断下拉框
            if (param.currency==-1){
                layer.msg('请选择币种!');
                return false;
            }
            console.log(falg=day(param))
            console.log(falg)
            if (falg==true){
                $.ajax({
                    cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/addOrder.do',       //地址 type 带参数
                    data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async:false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if(result!=1){
                            alert("新增订单失败，人数大于剩余床位数！"+' \n '+"Failed to add order");                     //提示框
                            document.getElementById("order").value="";     //这个id的文本框的值 将会清空
                            document.getElementById("order").focus();      // 给这个id的文本框提供焦点
                            return false;
                        }else {
                            alert("新增订单成功！"+' \n '+"New order succeeded");
                            return true;
                        }
                    },
                    error: function(data) {  }
                })
            }
           /* var time=document.getElementById("checkinTime").value;
            var number=document.getElementById("checkinNumber").value;
            var roomId=document.getElementById("id").value;*/
            
        });
      
    });

    function day(param) {
        $.ajax({
            cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/Order/checkinDay.do',       //地址 type 带参数
            data:param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async:false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                if(result!=1){
                    layer.msg('入住失败，人数大于剩余床位数！'+' \n '+'Check in failed');             //提示框
                    document.getElementById("order").value="";     //这个id的文本框的值 将会清空
                    document.getElementById("order").focus();      // 给这个id的文本框提供焦点
                    falg=false;
                    return false;
                }
            }
        })
        falg=true;
        return falg;
    }

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

</script>

</html>
