<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title></title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
    <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
    <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css" type="text/css"></link>

    <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>


    <!-- 右键功能  start  .css -->
    <%-- <link rel="stylesheet" href="${ctx}/css/youjian/default.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/css/youjian/font-awesome.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/css/youjian/github-light.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/css/youjian/highlight-8.6.default.min.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/css/youjian/normalize.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/css/youjian/styles.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/css/youjian/toastr.css" type="text/css"></link> --%>
    <!-- 右键功能  end  .css -->

    <!-- 右键功能  start  .js -->
    <%-- <script type="text/javascript" src="${ctx}/js/youjian/BootstrapMenu.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/youjian/highlight-8.6.default.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/youjian/scale.fix.js"></script>
    <script type="text/javascript" src="${ctx}/js/youjian/toastr.js"></script> --%>
    <!-- 右键功能  end  .js -->


    <style>

        .container {
            margin-top: 10px;
        }

        .labelroomnumber {
            position: relative;
            font-size: 17px;
            float: left;
            margin-top: 15px;
        }

        .marginrightone {
            margin-right: 33px;
        }

        .marginrighttwo {
            margin-right: 16.5px;
        }

        .marginrightthree {
            margin-right: 43px;
        }

        .textone {
            margin-top: 12px;
        }

        .inputone {
            width: 54.2%;
        }

        .inputtwo {
            width: 46.8%;
        }

        .inputthree {
            width: 46.8%;
        }

        .cboone {
            margin-top: 10px;
            height: 27px;
        }

        .margin-top-one {
            margin-top: -10px;
        }

        .margin-top-two {
            margin-top: -20px;
        }

        .textwidth {
            width: 138px;
        }

        .radiusone {
            margin-left: -4px;
        }

        @media (min-width: 731px) and (max-width: 767px) {
            .inputthree {
                width: 50.5%;
            }
        }

        @media (min-width: 550px) and (max-width: 730px) {
            .inputtwo {
                width: 46.2%;
            }

            .inputthree {
                width: 49.2%;
            }
        }

        @media (min-width: 431px) and (max-width: 550px) {
            .inputtwo {
                width: 43.2%;
            }

            .inputthree {
                width: 47.5%;
            }
        }

        @media (min-width: 366px) and (max-width: 430px) {
            .inputtwo {
                width: 40.2%;
            }

            .inputthree {
                width: 46%;
            }
        }

        @media (min-width: 285px) and (max-width: 366px) {
            .inputtwo {
                width: 37.2%;
            }

            .inputthree {
                width: 44%;
            }
        }

        @media (min-width: 237px) and (max-width: 285px) {
            .inputtwo {
                width: 30%;
            }

            .inputthree {
                width: 40%;
            }
        }

        .span12 {
            width: 95%;

        }

        .yansered {
            color: red;
        }

    </style>

</head>


<body>
<div class="container" style="height:630px;overflow-x:auto;">

    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
        <div class="span9 margin-top-one">
            <div class="row-fluid">
                <h3 style="text-align: center;">安排房间Arrange rooms</h3>

            </div>
        </div>

        <form id="form1" method="post" onsubmit="return verify()">
            <input type="hidden" name="receiveTargetID" value="${tuanDuiID}" id="tuanDuiID"/>
            <input id="roomId" name="roomID" type="hidden">
            <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">

            <div class="span6" style="text-align:center;">
                <div class="row-fluid">
                    <div class="span12" style="margin-bottom: 8px;">
                        <button class="btn btn-primary" type="button" onclick="tijiao()">
                            <li class="icon-check icon-white"></li>
                            save
                        </button>
                    </div>
                </div>
            </div>

            <div class="span4" style="text-align:center;">
                <div class="row-fluid">
                    <div class="span4" style="margin-bottom: 8px;">
                        <button class="btn btn-warning" type="button" onclick="deletefunction()">
                            <li class="icon-remove icon-white"></li>
                            cancel
                        </button>
                    </div>
                </div>
            </div>
            <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label>房间号：Room number</label>
                        <input id="roomNameId" name="roomName" type="text" style="width:100%;height:27px;"
                               readonly="readonly">
                    </div>
                    <div class="span3">
                        <label>登记时间：Registration time</label>
                        <input id="registerTimeId" name="registerTime" id="date"
                               style="width:97%; height:27px;float:left;" class="Wdate" type="text"
                               onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})"
                               onchange="onchangeOne()"/>
                        <div id="divOne">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label>出租方式：Rental mode</label>
                        <select name="rentOutTypeID" style="width:100%;height:27px;" id="rentout"
                                onchange="rentoutChange()">
                            <c:forEach items="${listRentOutType}" var="item">
                                <option value="${item.far_id}"
                                        <c:if test="${item.far_id==26}">selected="selected"</c:if>>
                                        ${item.attributeDetailsName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="span3">
                        <label>旅客类别：<span style="font-size: 12px">Passenger category</span></label>
                        <select name="passengerTypeID" style="width:100%;height:27px;">
                            <c:forEach items="${listPassengerType}" var="item">
                                <option value="${item.far_id}"
                                        <c:if test="${item.far_id==29}">selected="selected"</c:if>>
                                        ${item.attributeDetailsName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label>标准房价：<span style="font-size: 12px">Standard housing price</span></label>
                        <input id="biaoZhunFangJiaId" type="text" style="width:100%;height:27px;" readonly="readonly">
                    </div>
                    <div class="span3">
                        <label>钟点房间/小时：<span style="font-size: 12px">Hour room / hour</span></label>
                        <input id="zhongDianFangId" type="text" style="width:100%;height:27px;" readonly="readonly">
                    </div>
                    <div class="span3">
                        <label>首段价格：(或床位价/小时)<span
                                style="font-size: 12px">First price: (or bed price / hour)</span></label>
                        <input id="shouDuanJiaGeId" type="text" style="width:100%;height:27px;" readonly="readonly">
                    </div>
                    <div class="span3">
                        <label>首段时长：<span style="font-size: 12px">First paragraph of time</span></label>
                        <input id="shouDuanShiChangId" type="text" style="width:100%;height:27px;" readonly="readonly">
                    </div>
                </div>
            </div>
            <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
            <div class="span12">
                <div class="row-fluid">


                    <div class="span3">
                        <label>供应商：Supplier</label>
                        <input id="supplierid" name="supplier" type="text" onchange="onchangeOne()"
                               style="width:97%;height:27px;float:left;">
                        <div id="divT">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label>是否折扣：<span style="font-size: 12px">Discount</span></label>
                        <select name="isdicount" style="width: 100%;height:27px;">
                            <option value="1">不是</option>
                            <option value="0">是</option>
                        </select>
                    </div>
                    <div class="span3">
                        <label>应收款：<span style="font-size: 12px">Payment method</span></label>
                        <input id="accountsreceivableid" name="accountsreceivable" type="text" onchange="onchangeOne()"
                               style="width:97%;height:27px;float:left;">
                        <div id="divaccountsreceivable">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label>支付方式：<span style="font-size: 12px"></span></label>
                        <select name="depositPayWayID" style="width:100%;height:27px;">
                            <c:forEach items="${listPayWay}" var="item">
                                <option value="${item.far_id}"
                                        <c:if test="${item.far_id==21}">selected="selected"</c:if>>
                                        ${item.attributeDetailsName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label>货币类型：<span style="font-size: 12px">Currency type</span></label>
                        <select name="currency" style="width: 100%;height:27px;">
                            <option value="1">人民币(RMB)</option>
                            <option value="2">菲律宾币<span style="font-size: 12px;">(PHP)</span></option>
                        </select>
                    </div>
                    <div class="span3">
                        <label>是否到账：<span style="font-size: 12px">Arrival account</span></label>
                        <select name="isdao" style="width: 100%;height:27px;">
                            <option value="2">是</option>
                            <option value="1">否</option>
                        </select>

                    </div>
                    <div class="span3">
                        <label>入住时间：<span style="font-size: 12px">Check-in time</span></label>
                        <input id="checkintimeId" name="checkintime" style="width:97%; height:27px;float:left;"
                               class="Wdate" type="text"
                               onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc})"
                               onchange="onchangeOne()"/>
                        <div id="divcheckintime">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label>退房时间：<span style="font-size: 12px">Check-out time</span></label>
                        <input id="checkouttimeId" name="checkouttime" style="width:97%; height:27px;float:left;"
                               class="Wdate" type="text"
                               onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc})"
                               onchange="onchangeOne()"/>
                        <div id="divcheckouttime">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${predetermineID!=null}">
                <input value="${predetermineID}" id="predetermineID" hidden="">
            </c:if>
            <c:if test="${predetermineID==null}">
                <input value="" id="predetermineID" hidden="">
            </c:if>
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label>按床位售出需填写：<span style="font-size: 12px">To be filled in if sold by bed</span></label>
                        <label>剩余床位数：<span style="font-size: 12px">Number of remaining beds</span></label>
                        <input id="surplusAcountid" name="surplusAcount" type="text" readonly
                               style="width:97%;height:27px;float:left;">
                        <div id="divW">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label><br></label>
                        <label>总床位数：<span style="font-size: 12px">Total bed number</span></label>
                        <input id="roomAcountid" name="roomAcount" type="text" readonly
                               style="width:97%;height:27px;float:left;">
                        <div id="dive">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label><br></label>
                        <label>住房人数：<span style="font-size: 12px">Housing population</span></label>
                        <input id="peopleid" name="people" type="text" onblur="peopleYZ(this.value)"
                               style="width:97%;height:27px;float:left;">
                        <div id="divq">
                            <label class="yansered" style="margin-top:12px;">*</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label class="labelroomnumber" style="font-size:15px">平台名称：<span style="font-size: 12px">Platform name</span></label>
                        <select id="platformId" name="platformID" onchange="platformIDOne(this.value)"
                                style="width:100%;height:27px;">
                            <c:forEach items="${platformPoList}" var="item">
                                <option value="${item.id}" selected="selected">
                                        ${item.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="span3">
                        <label class="labelroomnumber" style="font-size:15px">订单号：<span style="font-size: 12px">Order number</span></label>
                        <input id="codeNumberId" name="codeNumber" onblur="codeNumberOne(this.value)"
                               style="width:100%;height:27px;" type="text" onchange="onchangeOne()">
                    </div>
                    <div class="span3">
                        <label>姓名：<span style="font-size: 12px">name</span></label>
                        <input id="nameId" name="pname" onblur="nameOne(this.value)"
                               type="text" style="width:97%;height:27px;">
                        <div id="div5" style="float:right;">
                            <label class="yansered" style="margin-top:7px;">*</label>
                        </div>
                    </div>
                    <div class="span3">
                        <label class="labelroomnumber" style="font-size:15px">联系电话：<span style="font-size: 12px">Contact number</span></label>
                        <input id="contactPhoneNUmberId" name="contactPhoneNUmber" style="width:100%;height:27px;" type="text"">
                    </div>
                </div>
            </div>
            <div class="span12">
                <div class="row-fluid">
                    <div class="span3">
                        <label>性别：<span style="font-size: 12px">gender</span></label>
                        <select id="genderId" name="genderID" onchange="gender(this.value)" style="width:100%;height:27px;">
                            <c:forEach items="${listGender}" var="item">
                                <option value="${item.far_id}" <c:if test="${item.far_id==31}">selected="selected"</c:if>>
                                        ${item.attributeDetailsName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
        </form>

        <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

        <div class="span12">
            <fieldset>
                <legend>房态：</legend>
            </fieldset>
        </div>

        <select id="supplier" style="width:13%;height:27px; float:left; margin-left: -130px" onchange="selectChange()">
            <option value=" ">全部</option>
            <c:forEach items="${slist}" var="item">
                <option value="${item.id}">
                        ${item.supplierName}
                </option>
            </c:forEach>
        </select>
        <hr>
        <div class="span12" style="margin-top:-17px;">
            <div class="row-fluid">
                <button class="btn btn-info btn-small" type="button" onclick="allroomfunction()">所有房间(All rooms)
                </button>
                <button class="btn btn-info btn-small" type="button" onclick="onefunction()">单人普通房(Single person)
                </button>
                <button class="btn btn-info btn-small" type="button" onclick="threefunction()">二人普通房(Two room)</button>
                <button class="btn btn-info btn-small" type="button" onclick="fourfunction()">多人间(Multihuman)</button>
                <button class="btn btn-info btn-small" type="button" onclick="fivefunction()">豪华间(Deluxe Room)</button>
                <button class="btn btn-info btn-small" type="button" onclick="sixfunction()">会议室(meeting room)</button>
                <button class="btn btn-info btn-small" type="button" onclick="sevenfunction()">总统套房(Presidential
                    suite)
                </button>
            </div>
        </div>

        <div class="span12" id="dynamicid" style="height:270px;overflow-x:auto;">
            <div class="row-fluid" id="div1">
                <c:forEach items="${list}" var="item">
                    <c:if test="${item.roomStateID==1}"> <%--空房--%>
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666;  float:left;margin:2px; background:#99FF99;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                    <c:if test="${item.roomStateID==2}">
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#DDDDDD;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                    <c:if test="${item.roomStateID==4}">
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FFFF;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                    <c:if test="${item.roomStateID==5}">
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#BBBB00;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                    <c:if test="${item.roomStateID==6}">
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF7744;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                    <c:if test="${item.roomStateID==7}">
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF0088;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                                <%--<label>${item.supplierName}</label>--%>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                    <c:if test="${item.roomStateID==65}">
                        <button onclick="suibian(this)"
                                style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF00FF;">
                            <input style="display: none;" value="${item.id}"/>
                            <input style="display: none;" value="${item.roomStateID}"/>
                            <label>${item.roomNumber}</label>
                            <label style="margin-top:-5px;">${item.roomName}</label>
                            <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                            <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                            <input style="display: none;" value="${item.standardPrice}"/>
                            <input style="display: none;" value="${item.firstPrice}"/>
                            <input style="display: none;" value="${item.firstDuration}"/>
                            <input style="display: none;" value="${item.supplierName}"/>
                            <input style="display: none;" value="${item.sid}"/>
                        </button>
                    </c:if>
                </c:forEach>
            </div>
        </div>

    </div>
</div>

</div>


<script type="text/javascript">
    var shijian = "";
    var guestRoomLevelID = 0;
    var supplierid = "";
    var rents = null;

    function verify() {
    }

    function deletefunction() {
        var LvKeLeiXingId = document.getElementById("LvKeLeiXingId").value;
        parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/tolist.do?LvKeLeiXingId=' + LvKeLeiXingId;
    }

    function suibian(ss) {
        if (ss.children[1].value == 1) {
            var parentNodes = ss.parentNode.children;
            for (var i = 0; i < parentNodes.length; i++) {
                parentNodes[i].style.borderColor = "#666666";
            }
            ss.style.borderColor = "#00FFFF";
            document.getElementById("roomId").value = ss.children[0].value;
            document.getElementById("roomNameId").value = ss.children[2].textContent;
            document.getElementById("biaoZhunFangJiaId").value = ss.children[5].textContent;
            document.getElementById("zhongDianFangId").value = '￥' + ss.children[6].value;
            document.getElementById("shouDuanJiaGeId").value = '￥' + ss.children[7].value;
            document.getElementById("shouDuanShiChangId").value = ss.children[8].value;
            document.getElementById("supplierid").value = ss.children[9].value;
        } else {
            alert("不是空房不可以安排房间的哦！" + ' \n ' + "It's not an empty room. You can't arrange a room.");
        }


        var roomid = ss.children[0].value;  //获取这个
    }

    function suibians(ss) {
        /*if(ss.children[1].value){*/
        var parentNodes = ss.parentNode.children;
        for (var i = 0; i < parentNodes.length; i++) {
            parentNodes[i].style.borderColor = "#666666";
        }
        ss.style.borderColor = "#00FFFF";
        document.getElementById("roomId").value = ss.children[0].value;
        document.getElementById("roomNameId").value = ss.children[2].textContent;
        document.getElementById("biaoZhunFangJiaId").value = ss.children[4].textContent;
        document.getElementById("zhongDianFangId").value = '￥' + ss.children[6].value;
        document.getElementById("shouDuanJiaGeId").value = '￥' + ss.children[6].value;
        document.getElementById("shouDuanShiChangId").value = ss.children[7].value;
        document.getElementById("supplierid").value = ss.children[8].value;
        document.getElementById("surplusAcountid").value = ss.children[10].value;
        document.getElementById("roomAcountid").value = ss.children[11].value;

        var roomid = ss.children[0].value;  //获取这个
    }

    function tijiao() {
       /* var nameId = document.getElementById("nameId").value;
        var contactPhoneNUmberId = document.getElementById("contactPhoneNUmberId").value;*/
        var checkin = document.getElementById("checkintimeId").value;
        var checkout = document.getElementById("checkouttimeId").value;
        var stay = new Date(Date.parse(checkin.replace('/-/g', '/'))).getTime();
        var end = new Date(Date.parse(checkout.replace('/-/g', '/'))).getTime();
        var sup = document.getElementById("surplusAcountid").value;
        var people = document.getElementById("peopleid").value;
        if (rents != 72) {
            if (document.getElementById("registerTimeId").value == "") {
                alert("登记时间  是必填项，不能为空哦！" + ' \n ' + "Registration time is required");
                document.getElementById("registerTimeId").focus();
                return false;
            } else if (document.getElementById("checkintimeId").value == "") {
                alert("入住时间不能为空" + ' \n ' + "Check in time cannot be empty");
                document.getElementById("checkintimeId").focus();
                return false;
            } else if (document.getElementById("checkouttimeId").value == "") {
                alert("退房时间不能为空" + ' \n ' + "Check out time cannot be empty");
                document.getElementById("checkouttimeId").focus();
                return false;
            } else if (end < stay) {
                alert("退房时间不能早于入住时间" + ' \n ' + "Check out time cannot be earlier than check in time");
                document.getElementById("checkouttimeId").focus();
                return false;
            } else if (document.getElementById("registerTimeId").value.length > 20) {
                alert("你输入的    登记时间   太过长了  请不要超出  20 位长度" + ' \n ' + "Registration time is too long");
                document.getElementById("registerTimeId").focus();
                return false;
            } else if (document.getElementById("accountsreceivableid").value == "") {
                alert("应付款不能为空" + ' \n ' + "Payable cannot be empty");
                document.getElementById("accountsreceivableid").focus();
                return false;
            } else if (rents == 72) {
                if (people > sup) {
                    alert("入住人数不能大于床位剩余数！" + ' \n ' + "The number of check-in can not be greater than the number of remaining beds");
                    return false;
                }
            }
            if (document.getElementById("roomNameId").value == "") {
                alert("还没有选择房间哦！" + ' \n ' + "You haven't chosen a room yet");
                return false;
            }
            //联系电话
            if(document.getElementById("contactPhoneNUmberId").value!=""){
                if(!document.getElementById("contactPhoneNUmberId").value.trim().match("^[1][0-9]{10}$"))
                {
                    document.getElementById("contactPhoneNUmberId").focus();
                    document.getElementById("contactPhoneNUmberId").value="";
                    alert("你输入的手机号码有误，请重新输入！"+' \n '+"The mobile number you entered is wrong");
                }
            }
            //姓名
            if(document.getElementById("nameId").value!=""){
                document.getElementById("div5").style.display="none";
            }else{
                document.getElementById("div5").style.display="block"; //显示
            }

        }
        var flag = listAllYZ();
        if (flag == false) {
            alert("入住失败，请检查入住时间！" + ' \n ' + "Check in failed, please check in time");
            return false;
        }
        var LvKeLeiXingId = document.getElementById("LvKeLeiXingId").value;
        var predetermineID = document.getElementById("predetermineID").value;
        form1.action = "${ctx}/StayRegister/arrangeroom.do?LvKeLeiXingId=" + LvKeLeiXingId + "&predetermineID=" + predetermineID + "&people=" + people;
        form1.submit();
    }


    function pickedFunc() {
        shijian = $dp.cal.getNewDateStr();
    }

    function allroomfunction() {
        guestRoomLevelID = 0;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function onefunction() {
        guestRoomLevelID = 8;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function threefunction() {
        guestRoomLevelID = 10;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function fourfunction() {
        guestRoomLevelID = 11;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function fivefunction() {
        guestRoomLevelID = 12;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function sixfunction() {
        guestRoomLevelID = 13;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function sevenfunction() {
        guestRoomLevelID = 14;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }
    }

    function selectChange() {
        var supplier = document.getElementById("supplier").value;
        supplierid = supplier;
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }

    }

    function rentoutChange() {
        var rent = document.getElementById("rentout").value;
        rents = rent;
        if (rent == 72) {
            tenfunctions();
        } else {
            tenfunction();
        }

    }

    function tenfunction() {
        $("#div1").empty();
        $.ajax({
            cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/StayRegister/guestRoomLevelSelectRoom.do',       //地址 type 带参数
            data: "guestRoomLevelID=" + guestRoomLevelID + "&supplierid=" + supplierid,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async: false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                for (var key in result) {
                    var item = result[key];
                    if (item.roomStateID == 1) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FF99;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if (item.roomStateID == 2) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#DDDDDD;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if (item.roomStateID == 4) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FFFF;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if (item.roomStateID == 5) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#BBBB00;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if (item.roomStateID == 6) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF7744;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if (item.roomStateID == 7) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF0088;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if (item.roomStateID == 65) {
                        var btn = $("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF00FF;'>" +
                            "<input style='display: none;' value=" + item.id + " />" +
                            "<input style='display: none;' value=" + item.roomStateID + " />" +
                            "<label>" + item.roomNumber + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +
                            "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                            "<label style='margin-top:-5px;'>" + "￥" + item.standardPriceDay + "</label>" +
                            "<input style='display: none;' value=" + item.standardPrice + " />" +
                            "<input style='display: none;' value=" + item.firstPrice + " />" +
                            "<input style='display: none;' value=" + item.firstDuration + " />" +
                            "<input style='display: none;' value=" + item.supplierName + " />" +
                            "<input style='display: none;' value=" + item.sid + " />" +
                            "</button>")
                        $("#div1").append(btn);
                    }
                }
            },
            error: function (data) {

            }

        });
    }


    function onchangeOne() {
        //登记时间
        if (document.getElementById("registerTimeId").value != "") {
            document.getElementById("divOne").style.display = "none";
        } else {
            document.getElementById("divOne").style.display = "block"; //显示
        }
        if (document.getElementById("checkouttimeId").value != "") {

        } else {
            document.getElementById("divcheckouttime").style.display = "block"; //显示
        }
        if (document.getElementById("checkintimeId").value != "") {

        } else {
            document.getElementById("divcheckintime").style.display = "block"; //显示
        }

    }

    //==========================================================================================================================//


    function tenfunctions() {
        $("#div1").empty();
        $.ajax({
            cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/StayRegister/guestRoomLevelSelectBedRoom.do',       //地址 type 带参数
            data: "guestRoomLevelID=" + guestRoomLevelID + "&supplierid=" + supplierid + "&rents=" + rents,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async: false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                for (var key in result) {
                    var item = result[key];
                    var btn = $("<button onclick='suibians(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FF99;'>" +
                        "<input style='display: none;' value=" + item.id + " />" +
                        "<input style='display: none;' value=" + item.roomStateID + " />" +
                        "<label>" + item.roomNumber + "</label>" +
                        /*  "<label style='margin-top:-5px;'>" + item.roomName + "</label>" +*/
                        "<label style='margin-top:-5px;'>" + item.guestRoomLevelName + "</label>" +
                        "<label style='margin-top:-5px;'>" + "￥" + item.bedDayPrice + "</label>" +
                        "<input style='display: none;' value=" + item.standardPrice + " />" +
                        "<input style='display: none;' value=" + item.bedPrice + " />" +
                        "<input style='display: none;' value=" + item.bedHour + " />" +
                        "<input style='display: none;' value=" + item.supplierName + " />" +
                        "<input style='display: none;' value=" + item.sid + " />" +
                        "<input style='display: none;' value=" + item.surplusAcount + " />" +
                        "<input style='display: none;' value=" + item.roomAmount + " />" +
                        "</button>")
                    $("#div1").append(btn);
                }
            },
            error: function (data) {

            }

        });

    }

    function peopleYZ(value) {
        var already = document.getElementById("surplusAcountid").value;
        var acount = document.getElementById("peopleid").value;
        if (acount > already) {
            alert("入住人数不能大于剩余床位数！" + ' \n ' + "The number of check-in persons cannot be greater than the number of remaining beds");
        }
    }

    function listAllYZ() {
        var f = true;
        var roomid = document.getElementById("roomId").value;
        var checkin = document.getElementById("checkintimeId").value;
        var checkout = document.getElementById("checkouttimeId").value;
        if (roomid != "" && checkin != null) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Predetermine/listsYZ.do',       //地址 type 带参数
                data: "roomid=" + roomid.trim() + "&checkin=" + checkin.trim() + "&checkout=" + checkout.trim(),                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result >= 1) {
                        alert("入住失败" + ' \n ' + "Check in failure");                     //提示框
                        document.getElementById("checkintimeId").value = "";
                        f = false;
                    } else {
                        f = true;
                    }
                },
                error: function (data) {
                }
            });
        }
        return f;
    }

    //订单号判重
    function codeNumberOne(value){
        var codeNumber=document.getElementById("codeNumberId").value.trim();
        var is= /^\d+$/;
        if (codeNumber!="") {
            if (is.test(codeNumber) == false) {
                alert("订单号只能有数字组成"+' \n '+"Order number can only be composed of numbers");
                document.getElementById("codeNumberId").value = "";
                return;
            }
        }
        if(value!=""){
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/StayRegister/codeNumberYZ.do',       //地址 type 带参数
                data:"codeNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(result>=1){
                        alert("订单号重复！"+' \n '+"Duplicate order number");                     //提示框
                        document.getElementById("codeNumberId").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("codeNumberId").focus();      // 给这个id的文本框提供焦点
                        document.getElementById("divOne").style.display="block"; //显示
                    }else{ }
                },
                error: function(data) { }
            });
        }

    }
</script>

</body>
</html>
