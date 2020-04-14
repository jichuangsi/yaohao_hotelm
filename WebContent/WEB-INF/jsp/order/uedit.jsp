<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>酒店常见问题-回答</title>
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
    <%--<!-- 配置文件 -->
    <script type="text/javascript" src="${ctx}/js/ckeditor/config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script>--%>
    <script type="text/javascript" src="${ctx}/js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/js/utf8-jsp/ueditor.all.js"></script>
    <script type="text/javascript" src="${ctx}/js/utf8-jsp/ueditor.parse.js"></script>
</head>
<style>
    .file {
        position: relative;
        display: inline-block;
        background:  #009688;
        border: 1px solid  #009688;
        border-radius: 4px;
        padding: 4px 12px;
        overflow: hidden;
        color:white;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
    .file:hover {
        background: #009688;
        border-color: #009688;
        color:white;
        text-decoration: none;
    }
</style>

<body>


<!--新增问题部分 -->
<div id="addFlie_apar" class="layui-fluid">
    <form action="${ctx}/Order/upload.do" enctype="multipart/form-data" method="post" id="formimg">
        <input type="hidden" name="qqId" id="qqId" value="${qId}">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>anser</span>：</label>
            <div class="layui-input-block widths">
                <!--在需要使用编辑器的地方插入textarea标签 -->
                <textarea name="titles" id="description"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <input type="submit" value="提交" class="file layui-btn">

            </div>

        </div>
    </form>
</div>
<script type="text/javascript">

    window.onload = function()
    {
       /* var ue=UE.getEditor("description");*/
        var editor =new UE.ui.Editor();
        editor.render("description");

        //根据不同action上传图片和附件
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function(action) {
            if (action == 'uploadImage') {
                return '${ctx}/Order/uploadImg.do';
            } else if (action == 'uploadVideo') {
                return '${ctx}/Order/uploadVideo.do';
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        }
    };

</script>
</body>

</html>
