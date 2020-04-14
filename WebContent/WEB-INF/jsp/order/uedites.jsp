<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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

    <script type="text/javascript" src="${ctx}/js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/js/utf8-jsp/ueditor.all.js"></script>
</head>
<style>
body{
    height: 1000px;
    width: 1400px;
}
    #addFlie_apar,form,#layui-form-item{
        height: 100%;
        width: 100%;
    }
</style>


<body>


<!--新增问题部分 -->
<div id="addFlie_apar" >
    <form action="${ctx}/Order/upanser.do"  method="post" id="formimg" >
        <input type="hidden" name="questionId" id="questionId" value="${po.questionId}">
        <input type="hidden" name="id" id="id" value="${po.id}">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>anser</span>：</label>
            <div class="layui-input-block widths">
                <!--在需要使用编辑器的地方插入textarea标签 -->
                <textarea name="answer" id="description">${po.answer}</textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <input type="submit" value="提交" class="file layui-btn">
                <div class="layui-btn" onclick="delansers(${po.id})" lang>delete</div>
            </div>

        </div>
    </form>
</div>
<script type="text/javascript">
    window.onload = function()
    {
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

   window.checkfiless=function () {
       var imgtype=["jpg","png","gif","tif","bmp"];
       var videotype=["avi","mp4","mpg","mov"];
       var files = document.getElementById("imgs").files;
       var type;
       console.log(files)
       for(var i=0; i< files.length; i++){
           var names=files[i].name;
           var sizes=files[i].size/1024/1024;
           type=names.substring(names.lastIndexOf(".")+1,names.length);
           var index=imgtype.indexOf(type);
           if (index==-1) {
               alert("上传图片格式不正确")
               return false;
           }
           if (sizes>5){
               alert("上传图片过大")
               return false;
           }

       }
       var video = document.getElementById("video").files;
       for(var i=0; i< video.length; i++){
           var names=video[i].name;
           var sizes=video[i].size/1024/1024;
           type=names.substring(names.lastIndexOf(".")+1,names.length);
           var index=videotype.indexOf(type);
           if (index==-1) {
               alert("上传视频格式不正确")
               return false;
           }
           if (sizes>11){
               alert("上传视频过大")
               return false;
           }
       }
       return true;

   }

    window.delansers = function (value) {
        var questionId=document.getElementById("questionId").value;
        var ok=window.confirm("确定删除此数据吗");
        if (!ok){
            return;
        }
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/deleteAnser.do',       //地址 type 带参数
                data: "id=" + value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方

                    window.location = "${ctx}/Order/anserByQid.do?qid="+questionId
                }
            })
    }
</script>
</body>

</html>
