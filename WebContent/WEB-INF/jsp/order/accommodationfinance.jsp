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
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <%--<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>--%>

    <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <link rel="stylesheet" href="${ctx}/css/administration.css"/>
    <link rel="stylesheet" href="${ctx}/css/ht.css"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/layui/layui.all.js"></script>
    <script src="${ctx}/js/weeklyCalendar.js"></script>
    <script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/language.js"></script>

    <script type="text/javascript" src="${ctx}/js/page.js"></script>
    <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
</head>
<style>
    /*.widths{*/
        /*width: 80%;*/
    /*}*/

    body {
        font-size: 62.5%;
    }
    body span{
       font-size: 1rem;
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
    .layui-form-item {
        margin-right: 1rem;
    }
    #add {
        display: none;
        margin-top: 10px;
    }

    .bj {
        background-color: deepskyblue;
        color: white;
    }

    /* body {max-width: 400px;margin-left: auto;margin-right: auto} */
    h3 {
        margin-top: 40px;
    }

    ul, li {
        list-style: none;
    }

    .myWeeklyCanlendar {
        padding: 0;
        margin: 0
    }

    .datetime_header {
        text-align: center;
        padding-top: 15px;
        padding-bottom: 15px;
        font-size: 16px;
        border-bottom: 1px solid #dedede
    }

    .prev_icon,
    .next_icon {
        display: inline-block;
        vertical-align: top;
        width: 20px;
        height: 20px;
    }

    .prev_icon {
        margin-right: 20px;
        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBRjM4MjAyQTc1QkYxMUU3OEU5NUNEMTJBNTFEMzFDNSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBRjM4MjAyQjc1QkYxMUU3OEU5NUNEMTJBNTFEMzFDNSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkFGMzgyMDI4NzVCRjExRTc4RTk1Q0QxMkE1MUQzMUM1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkFGMzgyMDI5NzVCRjExRTc4RTk1Q0QxMkE1MUQzMUM1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+oFyXSAAAAd9JREFUeNqM1E1IFGEcx/HdJQ+Rq6dgr6V7SgWJrEviSyERZKbiqRBXhNq6qa14EDykZgXRrgaKkC4qQUYEBqEHXw7aC4l0SfSwVxWRTmWH7fvAf+DZh3lm9g8fhpln5sfzNk8wPLQfsNQ9tKPWeL6GaUyqm9+JszmNp1yCmjCDM/iDj9hBFlFcw1W8xl3M6R+HjLARLCCDapzGLXSjB7dRiMv4gdmi4YOkLXAIvRjEBRmarb7gEhKI66FO4A1pfIIBj6AlvDRG9FhC2/TAD9hDv09YPXb1hyzKUy7fMU9oSAW2okDmx1bLEnYHr1zam+XaGZLJ/oufHj2rk7D3bi/QS7WIR2oNQjK5i5awRelZoy1MK7U7Spx9uG00FmMVFajEVsC/fumLkjUagwg7IwrkV1k9sMxoPMZ5rMjqX88jMOoEquHctLxUg2/4nEeoWrSMCnwuv1ip5UW1aF+9Qtl/ES7qlHihAtPy3GsVq7TQmEv7W7mOO3PYIvPY5xO6iYtG7+Jy+sTYj/+cbfMOSfmXT2Qa3OqKcf9AvntD2JR52jxCCs+wbvbEqHIZfkrC2m0H7ENsyAGrVvcQn2TrqDqHBkTkvouwCb8TOy2n8H10yKmsl/rnRzEmJ3pO/RdgAImpc6oRs8i7AAAAAElFTkSuQmCC) no-repeat
    }

    .next_icon {
        margin-left: 20px;
        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBNjRBQUZBMzc1QkYxMUU3OEY0NEFDQzI1NzVDODk5QSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBNjRBQUZBNDc1QkYxMUU3OEY0NEFDQzI1NzVDODk5QSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE2NEFBRkExNzVCRjExRTc4RjQ0QUNDMjU3NUM4OTlBIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkE2NEFBRkEyNzVCRjExRTc4RjQ0QUNDMjU3NUM4OTlBIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+5IgMmAAAAeVJREFUeNqM1E9IFGEYx/HdJQ9idhP2KrkHzRAKNygTBEFFiMpCOhRiIeTaqX8rHQSJ/N9JS0gEdVERLEJQDDpVoKEYEdgfEjp0Kemwp6TD+n3hN/Du286sD3wYdmfmx8wz7/uEi/t+hXzqGtpQ5/z/BtOYMD/SyZKsk4dyBF3ADIrwF0v4igxiqMdZjOMq5uybI07YAJ7jB2pRiHO4g7s4j8M4hS3MHun/PeoX2Id76MUxvZpfvUc1kkjYoV5gk04+Qo9148M8weaN7iu01Q58ie944Nywgxqs+SXyUQY5bGKe0IgJvIwC9cetSTSoZ+sBT9qi442Imr2HTz4Xv0Ij4n6hPKX5iH/MN4ioucuh4FrVcokH9NSsjqNeDz+G8tdrlKun31DinP9if5RM6GCV1rEYYedcxg6sPEDYafzEBqJw92zMC/yA5jxhZ/AOn9XzXHXR7DATOKItVhYQ9hbb6uF/xfqLqqePTWBK/7/Ice0VK6wi4A0WdHzq9fCS+tjtXFilIeAbxtMlNH2usx7/eYGLGNVevm1db/b3iYAn69R9U4RNutPmFsYwrNc8GRB0XDtoTGFtfgO2S4NgRstjFysaHKZKtbej+t1B2LN8EzulKXwT7ZrKdpk9P4QnmuhZtS/AAK1fcwgha25zAAAAAElFTkSuQmCC) no-repeat
    }

    .prev_icon:active,
    .next_icon:active,
    .weeklyCanlendarBox li a:active {
        opacity: .8
    }

    .weeklyBox, .weeklyCanlendarBox {
        overflow: hidden;
        font-size: 14px;
    }

    .weeklyBox {
        padding-top: 10px;
        padding-bottom: 5px;
    }

    .weeklyBox li {
        line-height: 30px
    }

    .weeklyBox li,
    .weeklyCanlendarBox li {
        float: left;
        display: inline;
        width: 14.28571428%;
        text-align: center;
    }

    .weeklyCanlendarBox li a {
        display: inline-block;
        width: 30px;
        line-height: 30px;
        border-radius: 100%;
        color: #0d87ea;
        text-decoration: none;
        border: 1px solid transparent
    }

    .weeklyCanlendarBox li.active a {
        background: #0d87ea;
        color: #fff;
    }

    .weeklyCanlendarBox li.clickActive a {
        border: 1px solid #0d87ea
    }

    .weeklyCanlendarBox li a.disabled {
        color: #ccc;
        pointer-events: none
    }
    .layui-form .layui-form-label{
        font-size: 1rem;
    }
</style>
<body>

<div class="layui-row">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
        <button class="btn btn-small btn-success"id="enBtn">
            English
        </button>
        <button class="btn btn-small btn-success"id="zhBtn">
            简体中文
        </button>
    </div>
    <div class="layui-col-xs12 layui-col-md6 layui-col-md-offset3">
        <div class="layui-row date">
            <div id="j_weeklyCalendar" class="myWeeklyCanlendar">
                <div class="datetime_header">
                    <a href="javascript:;" title="上一周" class="prev_icon" role="prev_week"></a>
                    <span><b role="year_selector"></b >年<b role="month_selector"></b>月</span><span
                        style="margin-left: 20px;display: none">第<b
                        role="week_selector"></b>周</span>
                    <a href="javascript:;" title="下一周" class="next_icon" role="next_week"></a>
                </div>
                <ul role="weeks_ch" class="weeklyBox"></ul>
                <ul role="weeklyCanlendarView" class="weeklyCanlendarBox"></ul>
            </div>
        </div>

        <div class=" layui-row ht-box"  >
            <div class="layui-row layui-form">
                <div class="layui-collapse" id="list">
                    <%--<div class="layui-row layui-tab-content teacherClass" style="margin: 0 auto 20px 20px;">--%>
                    <c:forEach items="${list.result}" var="item">
                        <div class="layui-colla-item">
                            <h4 class="layui-colla-title">
                                <div class="layui-col-xs4 " style="padding-left: 15px;">
                                    <h2 style="font-size: 1rem;">${item.roomNumber}</h2>
                                </div>
                                <div class="layui-btn layui-btn-normal layui-btn-sm" style="float: right;margin-top: 5px;font-size:10px;" onclick="date(${item.roomNumber},${item.roomId})" lang>check</div>
                            </h4>
                            <div class="layui-colla-content layui-show">
                                <div class="layui-row">
                                    <input type="hidden" name="roomNumber" value="${item.roomNumber}">
                                    <input type="hidden" name="roomId" value="${item.roomId}">
                                    <div class="">${item.supplierName}-${item.roomNumber}</div>
                                </div>
                                <div class="layui-row">
                                    <div class="layui-col-xs4"><span class="layui-badge layui-bg-gray"><span lang>surplus</span>
											<c:if test="${item.remainingBeds==null}">${item.roomAmount}</c:if>
											<c:if test="${item.remainingBeds!=null}">${item.remainingBeds}</c:if>
											<span lang>bed</span></span></div>
                                    <c:if test="${item.remainingBeds!=0}">
                                        <div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
                                            <div class="layui-btn layui-btn-sm toadd "  lang>add</div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="span11">
                        <div class="row-fluid">
                            <div class="tcdPageCode" style="text-align:center;"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </div>
</div>

</body>
<div id="add" class="layui-fluid" style="display: none">
    <form class="layui-form" autocomplete="off" lay-filter="test">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>order</span>:</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="roomId"/>
                <input type="text" name="orderNumber" id="order" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>patform</span>:</label>
            <div class="layui-input-block widths">
                <select name="platformId" lay-verify="required" id="pt">
                    <c:forEach items="${slist}" var="item">
                        <option value="${item.id}">${item.supplierName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>supplier</span>:</label>
            <div class="layui-input-block widths">
                <select name="hotelmId" lay-verify="required" id="gys">
                    <c:forEach items="${plist}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomNumber</span>:</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="roomId" value="" lay-verify="required">
                <input type="text" name="roomNumber" class="layui-input" value="" readonly lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>currency</span>:</label>
            <div class="layui-input-block widths">
                <select name="currency" lay-verify="required">
                    <option value="-1"></option>
                    <option value="1" lang>RMB</option>
                    <option value="2" lang>PHP</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>Price</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="money" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>checkin</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkinTime" id="checkinTime" class="layui-input time"
                       lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>checkout</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkoutTime" class="layui-input time" id="checkoutTime" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>name</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="name" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>phone</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="phoneNumber" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>checknumber</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkinNumber" id="checkinNumber" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>checkinRoom</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="checkinRoom" id="checkinRoom" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>account</span>:</label>
            <div class="layui-input-block widths">
                <input type="radio" name="isdao" value="2" title="是">
                <input type="radio" name="isdao" value="1" title="否" checked="">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>accounts</span>:</label>
            <div class="layui-input-block widths">
                <select name="account" lay-verify="required" id="zh">
                    <c:forEach items="${alist}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="addMenu" lang>Submission</div>
            </div>
        </div>
    </form>
</div>

<script>
    function add() {
        k = layer.open({
            type: 1,
            area: ['60%', '90%'],
            anim: 2,
            title: '添加订单',
            maxmin: true,
           /* shadeClose: true, //点击遮罩关闭*/
            content: $('#add'),
            cancel:function () {
                $("#add").css('display','none');
            }
        });
        registerWords();
        setLanguage(getCookieVal("lang"));
    }

   /* $(".layui-layer-close").on('click',function () {

    })*/
    function date(value,value2){
        index = layer.open({
            type: 2,
            area: ['90%', '90%'],
            anim: 2,
            title: value+'房',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭
            content:'../date/date.html?roomId='+value2
        });
    }
    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${list.totalPage},
        current:${list.currentPage},
        backFn:function(p){
            location.href="${ctx}/Order/occupancy.do?currentPage="+p;
        }
    });
</script>
<script>
    layui.use(['element', 'form', 'laydate','laypage'], function () {
        var element = layui.element,
            laypage=layui.laypage,
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

        $(document).on('click', '.toadd', function () {
            getData($(this))
        });

        function getData(obj) {
            add();
            var id = $(obj).parent().parent().parent().find('input[name=roomId]').val();
            var roomNumber = $(obj).parent().parent().parent().find('input[name=roomNumber]').val();
            var time = getNowFormatDate();
            form.val('test', {
                "roomNumber": roomNumber,
                "roomId": id
              /*  "checkinTime": time + " 00:00:00"*/
            });
        }

        $('#order').blur(function () {
            var order = document.getElementById("order").value;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/codeNumberYZ.do',       //地址 type 带参数
                data: "orderNumber=" + order,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result >= 1) {
                        alert("订单号重复！" + ' \n ' + "Duplicate order number");                     //提示框
                        document.getElementById("order").value = "";     //这个id的文本框的值 将会清空
                        document.getElementById("order").focus();      // 给这个id的文本框提供焦点
                        return false;
                    } else {
                        return false;
                    }
                },
                error: function (data) {
                }
            })
        })
        var falg;
        form.on('submit(addMenu)', function (obj) {
            var param = obj.field;
            console.log(param)
            //判断下拉框
            if (param.currency == -1) {
                layer.msg('请选择币种!');
                return false;
            }
            var checkin=param.checkinTime;
                var checkout=param.checkoutTime;
                if(checkin>checkout){
                    layer.msg('时间不正确!');
                return;
            }
            var reg = new RegExp('^[1-9](\\d{1,9})((\\.\\d{1,3})?)$');
            var s=param.money;
            if(reg.test(s)){
                console.log('true');
            }else{
                layer.msg('价格输入不正确，不超过9位数!');
                return;
            }
            if (day(param)) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/addOrder.do',       //地址 type 带参数
                    data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if (result != 1) {
                            layer.msg('新增订单失败，人数大于剩余床位数');
                                          //提示框
                            document.getElementById("order").value = "";     //这个id的文本框的值 将会清空
                            document.getElementById("order").focus();      // 给这个id的文本框提供焦点
                        } else {
                            layer.msg('新增订单成功！');
                            location.href = "${ctx}/Order/occupancy.do";
                        }
                    },
                    error: function (data) {
                    }
                })
                return false
            }else {
                console.log(123)
            }
        });


        // 默认周历
        weeklyCalendar('#j_weeklyCalendar', {
            //点击日期回调
            clickDate: function (dateTime) {
                console.log(dateTime);
                var year = dateTime.year;
                var moth = dateTime.month;
                var day = dateTime.date;
                var time = year + "-" + moth + "-" + day;//joccupancy
                //location.href='${ctx}/Order/occupancy.do?time='+time;
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/joccupancy.do',       //地址 type 带参数
                    data: "time="+time,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {
                        // 不出现异常 进行立面方
                        console.log(result);
                        var alist = result.alist;
                        var list = result.list;
                        var pList = result.plist;
                        var slist = result.slist;
                        $('#gys').empty();
                        var gysStr = '';

                        $.each(slist, function (index, item) {
                            gysStr += '<option value="' + 'item.id+">'+item.supplierName+'</option>';
                        });
                        $('#pt').empty();
                        var ptStr = '';
                        $.each(pList, function (index, item) {
                            ptStr += '<option value="' + 'item.id+">'+item.name+'</option>';
                        });
                        $('#zh').empty();
                        var zhStr = '';
                        $.each(alist, function (index, item) {
                            zhStr += '<option value="' + 'item.id+">'+item.name+'</option>';
                        });
                        $('#gys').append(gysStr);
                        $('#zh').append(zhStr);
                        $('#pt').append(ptStr);
                        $('#list').empty()
                        var listStr = '';
                        var count=0;

                        $.each(list, function (index, item) {
                            count++;
                            listStr += '<div class="layui-colla-item">';
                            listStr += '<h2 class="layui-colla-title" style="font-size: 10px;">';
                            listStr += '<div class="layui-col-xs4 " style="padding-left: 15px;">';
                            listStr += '<h2 style="font-size:10px;">' + item.roomNumber + '</h2>\n' + '</div>';
                            listStr += ' <div class="layui-btn layui-btn-normal " style="float: right;margin-top: 5px;font-size: 10px;" onclick="date(' + item.roomNumber + ',' + item.roomId + ')" lang>check</div>';
                            listStr += '</h2>';
                            listStr += '<div class="layui-colla-content"><div class="layui-row">';
                            listStr += '<input type="hidden" name="roomNumber" value="'+item.roomNumber+'">';
                            listStr += '<input type="hidden" name="roomId" value="'+item.roomId+'">';
                            listStr += '<div class="">' + item.supplierName + '-' + item.roomNumber + '</div></div>';
                            listStr += '<div class="layui-row">';
                            listStr += '<div class="layui-col-xs4"><span class="layui-badge layui-bg-gray"><span lang>surplus</span>';
                            if (item.remainingBeds == null) {
                                listStr += item.roomAmount;
                            } else if (item.remainingBeds != null) {
                                listStr += item.remainingBeds;
                            }
                            listStr += '<span lang>bed</span></span></div>';
                            if (item.remainingBeds != 0) {
                                listStr += '<div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">';
                                listStr += '<div class="layui-btn layui-btn-sm  toadd" lang>add</div>';
                                listStr += '</div>';
                            }
                            listStr += ' </div></div></div> ';
                          ;
                        });
                        listStr+='<div id="testPage"></div>'
                        $('#list').append(listStr);
                        element.render();
                        form.render();
                        // laypage.render();
                        registerWords();
                        setLanguage(getCookieVal("lang"));
                    },
                    error: function (data) {
                    }
                })
            }
        });

    });
    function day(param) {
        var bl=true
        $.ajax({
            cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/Order/checkinDay.do',       //地址 type 带参数
            data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async: false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                console.log(result)
                if (result != 1) {
                    layer.msg('入住失败，人数大于剩余床位数！' + ' \n ' + 'Check in failed');
                    bl=false;
                }
            },
            error: function (data) {
                alert("请求失败")
            }
        })
        return bl;
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
