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
                <h3 style="text-align: center;">查看已点商品的房间号</h3>
            </div>
        </div>
        <c:if test="${listC.size()==0}">
            <div class="span12">
                <div class="row-fluid" >
                    <div class="span5"style="margin-left: 400px">
                        无商品消费
                    </div>

                </div>
            </div>
        </c:if>
        <c:if test="${listC.size()!=0}">
        <c:forEach items="${listC}" var="item">
        <div class="span12">
                <div class="row-fluid" >

                    <div class="span4">
                        <label class="labelroomnumber"> 商品名称：</label>
                        <input id="name" class="textone inputone" style="height: 35px;width: 150px"value="${item.commodityName}"
                               type="text">
                    </div>
                    <div class="span4">
                        <label class="labelroomnumber"> 商品数量：</label>
                        <input id="number" class="textone inputone"style="height: 35px;width: 150px" value="${item.consumptionNumber}"
                               type="text">
                    </div>
                    <div class="span4">
                        <label class="labelroomnumber"> 总价钱：</label>
                        <input id="money" class="textone inputone"style="height: 35px;width: 150px" value="${item.consumptionMoney}"
                               type="text">

                    </div>
            </div>
        </div>
        </c:forEach>
        </c:if>

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