<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>订单管理-修改订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <link rel="stylesheet" href="${ctx}/css/ht.css"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/layui/layui.all.js"></script>
    <script type="text/javascript" src="${ctx}/js/language.js"></script>

    <script type="text/javascript" src="${ctx}/js/page.js"></script>
    <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
</head>
<style>
    .x-body {
        padding: 20px;
    }

    .x-body {
        padding: 20px;
    }

    .widths {
        width: 300px;
    }
    .layui-form-label {
        font-size: 0.85rem;
    }

    .layui-input {
        font-size: 0.85rem;
    }
</style>
<div class="x-body">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
        <button class="btn btn-small btn-success" id="enBtn">
            English
        </button>
        <button class="btn btn-small btn-success" id="zhBtn">
            简体中文
        </button>
    </div>
    <div id="updateorder" class="layui-fluid" style="margin:0 auto">
        <form class="layui-form" autocomplete="off" lay-filter="test">
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>order</span>:</label>
                <div class="layui-input-block widths">
                    <input type="hidden" id="statuss" value="${status}"/>
                    <input type="hidden" name="id" value="${vo.id}"/>
                    <input type="hidden" name="type" value="${vo.type}"/>
                    <input type="text" name="orderNumber" id="order" class="layui-input " value="${vo.orderNumber}" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>patform</span>:</label>
                <div class="layui-input-block widths">
                    <input type="hidden" name="platformId" value="${vo.platformId}">
                    <input type="text" name="platform" value="${vo.platformName}" readonly class="layui-input ">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>supplier</span>:</label>
                <div class="layui-input-block widths">
                    <input type="hidden" name="hotelmId" value="${vo.supplierId}"  class="layui-input ">
                    <input type="text" name="hotelm" class="layui-input " value="${vo.supplierName}" readonly  >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>roomNumber</span>:</label>
                <div class="layui-input-block widths">
                   <select name="roomId" lay-verify="required" >
                    <c:forEach items="${list}" var="item">
                        <option value="${item.id}" <c:if test="${item.id==vo.roomid}">selected </c:if>>${item.roomNumber}</option>
                    </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>currency</span>:</label>
                <div class="layui-input-block widths">
                    <select name="currency" lay-verify="required">
                        <option value="-1"></option>
                        <option value="1" <c:if test="${1==vo.currency}">selected </c:if> lang>RMB</option>
                        <option value="2" <c:if test="${2==vo.currency}">selected </c:if> lang>PHP</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>Price</span>:</label>
                <div class="layui-input-block widths">
                    <input type="text" name="money" class="layui-input "  value="${vo.money}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>checkin</span>:</label>
                <div class="layui-input-block widths">
                    <input type="text" name="checkinTime" id="checkinTime" class="layui-input time"
                           lay-verify="required"  value="<fmt:formatDate value="${vo.checkintime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>checkout</span>:</label>
                <div class="layui-input-block widths">
                    <input type="text" name="checkoutTime" class="layui-input time" id="checkoutTime"
                           lay-verify="required"  value="<fmt:formatDate value="${vo.checkouttime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>name</span>:</label>
                <div class="layui-input-block widths">
                    <input type="hidden" name="passengerId" class="layui-input " lay-verify="required"  value="${vo.pId}">
                    <input type="hidden" name="genderName" class="layui-input " lay-verify="required"  value="${vo.genderID}">
                    <input type="text" name="name" class="layui-input " lay-verify="required"  value="${vo.name}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>phone</span>:</label>
                <div class="layui-input-block widths">
                    <input type="text" name="phoneNumber" class="layui-input " lay-verify="required"  value="${vo.phoneNumber}">
                </div>
            </div>
        <c:if test="${status!=4}"><%--未确认--%>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>checknumber</span>:</label>
                <div class="layui-input-block widths">
                    <input type="text" name="checkinNumber" id="checkinNumber" class="layui-input " lay-verify="required"  value="${vo.checkinNumber}">
                </div>
            </div>
     </c:if>
            <c:if test="${status==4}"><%--未确认--%>
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label"><span lang>checknumber</span>:</label>
                    <div class="layui-input-block widths">
                        <input type="text" name="checkinNumber"  class="layui-input " lay-verify="required"  value="1">
                    </div>
                </div>
            </c:if>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>checkinRoom</span>:</label>
                <div class="layui-input-block widths">
                    <input type="text" name="checkinRoom" id="checkinRoom" class="layui-input " lay-verify="required"  value="${vo.checkinRoom}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>account</span>:</label>
                <div class="layui-input-block widths">
                    <input type="radio" name="isdao" value="2" title="是"<c:if test="${2==vo.isdao}">checked </c:if>>
                    <input type="radio" name="isdao" value="1" title="否"<c:if test="${1==vo.isdao}">checked </c:if>>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span lang>accounts</span>:</label>
                <div class="layui-input-block widths">
                    <select name="account" lay-verify="required">
                        <c:forEach items="${alist}" var="items">
                            <option value="${items.id}" <c:if test="${items.id==vo.aid}">selected </c:if>>${items.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <c:if test="${status==4}"><%--未确认--%>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span lang>intype</span>:</label>
                    <div class="layui-input-block widths">
                        <select name="type" lay-verify="required" id="rzlx" lay-filter="rzlx">
                            <option value="3" lang>自有整租</option>
                            <option value="2" lang>合约公寓</option>
                        </select>
                    </div>
                </div>
            </c:if>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <div class="layui-btn" lay-submit lay-filter="addMenu" lang>Submission</div>
                </div>
            </div>

        </form>
    </div>

</div>
<script>
    layui.use(['form', 'table', 'element', 'laydate'], function () {
        var form = layui.form,
            table = layui.table,
            laydate = layui.laydate,
            element = layui.table;

        element.init();
        form.render();

        $('.time').each(function () {
            laydate.render({
                elem: this,
                type: 'datetime'
            });
        })



        form.on('submit(addMenu)', function (obj) {
            var param = obj.field;
            console.log(param);
            //判断下拉框
            if (param.currency == -1) {
                layer.msg('请选择币种!');
                return false;
            }
            var checkin = param.checkinTime;
            var checkout = param.checkoutTime;
            if (checkin > checkout) {
                layer.msg('时间不正确!');
                return;
            }
            var reg = new RegExp('^[1-9](\\d{1,9})((\\.\\d{1,3})?)$');
            var s = param.money;
            if (reg.test(s)) {
                console.log('true');
            } else {
                layer.msg('价格输入不正确，不超过9位数!');
                return;
            }
            if (day(param)) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/update.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("新增失败！" + ' \n ' + "Failed to add");                     //提示框
                    } else {
                        alert("新增成功！" + ' \n ' + "succeeded");
                        var statuss=$("#statuss").val();
                        console.log(statuss);
                     location.href = '${ctx}/Order/pageorders.do?status=0';
                    }
                }
            })

            }
        });

        function day(param) {
            var statuss=$("#statuss").val();
            var url;
            if (statuss==4){
                if (param.status==1){//未确认

                }
                url='${ctx}/Order/updateCheckinDay.do';
            }else {
                url='${ctx}/Order/updateCheckinDay.do';
            }
            var bl = true
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url:url ,       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    console.log(result)
                    if (result != 1) {
                        layer.msg('入住失败，入住时间段内无足够空床！' + ' \n ' + 'Check in failed');
                        bl = false;
                    }
                },
                error: function (data) {
                    alert("请求失败")
                }
            })
            return bl;
        }


        function date(strdate) {
            var d = new Date(strdate);
            return d;
        }
    })
</script>
</html>
