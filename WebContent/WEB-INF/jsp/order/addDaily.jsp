<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>财务管理-日常消费</title>
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

    #add_apar {
        display: none;
        margin-top: 10px;
    }

    .widths {
        width: 300px;
    }

    #update_apar, #addType_apar, #updateType_apar {
        display: none;
        margin-top: 10px;
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
    <div class="layui-row"><%--action="${ctx}/Hotelm/allorder.do"--%>
        <form class="layui-form layui-col-md12">
            <div class="layui-input-inline">
                <input type="text" name="time" id="time" placeholder="消费时间(月)" autocomplete="off"
                       class="layui-input time" style="width: 200px;">
            </div>

            <div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
        </form>

    </div>
    <table class="layui-table">
        <thead>
        <%--<input type="hidden" id="excel" value="${time}">
        <thead>
        <tr>
            <th colspan="6">日期date:${time}&lt;%&ndash;<span id="span"></span>&ndash;%&gt;</th>
            <th colspan="9" id="exc">导出</th>
        </tr>--%>
        <tr>
            <th colspan="2">
                <div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>add</div>
            </th>
            <th colspan="2">
                <div class="layui-btn layui-btn-sm layui-btn-normal totype" lang>addType</div>
            </th>
            <th colspan="4">
                <div class="layui-btn layui-btn-sm layui-btn-normal touptype" lang>upType</div>
            </th>
        </tr>
        <tr>
            <th lang>serial</th>
            <th lang>hotelm</th>
            <th lang>roomNumber</th>
            <th lang>date</th>
            <th lang>type</th>
            <th lang>consumption</th>
            <th lang>cocontent</th>
            <th lang>operation</th>
        </tr>
        <c:forEach items="${lists.result}" var="item">
        <tr>
            <th>${item.id}</th>
            <th>${item.supplierName}</th>
            <th>${item.roomNumber}</th>
            <th>${item.time}</th>
            <th>${item.name}</th>
            <th>${item.money}</th>
            <th>${item.content}</th>
            <th>
                <div class="layui-btn layui-btn-sm" onclick="updates(${item.id})" lang>amended</div>
            </th>
        </tr>
        </c:forEach>
    </table>
    <div class="span11">
        <div class="row-fluid">
            <div class="tcdPageCode" style="text-align:center;"></div>
        </div>
    </div>
</div>

</body>
<!-- 添加部分 -->
<div id="add_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomNumber</span>：</label>
            <div class="layui-input-block widths">
                <select name="roomId" lay-verify="required">
                    <c:forEach items="${rlist}" var="item">
                        <option value="${item.id}">${item.roomNumber}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>type</span>：</label>
            <div class="layui-input-block widths">
                <select name="cid" lay-verify="required">
                    <c:forEach items="${clist}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>cocontent</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="content" value="" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>consumption</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="money" id="money" value="" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>time</span> ：</label>
            <div class="layui-input-block widths">
                <input type="text" name="time" class="layui-input time" lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="add_Pwd" lang>Submission</div>
            </div>
        </div>
    </form>
</div>

<!-- 修改部分 -->
<div id="update_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="testss">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomNumber</span>：</label>
            <%-- <div class="layui-input-block widths">
                 <input type="hidden" name="id" id="id" value="" class="layui-input " readonly>
                &lt;%&ndash; <input type="text" name="roomNumber" value="" class="layui-input " readonly>&ndash;%&gt;

             </div>--%>
            <input type="hidden" name="id" id="id" value="" class="layui-input " readonly>
            <div class="layui-input-block widths">
                <select name="roomId" lay-verify="required">
                    <c:forEach items="${rlist}" var="item">
                        <option value="${item.id}">${item.roomNumber}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>type</span>：</label>
            <%-- <div class="layui-input-block widths">
                 <input type="text" name="typeName" value="" class="layui-input " readonly>
             </div>--%>
            <div class="layui-input-block widths">
                <select name="cid" lay-verify="required">
                    <c:forEach items="${clist}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>consumption</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="money" value="" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>cocontent</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="content" value="" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block widths">
                <input type="hidden" name="time" class="layui-input time" readonly>
                <%--  <input type="hidden" name="roomId" class="layui-input"  readonly>
                  <input type="hidden" name="cid" class="layui-input"  readonly>--%>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="update_Pwd" lang>Submission</div>
                <div class="layui-btn" onclick="delanser()" lang>delete</div>
            </div>
        </div>
    </form>
</div>

<!--新增消费类型部分 -->
<div id="addType_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>type</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="name" value="" class="layui-input " lay-verify="required" style="width: 70%">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="addType_Pwd" lang>Submission</div>
            </div>
        </div>
    </form>
</div>

<!--修改消费类型部分 -->
<div id="updateType_apar" class="layui-fluid">
    <table class="layui-table">
        <tr>
            <th lang>serial</th>
            <th lang>name</th>
            <th lang>status</th>
            <%-- <th lang>operation</th>--%>
        </tr>
        <c:forEach items="${typelist}" var="items">
            <tr>
                <th>${items.id}</th>
                <th>${items.name}</th>
                <th lang style="color: #00be67" onclick="ustatus(${items.id})">delete</th>
                    <%-- <c:if test="${items.status==1}">
                         <th lang style="color: #00be67" onclick="ustatus(${items.id},2)">Prohibit</th>
                     </c:if>
                     <c:if test="${items.status==2}">
                         <th lang style="color: #8a3104" onclick="ustatus(${items.id},1)">Enable</th>
                     </c:if>--%>
                    <%-- <th>
                         <div class="layui-btn layui-btn-sm" onclick="updates(${item.id})" lang>amended</div>
                     </th>--%>
            </tr>
        </c:forEach>
    </table>
</div>

<script>

    /* 分页要用的 */
    $(".tcdPageCode").createPage({

        pageCount:${lists.totalPage},
        current:${lists.currentPage},
        backFn: function (p) {
            location.href = "${ctx}/Order/todaily.do?currentPage=" + p;
        }
    });
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
                type: 'date'
            });
        })

        $(document).on('click', '.todate', function () {
            $('this').addCss('bj');
        });

        $(document).on('click', '.toadd', function () {
            // add();
            index = layer.open({
                type: 1,
                area: ['40%', '60%'],
                anim: 2,
                title: '添加',
                maxmin: true,
                shadeClose: true,
                content: $("#add_apar")
            });
            form.render('select');
        });


        function add() {
            index = layer.open({
                type: 1,
                area: ['40%', '60%'],
                anim: 2,
                title: '修改',
                maxmin: true,
                shadeClose: true,
                content: $("#update_apar")
            });
        }

        function type() {
            index = layer.open({
                type: 1,
                area: ['40%', '50%'],
                anim: 2,
                title: '新增消费类型',
                maxmin: true,
                shadeClose: true,
                content: $("#addType_apar")
            });
        }

        function updatetype() {
            index = layer.open({
                type: 1,
                area: ['40%', '50%'],
                anim: 2,
                title: '新增消费类型',
                maxmin: true,
                shadeClose: true,
                content: $("#updateType_apar")
            });
        }


        $(document).on('click', '.touptype', function () {
            updatetype();
        });
        $(document).on('click', '.toup', function () {
            getData($(this))
        });

        window.updates = function (obj) {
            var list;
            var id = obj;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/dayById.do',       //地址 type 带参数
                data: "id=" + id,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {// 不出现异常 进行立面方
                    console.log(result)
                    list = result;
                },
            })
            form.val('testss', {
                "id": list.id,
                "roomNumber": list.roomNumber,
                "typeName": list.typeName,
                "money": list.money,
                "content": list.content,
                "time": list.time
                /* "roomId":list.roomId,
                 "cid":list.cid*/
            });
            add();
            form.render();
        }


        $(document).on('click', '.totype', function () {
            type();
        });

        form.on('submit(add_Pwd)', function (obj) {
            var param = obj.field;
            console.log(param);
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/dailyconsumption.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("新增失败！" + ' \n ' + "Failed to add");                     //提示框
                        document.getElementById("money").value = "";     //这个id的文本框的值 将会清空
                        document.getElementById("money").focus();      // 给这个id的文本框提供焦点

                    } else {
                        alert("新增成功！" + ' \n ' + "succeeded");
                        var time = getNowFormatDate();
                        location.href = '${ctx}/Order/todaily.do';
                    }
                }
            })
            /* var time=document.getElementById("checkinTime").value;
             var number=document.getElementById("checkinNumber").value;
             var roomId=document.getElementById("id").value;*/

        });

        form.on('submit(update_Pwd)', function (obj) {
            var param = obj.field;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/dailyconsumption.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("新增失败！" + ' \n ' + "Failed to add");                     //提示框

                    } else {
                        alert("新增成功！" + ' \n ' + "succeeded");
                        var time = getNowFormatDate();
                        location.href = '${ctx}/Order/todaily.do';

                    }
                }
            });
        });


        form.on('submit(addType_Pwd)', function (obj) {
            var param = obj.field;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/addType.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("新增失败！" + ' \n ' + "Failed to add");                     //提示框
                    } else {
                        alert("新增成功！" + ' \n ' + "succeeded");
                        location.href = '${ctx}/Order/todaily.do';
                    }
                }
            });
        })

        form.on('submit(search)', function () {
            var time = document.getElementById("time").value;
            location.href = "${ctx}/Order/todaily.do?time=" + time;
        });

        //修改消费状态
        window.ustatus = function (value) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/updateType.do',       //地址 type 带参数
                data: "id=" + value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("操作失败！" + ' \n ' + "Failed");                     //提示框
                    } else {
                        alert("操作成功！");
                        window.location = '${ctx}/Order/todaily.do';
                    }
                }
            });
        }


        window.delanser=function () {
            /*  var questionId=document.getElementById("anserId").val();*/
            var question=$("#id").val();
            if (question.trim().length!=0) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/deletedaily.do',       //地址 type 带参数
                    data: "id="+question,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方

                        window.location="${ctx}/Order/todaily.do";
                    }
                })
            }
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
    })
</script>
</html>
