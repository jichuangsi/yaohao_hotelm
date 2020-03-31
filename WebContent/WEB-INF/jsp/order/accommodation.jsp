<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<html>
<head>
    <meta charset="utf-8">
    <title>酒店管理-订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <%--<link rel="stylesheet" href="${ctx}/css/administration.css" />--%>
    <link rel="stylesheet" href="${ctx}/css/ht.css"/>
    <link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/layui/layui.all.js"></script>

    <script type="text/javascript" src="${ctx}/js/page.js"></script>
    <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
    <script type="text/javascript" src="${ctx}/js/language.js"></script>
</head>
<style>
    /*body{*/
    /*background-color: gainsboro;*/
    /*}*/
    .x-body {
        padding: 20px;
    }

    .x-body {
        padding: 20px;
    }

    #add_apar {
        display: none;
        margin-top: 10px;
    }

    .widths {
        width: 300px;
    }

    #modify_apar {
        display: none;
        margin-top: 10px;
    }

    .layui-form-label {
        width: 110px;
    }

    .layui-input-block {
        margin-left: 150px
    }

    .layui-badge, .layui-badge-rim {
        font-size: 14px;
    }

    .rmb-box-ht {
        font-size: 10px;
    }
</style>
<div id="bo">
<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
    <button class="btn btn-small btn-success" id="enBtn">
        English
    </button>
    <button class="btn btn-small btn-success" id="zhBtn">
        简体中文
    </button>
</div>
<div class="layui-container">

    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li lay-id="tab0" class="layui-this" lang>established</li>
            <li lay-id="tab1" lang>checkedin</li>
            <li lay-id="tab2" lang>Check-out</li>
            <li lay-id="tab3" lang>arrival</li>
        </ul>
        <div class="layui-tab-content">
            <%--1已确定--%>
            <div class="layui-tab-item layui-show">
                <div class="layui-row" id="list">
                    <c:forEach items="${lists.result}" var="item">
                    <div class="layui-col-md6 layui-col-xs12 layui-col-md6">
                        <div class="rmb-box-ht">
                            <div class="rmb-title layui-row">
                                <div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span>
                                </div>
                                <div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
                                <div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span>
                                </div>
                            </div>
                            <div class="rmb-title layui-row">
                                <div class="layui-col-xs2"><span
                                        class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span>
                                </div>
                                <div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
                                <div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span>
                                </div>
                            </div>
                            <div class="rmb-title layui-row">
                                <div class="layui-col-xs2"><span
                                        class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span>
                                </div>
                                <div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}"
                                                                                 pattern="yyyy-MM-dd"/>
						</span> <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}"
                                                                           pattern="yyyy-MM-dd"/></span></div>
                                <div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span
                                        lang>to</span> <span>${item.out}</span></div>
                            </div>
                            <div class="rmb-title layui-row">
                                <div class="layui-col-xs4"><span><span lang>total</span> ：<c:if
                                        test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
                                        ${item.money}</span></div>
                                <div class="layui-col-xs3"><span><span
                                        lang>accounts</span>：${item.accountName}</span></div>
                                <div class="layui-col-xs5"><span><span lang>payment</span>：<c:if
                                        test="${item.daoTime!=null}">
                                    <fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
                                </c:if></span></div>
                            </div>
                            <div class="rmb-title layui-row">
                                <div class="layui-col-xs7 "><span style="padding:0px 10px;"><span
                                        lang>name</span>:${item.name}</span></div>
                            </div>
                            <div class="rmb-title layui-row">
                                <div class="layui-col-xs2 layui-col-xs-offset6">
                                    <span class="layui-btn layui-btn-normal layui-btn-sm"
                                          onclick="checkin(${item.orderNumber})" lang>ins</span>
                                    <c:if test="${item.daoTime==null}">
                                       <span class="layui-btn layui-btn-normal layui-btn-sm"  onclick="daoacount(${item.id})" lang>dao</span>
                                    </c:if>
                                </div>

                        </div>
                    </div>
                    </div>
                    </c:forEach>
            </div>
            </div>
                <%--2已入住--%>
             <div class="layui-tab-item">
                    <div class="layui-row" id="list1">
                        <c:forEach items="${listr.result}" var="item">
                        <div class="layui-col-md6 layui-col-xs12 layui-col-md6">
                            <div class="rmb-box-ht">
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span>
                                    </div>
                                    <div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
                                    <div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span>
                                    </div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2"><span
                                            class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span>
                                    </div>
                                    <div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
                                    <div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span>
                                    </div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2"><span
                                            class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span>
                                    </div>
                                    <div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}"
                                                                                     pattern="yyyy-MM-dd"/>
						</span> <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}"
                                                                           pattern="yyyy-MM-dd"/></span></div>
                                        <%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
                                    <div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span
                                            lang>to</span> <span>${item.out}</span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs4"><span><span lang>total</span> ：<c:if
                                            test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
                                            ${item.money}</span></div>
                                    <div class="layui-col-xs3"><span><span
                                            lang>accounts</span>：${item.accountName}</span></div>
                                    <div class="layui-col-xs5"><span><span lang>payment</span>：<c:if
                                            test="${item.daoTime!=null}">
                                        <fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
                                    </c:if></span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs7 "><span style="padding:0px 10px;"><span
                                            lang>name</span>:${item.name}</span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2 layui-col-xs-offset4"><span class="layui-btn layui-btn-normal layui-btn-sm"
                                              onclick="checkout(${item.orderNumber})" lang>out</span>
                                        <c:if test="${item.isdao==1}">
                                        <span class="layui-btn layui-btn-normal layui-btn-sm" onclick="daoacount(${item.id})" lang>ins</span>
                                        </c:if>
                                    </div>

                                </div>
                            </div>

                        </div>
                        </c:forEach>
                    </div>

                </div>
             <%--已退房--%>
             <div class="layui-tab-item">
                    <div class="layui-row" id="list2">
                        <c:forEach items="${listt.result}" var="item">
                        <div class="layui-col-md6 layui-col-xs12 layui-col-md6">
                            <div class="rmb-box-ht">
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span>
                                    </div>
                                    <div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
                                    <div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span>
                                    </div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2"><span
                                            class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span>
                                    </div>
                                    <div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
                                    <div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span>
                                    </div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2"><span
                                            class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span>
                                    </div>
                                    <div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}"
                                                                                     pattern="yyyy-MM-dd"/>
						</span> <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}"
                                                                           pattern="yyyy-MM-dd"/></span></div>
                                    <div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span
                                            lang>to</span> <span>${item.out}</span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs4"><span><span lang>total</span> ：<c:if
                                            test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
                                            ${item.money}</span></div>
                                    <div class="layui-col-xs3"><span><span
                                            lang>accounts</span>：${item.accountName}</span></div>
                                    <div class="layui-col-xs5"><span><span lang>payment</span>：<c:if
                                            test="${item.daoTime!=null}">
                                        <fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
                                    </c:if></span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs7 "><span style="padding:0px 10px;"><span
                                            lang>name</span>:${item.name}</span></div>
                                </div>
                                <c:if test="${item.daoTime==null}">
                                    <div class="layui-col-xs2 layui-col-xs-offset8"><span class="layui-btn layui-btn-normal layui-btn-sm"
                                      onclick="daoacount(${item.id})" lang>ins</span></div>
                            </c:if>
                        </div>

                    </div>
                        </c:forEach>
                </div>
             </div>
                <%--已到账--%>
             <div class="layui-tab-item">
                    <div class="layui-row" id="list3">
                        <c:forEach items="${listd.result}" var="item">
                        <div class="layui-col-md6 layui-col-xs12 layui-col-md6">
                            <div class="rmb-box-ht">
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs4"><span class="layui-badge-rim">${item.platformName}</span>
                                    </div>
                                    <div class="layui-col-xs4 layui-col-md3">${item.orderNumber}</div>
                                    <div class="layui-col-xs4"><span class="layui-badge-rim">${item.supplierName}</span>
                                    </div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2"><span
                                            class="layui-badge layui-bg-gray">${item.checkinNumber}<span lang>bed</span></span>
                                    </div>
                                    <div class="layui-col-xs4">${item.roomNumber}<span lang>room</span></div>
                                    <div class="layui-col-xs6 "><span><span lang>phone</span>:${item.phoneNumber}</span>
                                    </div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs2"><span
                                            class="layui-badge layui-bg-gray">${item.checkinDay}<span lang>night</span></span>
                                    </div>
                                    <div class="layui-col-xs6"><span><fmt:formatDate value="${item.checkintime}"
                                                                                     pattern="yyyy-MM-dd"/>
						</span> <span lang>to</span> <span><fmt:formatDate value="${item.checkouttime}"
                                                                           pattern="yyyy-MM-dd"/></span></div>
                                        <%--<div class="layui-col-xs7"><span></span> 至 <span> </span></div>--%>
                                    <div class="layui-col-xs4 layui-col-md3"><span>${item.in}</span> <span
                                            lang>to</span> <span>${item.out}</span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs4"><span><span lang>total</span> ：<c:if
                                            test="${item.currency==1}">RMB</c:if>
							<c:if test="${item.currency==2}">PHP</c:if>
                                            ${item.money}</span></div>
                                    <div class="layui-col-xs3"><span><span
                                            lang>accounts</span>：${item.accountName}</span></div>
                                    <div class="layui-col-xs5"><span><span lang>payment</span>：<c:if
                                            test="${item.daoTime!=null}">
                                        <fmt:formatDate value="${item.daoTime}" pattern="yyyy-MM-dd"/>
                                    </c:if></span></div>
                                </div>
                                <div class="rmb-title layui-row">
                                    <div class="layui-col-xs7 "><span style="padding:0px 10px;"><span
                                            lang>name</span>:${item.name}</span></div>
                                </div>
                                <c:if test="${item.daoTime==null}">
                                    <div class="layui-col-xs2 layui-col-xs-offset8"><span class="layui-btn layui-btn-normal layui-btn-sm"
                                      onclick="daoacount(${item.id})" lang>ins</span></div>
                            </c:if>
                        </div>
                         </div>
                        </c:forEach>
                </div>
            </div>

    </div>

</div>
<div class="span11" id="pages">
    <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
    </div>
</div>
</div>
</div>
</body>

<script>

    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${lists.totalPage},
        current:${lists.currentPage},
        backFn: function (p) {

        }
    });
</script>
<script>
    var ss;
    var  ps;
    layui.use(['element', 'flow'], function () {
        var element = layui.element,
            flow = layui.flow;

        element.render();

        window.checkin = function (value) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                data: "orderNumber=" + value + "&status=5",                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                        document.getElementById("room").value = "";     //这个id的文本框的值 将会清空
                        document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                        return false;
                    } else {
                        location.href = '${ctx}/Order/myorder.do';
                        return true;
                    }
                }
            })
        }

        //退房
        window.checkout = function (value2) {
            var time;
            layer.prompt({
                formType: 0,
                value: '12:00-14:00',
                title: '请输入值',
                area: ['800px', '350px'] //自定义文本域宽高
            }, function (value, index, elem) {
                time = value;
                if (value.indexOf("-") == -1) {
                    alert("格式不正确"); //得到value
                }
                alert(value); //得到value
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                    data: "orderNumber=" + value2 + "&status=6&time=" + time,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if (result != 1) {
                            /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                            document.getElementById("room").value = "";     //这个id的文本框的值 将会清空
                            document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                            return false;
                        } else {
                            location.href = '${ctx}/Order/myorder.do';
                            return true;
                        }
                    }
                })
                layer.close(index);
            });
        }


        element.on('tab(docDemoTabBrief)', function (data) {
            console.log(data.index);
            funpage(data.index,1);
            ss=data.index;
        });

        function funpage(status,p) {
            //获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
            var layid = location.hash.replace(/^#docDemoTabBrief=/, '');
            element.tabChange('docDemoTabBrief', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/pageorder.do',       //地址 type 带参数
                data: "status=" + status+"&currentPage="+p,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    console.log(result)
                    var list = result.result;
                    console.log(list)
                    if (status==0){
                        $('#list').empty();
                    }else if (status==1) {
                        $('#list1').empty();
                    }else if (status==2) {
                        $('#list2').empty();
                    }else if (status==3) {
                        $('#list3').empty();
                    }
                    $("#pages").empty();
                    var pageStr='';
                    var listStr = '';
                    $.each(list, function (index, item) {
                        listStr += ' <div class="layui-col-md6 layui-col-xs12 layui-col-md6">';
                        listStr += '<div class="rmb-box-ht">';
                        listStr += ' <div class="rmb-title layui-row">';
                        listStr += ' <div class="layui-col-xs4"><span class="layui-badge-rim">'+item.platformName+'</span> </div>';
                        listStr += ' <div class="layui-col-xs4 layui-col-md3">'+item.orderNumber+'</div>';
                        listStr += ' <div class="layui-col-xs4"><span class="layui-badge-rim">'+item.supplierName+'</span> </div> </div>';
                        listStr += ' <div class="rmb-title layui-row">';
                        listStr += ' <div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">'+item.checkinNumber+'<span lang>bed</span></span>';
                        listStr += '</div><div class="layui-col-xs4">'+item.roomNumber+'<span lang>room</span></div>';
                        listStr += '<div class="layui-col-xs6 "><span><span lang>phone</span>:'+item.phoneNumber+'</span> </div> </div>';
                        listStr += ' <div class="rmb-title layui-row">';
                        listStr += '<div class="layui-col-xs2"><span class="layui-badge layui-bg-gray">'+item.checkinDay+'<span lang>night</span></span>';
                        listStr += '</div><div class="layui-col-xs6"><span>';
                        listStr+=formateDate(item.checkintime);
                        listStr += '</span> <span lang>to</span> <span>'+formateDate(item.checkouttime)+'</span></div>';
                        if (item.in!=null && item.out!=null) {
                            listStr += ' <div class="layui-col-xs4 layui-col-md3"><span></span>'+item.in+'<span lang>to</span>'+item.out +'<span></span></div>';
                        }
                        listStr += ' </div>';
                        listStr += ' <div class="rmb-title layui-row">';
                        listStr += '<div class="layui-col-xs4"><span><span lang>total</span>:';
                        if (item.currency==1) {
                            listStr += 'RMB';
                        }else if (item.currency==1) {
                            listStr += 'PHP';
                        }
                        listStr += item.money+'</span></div>';
                        listStr += '<div class="layui-col-xs3"><span><span lang>accounts</span>：'+item.accountName+'</span></div>';
                        listStr += ' <div class="layui-col-xs5"><span><span lang>payment</span>：';
                        if (item.isdao==2) {
                            listStr += formateDate(item.daoTime);
                        }
                        listStr += '</span></div>';
                        listStr += ' <div class="rmb-title layui-row">';
                        listStr += ' <div class="layui-col-xs7 "><span style="padding:0px 10px;"><span lang>name</span>:'+item.name+'</span></div>';
                        listStr += '</div>';
                        if (status==0){//确认
                            listStr += '<div class="rmb-title layui-row">';
                            listStr += ' <div class="layui-col-xs2 layui-col-xs-offset4">';
                            listStr += '<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="checkin('+item.orderNumber+')" lang>ins</span>';
                            if (item.isdao==1) {
                                listStr += '<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="daoacount(' + item.id + ')" lang>dao</span>';
                            }
                            listStr+='</div>';

                            listStr += '</div>';
                        }else if (status==1) {//入住
                            listStr += '<div class="rmb-title layui-row">';
                            listStr += ' <div class="layui-col-xs2 layui-col-xs-offset8">';
                            listStr += '<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="checkout('+item.orderNumber+')" lang>out</span>';
                            if (item.isdao==1) {
                                listStr += '<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="daoacount(' + item.id + ')" lang>dao</span>';
                            }
                            listStr+='</div>';

                            listStr += '</div>'
                        }else if (status==2) {//退房
                            if (item.isdao==1) {
                                listStr += '<div class="rmb-title layui-row">';
                                listStr += ' <div class="layui-col-xs2 layui-col-xs-offset8">';
                                listStr += '<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="daoacount(' + item.id + ')" lang>dao</span></div>';
                                listStr += '</div>';
                            }
                        }else if (status==3) {
                            if (item.isdao==1) {
                                listStr += '<div class="rmb-title layui-row">';
                                listStr += ' <div class="layui-col-xs2 layui-col-xs-offset8">';
                                listStr += '<span class="layui-btn layui-btn-normal layui-btn-sm" onclick="daoacount(' + item.id + ')" lang>dao</span></div>';
                                listStr += '</div>';
                            }
                        }

                        listStr += '</div> </div> </div>';

                    });
                    if (status==0){
                        $('#list').append(listStr);
                    }else if (status==1) {
                        $('#list1').append(listStr);
                    }else if (status==2) {
                        $('#list2').append(listStr);
                    }else if (status==3) {
                        $('#list3').append(listStr);
                    }
                    pageStr+=' <div class="row-fluid">';
                    pageStr+='<div class="tcdPageCode" style="text-align:center;"></div>';
                    pageStr+=' </div>';
                    $("#pages").append(pageStr);

                    ps=result.currentPage;
                    /* 分页要用的 */
                    $(".tcdPageCode").createPage({
                        pageCount:result.totalPage,
                        current:result.currentPage,
                        backFn: function (p) {
                            funpage(status,p)
                        }
                    });

                    element.render();
                    /*  form.render();*/
                    // laypage.render();
                    registerWords();
                    setLanguage(getCookieVal("lang"));
                }
            })
            element.init();
        }
        function formateDate(timestamp){
            var date =  new Date(timestamp);
            var y = 1900+date.getYear();
            var m = "0"+(date.getMonth()+1);
            var d = "0"+date.getDate();
            return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
        }




        window.daoacount=function (value) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/isdao.do',       //地址 type 带参数
                data: "id=" + value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {
                    /* window.location.reload();*/
                    funpage(ss,ps);
                }
            })
        }




    });


</script>
</html>
