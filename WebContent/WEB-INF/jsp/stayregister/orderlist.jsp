<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title></title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
    <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
    <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="${ctx}/bootstrap/js/bootstrap.js"></script>

    <style>

        .container{
            margin-top: 10px;
        }


        .labelroomnumber{
            position: relative;
            font-size: 17px;
            float: left;
            margin-top: 15px;
        }

        .marginrightone{
            margin-right: 33px;
        }

        .marginrighttwo{
            margin-right: 16.5px;
        }

        .marginrightthree{
            margin-right: 43px;
        }

        .textone{
            margin-top:12px;
        }

        .inputone{
            width:54.2%;
            float:left;
        }

        .inputtwo{
            width:46.8%;
        }

        .inputthree{
            width:47.8%;
        }

        .cboone{
            margin-top:10px;
            height: 27px;
        }

        .margin-top-one{
            margin-top: -10px;
        }

        .margin-top-two{
            margin-top: -20px;
        }

        .textwidth{
            width: 138px;
        }

        .radiusone{
            margin-left: -4px;
        }

        @media(min-width:731px) and (max-width:767px){
            .inputthree{
                width: 50.5%;
            }
        }

        @media(min-width:550px) and (max-width:730px){
            .inputtwo{
                width: 46.2%;
            }
            .inputthree{
                width: 49.2%;
            }
        }


        @media(min-width:431px) and (max-width:550px){
            .inputtwo{
                width: 43.2%;
            }
            .inputthree{
                width: 47.5%;
            }
        }

        @media(min-width:366px) and (max-width:430px){
            .inputtwo{
                width: 40.2%;
            }
            .inputthree{
                width: 46%;
            }
        }

        @media(min-width:285px) and (max-width:366px){
            .inputtwo{
                width: 37.2%;
            }
            .inputthree{
                width: 44%;
            }
        }

        @media(min-width:237px) and (max-width:285px){
            .inputtwo{
                width: 30%;
            }
            .inputthree{
                width: 40%;
            }
        }

        .yansered{
            color:red;
        }
    #number{
        height:36px;
        line-height:36px;
        vertical-align:middle;
    }
    </style>

</head>


<body >
<div class="container">

    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
        <div class="span9 margin-top-one">
            <div class="row-fluid">
                <h3 style="text-align: center;">查看订单详情</h3>
            </div>
        </div>
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label class="labelroomnumber" style="font-size:15px">订单号：</label>
                        <input id="codeNumberid" name="codeNumberid"style="width:100%;height:27px;" type="text" value="${orderPo.orderID}" readonly="readonly">
                    </div>
                    <div class="span3">
                        <label class="labelroomnumber" style="font-size:15px">订单状态：</label>
                        <c:if test="${orderPo.status==0}">
                            <input id="statusid" name="status"
                                   style="width:100%;height:27px;" type="text" value="已预订"readonly="readonly">
                        </c:if>
                        <c:if test="${orderPo.status==1}">
                            <input id="statusid" name="status"
                                   style="width:100%;height:27px;" type="text" value="已入住"readonly="readonly">
                        </c:if>
                        <c:if test="${orderPo.status==2}">
                            <input id="statusid" name="status"
                                   style="width:100%;height:27px;" type="text" value="已取消"readonly="readonly">
                        </c:if>
                        <c:if test="${orderPo.status==3}">
                            <input id="statusid" name="status"
                                   style="width:100%;height:27px;" type="text" value="已退房"readonly="readonly">
                        </c:if>
                    </div>
                    <div class="span3">
                        <label class="labelroomnumber" style="font-size:15px">平台名称：</label>
                        <input id="platformId" name="pliatfromId"
                               style="width:100%;height:27px;" type="text"value="${orderPo.pname}"readonly="readonly">
                    </div>

                </div>
            </div>

    </div>

    <div class="span4" style="text-align:center;">
        <div class="row-fluid">
            <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;">
                <button class="btn btn-warning" type="button" onclick="deletefunction()">
                    <li class="icon-remove icon-white"></li>返回</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function deletefunction(){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do';
    }
    </script>
</body>
</html>