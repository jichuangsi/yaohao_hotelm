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
    <%--<!-- 配置文件 -->
    <script type="text/javascript" src="${ctx}/js/ckeditor/config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script>--%>
</head>
<style>
    h4 {
        white-space: normal;
        word-wrap: break-word;
        width: 100%;
    }

    #addAnser_apar,#addFlie_apar{
        display: none;
    }

    .textarea {
        font-size: 16px;
        line-height: 24px;
        padding: 2px;
        overflow-x: hidden;
        overflow-y: auto;
        width: 90%;
        height: 200px;
    }
    .comment_list {
        padding-top:40px;
        width:800px;
        margin:0 auto;
        overflow-x: hidden;
        overflow-y: auto;
    }
    .comment_content {
        margin-top:10px;
        font-size:16px;
        overflow-x: hidden;
        overflow-y: auto;
        white-space: normal;
        word-wrap: break-word;
    }
    .layui-icon {
        font-size: 10px;

    }
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
    h2 {
        white-space: normal;
        word-wrap: break-word;
        width: 100%;
    }
    .imgfile{
       max-height: 100%;
        max-width: 100%;
        margin: 0 auto;
    }
    img{
        max-width:90%;
        margin-left: 10%;
    }
    video{
        width: 100%;
    }
</style>
<body>

<div class="x-body">
    <div class="layui-row">
        <div class="layui-col-md6 gz layui-col-xs12 layui-col-md-offset3" >
            <input type="hidden" name="questionId" id="questionId" value="${qid}">
            <div class="comment_content" style="font-size: 17px;font-weight: bold">${qid}:${name}</div>
        </div>
        <!-- 放文字 -->
        <div class="layui-row">
            <div class="layui-col-md6 gz layui-col-xs12  layui-col-md-offset3">
            <c:forEach items="${list.result}" var="items" varStatus="st">
                <div class="comment_content">
                    <span style="font-weight: bold"  onclick="updateAnser(${items.id})">${st.index+1}.</span>
                        ${items.answer}</div>
                <hr>
            </c:forEach>
            </div>
        </div>
        <!-- 放视频 -->
       <%-- <c:if test="${video.size()>0}">
        <div class="layui-row">
            <!-- 循环这里的  carousel-item-->
            <div class="layui-col-md6 gz layui-col-xs12  layui-col-md-offset3">
                <div class="layui-carousel" id="test1" lay-filter="test1">
                    <div carousel-item>
                        <c:forEach items="${video}" var="video">
                        <div onclick="delvideo(${video.id})">
                            <video width="100%" height="100%" controls="controls" autobuffer="autobuffer" loop="loop"
                                   class="vido">
                                <source src="..${video.upload}" type="video/mp4">
                                </source>
                                您的浏览器不支持 video 标签
                            </video>

                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
        </c:if>
        <!-- 放图片 -->
        <c:if test="${img.size()>0}">
        <div class="layui-row">
            <!-- 循环这里的  carousel-item-->
            <div class="layui-col-md6 gz layui-col-xs12  layui-col-md-offset3">
                <div class="layui-carousel test2"  lay-filter="test1">
                    <div carousel-item>
                        <c:forEach items="${img}" var="img">
                            <div style="text-align:center">
                                <img src="..${img.qimg}" class="imgfile" alt=""/>
                                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" style="float: right"
                                        onclick="delimg(${img.id})"><i class="layui-icon"></i></button>
                            </div>

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        </c:if>--%>
        <div class="layui-row">
            <!-- 循环这里的  carousel-item-->
            <div class="layui-col-md6 gz layui-col-xs12  layui-col-md-offset3">
                    <a style="float: right;left: 50%;width: 100%" href="#" class="layui-btn layui-btn-sm"
                       onclick="addAnser(${qid})" lang>add</a>
            </div>
        </div>
    </div>
    <div class="span11">
        <div class="row-fluid">
            <div class="tcdPageCode" style="text-align:center;"></div>
        </div>
    </div>
</div>




<%--<!--修改问题答案部分 -->
<div id="addAnser_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="test2">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>anser</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="id" id="anserId" value="">
                <input type="hidden" name="questionId" id="qId" value="">
               &lt;%&ndash; <textarea class="textarea" name="answer" lay-verify="required" autoHeight="true"></textarea>&ndash;%&gt;
                <textarea name="answer" id="descriptions"/></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <div class="layui-btn" lay-submit lay-filter="addAnser_Pwd" lang>Submission</div>
                <div class="layui-btn" onclick="delanser()" lang>delete</div>
            </div>

        </div>
    </form>
</div>

<!--新增问题部分 -->
<div id="addFlie_apar" class="layui-fluid">
    <form action="${ctx}/Order/uploadVideo.do" enctype="multipart/form-data" method="post" id="formimg" onsubmit="return checkfile()">
        <input type="hidden" name="qqId" id="qqId" value="${qid}">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>anser</span>：</label>
            <div class="layui-input-block widths">
                <textarea class="textarea" id="titles" name="titles" autoHeight="true"></textarea>
                   <!--在需要使用编辑器的地方插入textarea标签 -->
                 &lt;%&ndash;  <textarea name="titles" id="description"/></textarea>&ndash;%&gt;
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>img</span>：</label>
            <a href="javascript:;" class="file">选择文件
                <input type="file" name="img" id="imgs" multiple="multiple">
            </a>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>video</span>：</label>
            <a href="javascript:;" class="file">选择文件
                <input type="file" name="video" id="video" multiple="multiple">
            </a>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <input type="submit" value="提交" class="file layui-btn">

            </div>

        </div>
    </form>
</div>--%>
<script>

    console.log(${listimg})
    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${list.totalPage},
        current:${list.currentPage},
        backFn: function (p) {
            location.href = "${ctx}/Order/question.do?currentPage=" + p;
        }
    });

</script>

<script>
    /*var my;
    window.onload = function()
    {
        CKEDITOR.replace( 'description');
    };
    window.onload = function()
    {
        my=CKEDITOR.replace( 'descriptions');
    };*/
    layui.use(['form', 'element'], function () {
        var form = layui.form,
            element = layui.element,
            carousel = layui.carousel;

        //建造实例视频
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            ,autoplay:false
            //,anim: 'updown' //切换动画方式
        });
        carousel.on('change(test1)', function(obj) {
            var video = document.querySelectorAll('.vido');
            video[obj.prevIndex].pause();
        });
        //建造实例图片
        carousel.render({
            elem: '.test2'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
        element.render();

        function AnserFlie() {
            index = layer.open({
                type: 1,
                area: ['40%', '65%'],
                anim: 2,
                title: '修改问题回答',
                maxmin: true,
                shadeClose: true,
                content: $("#addFlie_apar")
            });
        }

        window.addAnser = function (value) {
          /*  AnserFlie();*/
          window.location='${ctx}/Order/uedit.do?qId='+value;
        }


        function Anser() {
            index = layer.open({
                type: 1,
                area: ['80%', '60%'],
                anim: 2,
                title: '修改问题回答',
                maxmin: true,
                shadeClose: true,
                content: $("#addAnser_apar")
            });
        }

        window.updateAnser = function (value) {
            window.location='${ctx}/Order/getAnser.do?id=' + value;

        }


        form.on('submit(addAnser_Pwd)', function (obj) {
            var param = obj.field;
            console.log(param);
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/upanser.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("失败！" + ' \n ' + "Failed");                     //提示框
                    } else {
                        alert("成功！" + ' \n ' + "succeeded");
                        window.location = "${ctx}/Order/anserByQid.do?qid="+param.questionId;
                    }
                }
            })

        });

        window.delanser = function () {
            var questionId=document.getElementById("questionId").value;
            var ok=window.confirm("确定删除此数据吗");
            if (!ok){
                return;
            }
            var question = $("#anserId").val();
            if (question.trim().length != 0) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/deleteAnser.do',       //地址 type 带参数
                    data: "id=" + question,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方

                        window.location = "${ctx}/Order/anserByQid.do?qid="+questionId
                    }
                })
            }
        }


        function upolad() {
            index = layer.open({
                type: 1,
                area: ['50%', '60%'],
                anim: 2,
                title: '新增问题',
                maxmin: true,
                shadeClose: true,
                content: $("#addFlie_apar")
            });
        }

        window.upoladfile = function () {
            upolad();
        }

      window.checkfile=function () {
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


        var loadstr = '';

        function videoByqid(vaule) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/videoByQid.do',       //地址 type 带参数
                data: "qid=" + vaule,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {
                    var list = result;
                    loadstr = ''
                    /* $.each(list, function (index, item) {
                         loadstr+= '<video width="100%" height="100%"  controls="controls" autobuffer="autobuffer"  autoplay="autoplay" loop="loop">';
                         loadstr+='<source src="..'+item.upload+'" type="video/mp4">';
                         loadstr+='</source></video>';
                     })*/
                    loadstr += '<div class="layui-carousel testvideo center-block">';
                    loadstr += '<div carousel-item>';
                    $.each(list, function (index, item) {
                        loadstr += '<div style="text-align:center">';
                        loadstr += '<video width="100%" height="100%"  controls="controls" autobuffer="autobuffer"  loop="loop">';
                        loadstr += '<source src="..'+item.upload+'" type="video/mp4">';
                        loadstr += '</source></video>';
                        loadstr += '</div>';

                    })
                    loadstr += '</div>';
                    loadstr += '</div>';

                }
            });
        }


        window.layers = function (values) {
            videoByqid(values)
            layer.open({
                type: 1,
                offset: ['90px', '250px'],
                title: '播放视频',
                content: loadstr,
            });
            carousel.render({
                elem: '.testvideo',
                width: '500px',
                autoplay:false,
                arrow: 'always'//,anim: 'updown' //切换动画方式
            });

        }
        carousel.render();

        var str = '';

        function imgByqid(vaule) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/imgByQid.do',       //地址 type 带参数
                data: "qid=" + vaule,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {
                    var list = result;
                    str = '';
                    str += '<div class="layui-carousel testimg">';
                    str += '<div carousel-item>';
                    $.each(list, function (index, item) {
                        var img = new Image();
                        img.src = '..' + item.qimg;
                        str += '<div style="text-align:center"><img src="..' + item.qimg + '" width="' + img.width + '" height="' + img.height + '" alt=""></div>';

                    })
                    str += '</div>';
                    str += '</div>';
                }
            })
        }

        /* $('.imgs').click(function(obj) {*/
        window.imgs = function (values) {
            imgByqid(values);
            layer.open({
                type: 1,
                offset: '100px',
                title: '浏览图片',
                content: str,
            });
            carousel.render({
                elem: '.testimg',
                width: '400px',
                arrow: 'always'//,anim: 'updown' //切换动画方式
            });

        }
        carousel.render();


        window.delvideo=function (value) {
            var ok=window.confirm("确定删除此视频吗");
            if (!ok){
                return;
            }
            var questionId=document.getElementById("questionId").value;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/delvideo.do',       //地址 type 带参数
                data: "id=" + value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {
                    if (result!=1){
                        alert("删除失败")
                    }else {
                        window.location = "${ctx}/Order/anserByQid.do?qid="+questionId;
                    }
                }
            })
        }
        window.delimg=function (value) {
            var ok=window.confirm("确定删除此图片吗");
            if (!ok){
                return;
            }
            var questionId=document.getElementById("questionId").value;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/delimg.do',       //地址 type 带参数
                data: "id=" + value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {
                    if (result!=1){
                        alert("删除失败")
                    }else {
                        window.location = "${ctx}/Order/anserByQid.do?qid="+questionId;
                    }
                }
            })
        }


    })

</script>
</body>

</html>
