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
    .gz {
        padding: 20px;
        line-height: 30px;
        font-size: 16px;
    }

    h2 {
        white-space: normal;
        word-wrap: break-word;
        width: 100%;
    }

    .layui-colla-title {
        margin: 0 auto;
        font-size: 14px;
        overflow: hidden;
        height: auto;
    }

    #addType_apar, #addAnser_apar, #addFlie_apar {
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
</style>
<body>
<div class=" layui-row ht-box">
    <div class="layui-btn layui-btn-sm layui-btn-normal" onclick="addQuestion()" lang>add</div>
   <%-- <div class="layui-btn layui-btn-sm layui-btn-normal" onclick="upoladfile()" lang>add</div>--%>
    <div class="layui-row layui-form">
        <div class="layui-collapse" id="list">
            <c:forEach items="${list.result}" var="item">
                <div class="layui-colla-item">
                    <h4 class="layui-colla-title">
                        <div class="layui-col-xs8 " style="padding-left: 15px;">
                            <h2 style="font-size: 1rem;" onclick="anserlist(${item.qid})"><span style="color: black;font-weight: bold;font-size: 18px">${item.qid}.</span>${item.title}</h2>
                            <a style="margin-right: 50%;" href="#" class="layui-btn layui-btn-sm"
                               onclick="updates(${item.qid})" lang>amended</a>
                        </div>
                    </h4>
                   <%-- <div class="layui-colla-content">
                        <c:forEach items="${item.alist}" var="items" varStatus="st">
                            <div class="layui-row">
                                <input type="hidden" name="questionId" id="questionId" value="${item.qid}">
                                <input type="hidden" name="id" id="id" value="${items.id}">
                                <div class="answer" onclick="updateAnser(${items.id})">${items.answer}</div>
                            </div>
                        </c:forEach>
                        <div class="layui-row">
                            <input type="hidden" name="questionIds" value="${item.qid}">
                            <div class="layui-btn layui-btn-sm layers" onclick="layers(${item.qid})" id="layer"><i
                                    class="layui-icon layui-icon-play"></i></div>
                            <div class="layui-btn layui-btn-sm imgs" id="img" onclick="imgs(${item.qid})"><i
                                    class="layui-icon layui-icon-picture"></i></div>
                            <a style="margin-right: 50%;" href="#" class="layui-btn layui-btn-sm"
                               onclick="addAnser(${item.qid})" lang>add</a>
                        </div>

                    </div>--%>
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

<!--新增问题部分 -->
<div id="addType_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="testss">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>question</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="id" id="question" value="">
                <input type="hidden" name="hotelm" value="">
                <textarea class="textarea" name="title" lay-verify="required" autoHeight="true"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <div class="layui-btn" lay-submit lay-filter="addType_Pwd" lang>Submission</div>
                <div class="layui-btn" onclick="delquestion()" lang>delete</div>
            </div>

        </div>
    </form>
</div>


<!--新增问题答案部分 -->
<div id="addAnser_apar" class="layui-fluid">
    <form class="layui-form" autocomplete="off" lay-filter="test2">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>anser</span>：</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="id" id="anserId" value="">
                <input type="hidden" name="questionId" id="qId" value="">
                <textarea class="textarea" name="answer" lay-verify="required" autoHeight="true"></textarea>
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
   <%-- <form class="layui-form" autocomplete="off"  lay-filter="test2">--%>
    <form action="${ctx}/Order/uploadVideo.do" enctype="multipart/form-data" method="post" id="formimg">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>question</span>：</label>
            <div class="layui-input-block widths">
                <textarea class="textarea" id="titles" name="titles" lay-verify="required" autoHeight="true"></textarea>
            </div>
        </div>
        <%--<div class=" layui-btn" id="upload">上传图片</div>
        <div class=" layui-btn" id="uploadvideo">上传视频</div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>img</span>：</label>
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <input type="file" id="imgs" name="img" multiple="multiple"/><br/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>video</span>：</label>
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <input type="file" name="video" id="video" multiple="multiple"/><br/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-right: 20%">
                <input type="submit" value="上传">
                <div class="layui-btn" onclick="delquestion()" lang>delete</div>
            </div>

        </div>
    </form>
</div>
<script>
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
    layui.use(['form', 'element'], function () {
        var form = layui.form,
            element = layui.element,
            carousel = layui.carousel;


        element.render();
        window.addQuestion = function () {
            layer.prompt({
                formType: 2,
                value: '',
                title: '请输入值',
                area: ['450px', '300px'] //自定义文本域宽高
            }, function (value, index, elem) {
                console.log(value.length)
                console.log(value.trim().length)
                if (value == null || value.trim().length == 0) {
                    alert("格式不正确")
                    return;
                }
                $.ajax({
                    cache: false,
                    type: "post",
                    url: "${ctx}/Order/addquestion.do",
                    data: "title=" + value,
                    async: false,
                    success: function (res) {
                        window.location = "${ctx}/Order/question.do"
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

        window.updates = function (value) {
            var list;
            $.ajax({
                cache: false,
                type: "post",
                url: "${ctx}/Order/getquestion.do",
                data: "id=" + value,
                async: false,
                success: function (res) {
                    list = res;
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
                        window.location = "${ctx}/Order/question.do";
                    }
                }
            })

        });

        window.delquestion = function () {
            /*  var questionId=document.getElementById("question").val();*/
            var questionId = $("#question").val();
            if (questionId.trim().length != 0) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/deleteQuestions.do',       //地址 type 带参数
                    data: "id=" + questionId,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        if (result != 1) {
                            alert("失败！" + ' \n ' + "Failed");                     //提示框
                        } else {
                            alert("成功！" + ' \n ' + "succeeded");
                            window.location = "${ctx}/Order/question.do";
                        }
                    }
                })
            }
        }


        window.addAnser = function (questionId) {
            layer.prompt({
                formType: 2,
                value: '',
                title: '请输入值',
                area: ['450px', '300px'] //自定义文本域宽高
            }, function (value, index, elem) {
                /*var questionId=$("#questionId").val();*/
                /*var questionId=document.getElementById("questionId").val();*/
                if (value == null || value.trim().length == 0) {
                    alert("格式不正确")
                    return;
                }
                $.ajax({
                    cache: false,
                    type: "post",
                    url: "${ctx}/Order/addAnser.do",
                    data: "title=" + value + "&questionId=" + questionId,
                    async: false,
                    success: function (res) {
                        window.location = "${ctx}/Order/question.do"
                    }
                })
            })
        }


        function Anser() {
            index = layer.open({
                type: 1,
                area: ['40%', '50%'],
                anim: 2,
                title: '修改问题回答',
                maxmin: true,
                shadeClose: true,
                content: $("#addAnser_apar")
            });
        }

        window.updateAnser = function (value) {
            var list;
            $.ajax({
                cache: false,
                type: "post",
                url: "${ctx}/Order/getAnser.do",
                data: "id=" + value,
                async: false,
                success: function (res) {
                    list = res;
                    form.val('test2', {
                        "id": list.id,
                        "answer": list.answer,
                        "questionId": list.questionId
                    });
                    Anser();
                    form.render();

                }
            })
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
                        window.location = "${ctx}/Order/question.do";
                    }
                }
            })

        });

        window.delanser = function () {
            /*  var questionId=document.getElementById("anserId").val();*/
            var question = $("#anserId").val();
            if (question.trim().length != 0) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/deleteAnser.do',       //地址 type 带参数
                    data: "id=" + question,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方

                        window.location = "${ctx}/Order/question.do";
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
        form.on('submit(addFile_Pwd)', function (obj) {
            var param = obj.field;
            console.log(param);
            var titles = document.getElementById("titles").value;
            if (titles.trim().length <= 0) {
                alert("问题题不能为空！");
                return;
            }
            var img = document.getElementById("img").files[0];
            var video = document.getElementById("video").files[0];
            var formData = new FormData();
            formData.append("titles", titles);
            formData.append("img", img);
            formData.append("video", video);
            console.log(formData)
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/uploadVideo.do',       //地址 type 带参数
                data: "titles=" + titles + "&img=" + img + "&video=" + video,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        alert("失败！" + ' \n ' + "Failed");                     //提示框
                    } else {
                        alert("成功！" + ' \n ' + "succeeded");
                        window.location = "${ctx}/Order/question.do";
                    }
                }
            })

        });
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

      window.anserlist=function(value){
            window.location='${ctx}/Order/anserByQid.do?qid='+value;
        }

       /* layui.upload.render({
            elem: "#upload",
            auto: false,
            multiple: true,
            accept: 'file',
            choose: function(obj) {
                console.log(obj)
                files = obj.pushFile();
                var count = 0;
                for (var i in files) {
                    count++
                }
                // layer.msg('一共选择' + count + '张图片!');
                var form = new FormData();
                for (var i in files) {
                    form.append("file", files[i]);
                }

                console.log(form);
            // form.append("test", $("#test").val())
                $.ajax({
                    type: "post",
                    url:"${ctx}/Order/uploadVideo.do",
                    contentType: false,
                    processData: false,
                    async: true,
                    data: form,

                    success: function(data) {
                        if (data.code == '0010') {
                            layer.msg('上传成功！一共选择' + count + '张图片');
                        }
                    },
                    error: function(data) {
                        layer.msg(data.msg);
                    }
                });
            }
        });*/

    })

</script>
</body>

</html>
