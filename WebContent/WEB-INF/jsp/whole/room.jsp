<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>房型管理-房间信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>

    <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/css/index.css"/>
    <link rel="stylesheet" href="${ctx}/css/ht.css"/>
    <link rel="stylesheet" href="${ctx}/css/administration.css"/>
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

    #modify_apar {
        display: none;
        margin-top: 10px;
    }
</style>
<body>
<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
    <button class="btn btn-small btn-success"id="enBtn">
        English
    </button>
    <button class="btn btn-small btn-success"id="zhBtn">
        简体中文
    </button>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12">
            <div class="layui-input-inline">
                <input type="text" name="roomNumber" id="roomNumber" placeholder="房号关键字" autocomplete="off"
                       class="layui-input" style="width: 200px;" value="${roomNumber}">
            </div>

            <div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
        </form>
    </div>
   <%-- <div class="layui-col-xs2  layui-col-md-offset6 layui-col-xs-offset6">
        <div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>add</div>
    </div>--%>
</div>
</body>
<!-- 添加 -->
<div id="add_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="add_pwd">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>supplier</span>：</label>
            <div class="layui-input-block widths">
                <select name="supplierID" id="supplierID" lay-verify="required">
                    <c:forEach items="${slist}" var="item">
                        <option value="${item.id}">${item.supplierName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomNumber</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="roomId" value="">
                <input type="text" name="roomNumber" id="room" class="layui-input" value="" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomAmount</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="roomAmount" class="layui-input" value="" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>guestRoomLevelID</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="guestRoomLevelID" id="guestRoomLevelID" value="${glist.id}" class="layui-input">
                <input type="text" name="guestRoomLevel"  id="guestRoomLevel" value="${glist.guestRoomLevel}" class="layui-input"  readonly>
            </div>
        </div>
       <%-- <div class="layui-form-item">
            <label class="layui-form-label"><span lang>guestRoomLevelID</span>：</label>
            <div class="layui-input-block widths">
                <select name="guestRoomLevelID" lay-verify="required">
                    <c:forEach items="${glist}" var="item">
                        <option value="${item.id}">${item.guestRoomLevel}</option>
                    </c:forEach>
                </select>
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>referencePrice</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="referencePrice" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="update_add" lang>Submission</div>
            </div>
        </div>

    </form>

</div>

<div class="x-body">
    <table class="layui-table">
        <thead>
        <tr>
            <th colspan="1">
                <div class="layui-btn layui-btn-sm layui-btn-normal toadd" lang>add</div>
              <%--  <div class="layui-col-xs2  layui-col-md-offset1 layui-col-xs-offset3">

                </div>--%>
            </th>
            <th colspan="6"> </th>
        </tr>
        <tr>
            <th lang>serial</th>
            <th lang>hotelname</th>
            <th lang>roomNumber</th>
            <th lang>roomAmount</th>
            <th lang>guestRoomLevelID</th>
            <th lang>referencePrice</th>
           <th lang>operation</th>
            <%--<th width="200px">备注</th>--%>
        </tr>
        <c:forEach items="${list.result}" var="item">
            <tr>
                <th>${item.id}</th>
                <th>${item.supplierName}</th>
                <th>${item.roomNumber}</th>
                <th>${item.roomAmount}</th>
                <th>${item.guestRoomLevelName}</th>
                <th>${item.referencePrice}</th>
                <th hidden>${item.supplierId}</th>
                <th hidden>${item.guestRoomLevelID}</th>
                <th> <%--onclick="modify(${item.id},${item.supplierName},${item.roomNumber},${item.roomAmount},${item.guestRoomLevelName},${item.referencePrice})"--%>
                    <div class=" layui-btn layui-btn-normal layui-btn-sm tomodify"onclick="modify(this)" lang>amended</div>
                </th>
            </tr>
        </c:forEach>
        </thead>
    </table>
    <div class="span11">
        <div class="row-fluid">
            <div class="tcdPageCode" style="text-align:center;"></div>
        </div>
    </div>
</div>
<script>

    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${list.totalPage},
        current:${list.currentPage},
        backFn:function(p){
            var guestRoomLevelID=document.getElementById("guestRoomLevelID").value;
            var roomNumber=document.getElementById("roomNumber").value;
            location.href="${ctx}/WholeHotel/roomByType.do?id="+guestRoomLevelID+"&currentPage="+p+"&roomNumber="+roomNumber;
        }
    });
    function add() {
        index = layer.open({
            type: 1,
            area: ['40%', '55%'],
            anim: 2,
            title: '添加',
            maxmin: true,
            shadeClose: true,
            content: $("#add_apar")
        });
    }

    /*function modify() {
        index = layer.open({
            type: 1,
            area: ['40%', '45%'],
            anim: 2,
            title: '修改',
            maxmin: true,
            shadeClose: true,
            content: $("#modify_apar")
        });
    }*/
</script>
<script>
    layui.use(['form', 'table', 'element'], function () {
        var form = layui.form,
            element = layui.element,
            table = layui.table;


        element.init();
        form.render()

        $(document).on('click', '.toadd', function () {
            add();
        });

        window.modify=function(value) {
            var id=$(value).parent().parent().find('th')[0].innerHTML;
            var roomNumber=$(value).parent().parent().find('th')[2].innerHTML;
            var supplierName=$(value).parent().parent().find('th')[1].innerHTML;
            var roomAmount=$(value).parent().parent().find('th')[3].innerHTML;
            var guestRoomLevelName=$(value).parent().parent().find('th')[4].innerHTML;
            var referencePrice=$(value).parent().parent().find('th')[5].innerHTML;
            var supplierID=$(value).parent().parent().find('th')[6].innerHTML;
            var guestRoomLevelID=$(value).parent().parent().find('th')[7].innerHTML;
            index = layer.open({
                type: 1,
                area: ['40%', '60%'],
                anim: 2,
                title: '添加',
                maxmin: true,
                shadeClose: true,
                content: $("#modify_apar")
            });
            form.val('mod_pwd',{
                "id":id,
                "roomNumber":roomNumber,
                "supplierName":supplierName,
                "roomAmount":roomAmount,
                "guestRoomLevelName":guestRoomLevelName,
                "referencePrice":referencePrice,
                "supplierID":supplierID,
                "guestRoomLevelID":guestRoomLevelID
            })
        }

        var falg;
        form.on('submit(update_add)', function (obj) {
            var param = obj.field;
            falg= name();
            /*  console.log(falg=name())*/
            if (falg == true) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/RoomSet/add.do',       //地址 type 带参数
                    data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {
                        location.href = '${ctx}/WholeHotel/roomByType.do?id='+param.guestRoomLevelID;// 不出现异常 进行立面方

                    },
                    error: function (data) {
                    }
                })
            }
        });

        form.on('submit(update_modify)', function (obj) {
            var param = obj.field;
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/WholeHotel/update.do',       //地址 type 带参数
                    data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {
                       /* if (result==0){
                            alert("修改失败，请查看入住人数是否小于您本次修改床位数")
                        }*/
                        location.href = '${ctx}/WholeHotel/roomByType.do?id='+param.guestRoomLevelID;// 不出现异常 进行立面方
                        /*if (result != 1) {
                            /!*alert("新增失败"+' \n '+"Failed to add");        *!/             //提示框
                            document.getElementById("room").value = "";     //这个id的文本框的值 将会清空
                            document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                            return false;
                        } else {
                            alert("新增成功！" + ' \n ' + "succeeded");

                            return true;
                        }*/
                    }
                })
        });

        form.on('submit(search)',function () {
            var guestRoomLevelID=document.getElementById("guestRoomLevelID").value;
            var roomNumber=document.getElementById("roomNumber").value;
            location.href="${ctx}/WholeHotel/roomByType.do?id="+guestRoomLevelID+"&roomNumber="+roomNumber;
        })
    })

   /* $('#room').blur(function () {*/
    function name() {
        var order = document.getElementById("room").value;
        var supplierID = document.getElementById("supplierID").value;
        $.ajax({
            cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/RoomSet/YZ.do',       //地址 type 带参数
            data: "roomNumber=" + order + "&supplierID=" + supplierID,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async: false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                if (result >= 1) {
                    alert("房号重复！" + ' \n ' + "Duplicate room number");                     //提示框
                    document.getElementById("room").value = "";     //这个id的文本框的值 将会清空
                    document.getElementById("room").focus();      // 给这个id的文本框提供焦点
                    falg=false;
                    return falg;
                } else {
                    falg=true;
                    return falg;
                }
            },
            error: function (data) {
            }
        })
        return falg;
    }
</script>

<!-- 修改 -->
<div id="modify_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>supplier</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="supplierID" class="layui-input" value="">
                <input type="text" name="supplierName" id="supplierName" class="layui-input" readonly value="" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomNumber</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="id" id="id" value="">
                <input type="text" name="roomNumber" id="number" class="layui-input" value="" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>roomAmount</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="roomAmount" id="roomAmount" class="layui-input"value="" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>guestRoomLevelID</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="guestRoomLevelID"class="layui-input" value="" >
                <input type="text" name="guestRoomLevelName" id="guestRoomLevelName" readonly class="layui-input" value="" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>referencePrice</span>：</label>
            <div class="layui-input-block widths">
                <input type="text" name="referencePrice" id="referencePrice" class="layui-input " lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="update_modify" lang>amended</div>
            </div>
        </div>
    </form>

</div>
</html>