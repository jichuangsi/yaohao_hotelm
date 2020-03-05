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
	<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
	<link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
	<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${ctx}/js/page.js"></script>


	<link rel="stylesheet" type="text/css" href="${ctx}/css/fullcalendar.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/fullcalendar.print.css">
	<script src='${ctx}/js/fullcalendar/jquery-ui-1.10.2.custom.min.js'></script>
	<script src='${ctx}/js/fullcalendar/fullcalendar.min.js'></script>
	<style type="text/css">
		#calendar{
			width:900px; margin:20px auto 10px auto;
			font-weight: bold;
			font-size: 16px;

		}
		body{
			font-size:12px;
		/*	width:1000px;*/
		}
		a{color:#666;text-decoration:none;}
		.input-group span{
			color:#7a1919;
			font-size: 20px;
			font-weight: bold ;
		}
	</style>

	<script type="text/javascript">
        $(document).ready(function () {
            var today=new Date()
            today = today.getFullYear() + "-" + (today.getMonth()<9?"0"+(today.getMonth() + 1)
				:(today.getMonth() + 1)) + "-" + today.getDate()<10?"0"+today.getDate():today.getDate();
            function getDate(DBTime){
                var date = new Date(DBTime*1000);
                var year = date.getFullYear();
                var month = date.getMonth()+1;
                var day = date.getDate();
                var dateStr;
                if(month<10&&day<10){
                    dateStr = year+"-0"+month+"-0"+day;
                }else if(month<10&&day>=10){
                    dateStr = year+"-0"+month+"-"+day;
                }else if(month>=10&&day<10){
                    dateStr = year+"-"+month+"-0"+day;
                }else if(month>=10&&day>=10){
                    dateStr = year+"-"+month+"-"+day;
                }
                return dateStr;
            }
            //第一天
            function getCurrentMonthFirst(){
                var date = new Date();
                date.setDate(1);
                var month = parseInt(date.getMonth()+1);
                var day = date.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }
            //最后一天
            function getCurrentMonthLast(){
                var date=new Date();
                var currentMonth=date.getMonth();
                var nextMonth=++currentMonth;
                var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
                var oneDay=1000*60*60*24;
                var lastTime = new Date(nextMonthFirstDay-oneDay);
                var month = parseInt(lastTime.getMonth()+1);
                var day = lastTime.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }
            var from =getCurrentMonthFirst();
            var to=getCurrentMonthLast();
            function checkTime(i){
                if(i<10){
                    i = '0'+i
                }
                return i
            }
            // 渲染日历
            $('#calendar').fullCalendar({
                header:  {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month'//月
                }, // 不显示头部
                firstDay:1,
                defaultDate: today,
                contentHeight: 500, // 设置内容高度
                editable: true, // 可编辑
                eventLimit: true, // allow "more" link when too many events
                //初始化时的默认视图，month、agendaWeek、agendaDay
                defaultView: 'month',
                // 使用function动态获取数据，start为开始时间，end为结束时间，这个不需要我们来设置，日历自动获取
                events: function (start, end, callback) {
                   // alert(start);
                    var id=document.getElementById("roomid").value;
                    var date= new Date(start)
                    var dateTime = date.getFullYear()+'-'+checkTime(date.getMonth()+1)+'-'+checkTime(date.getDate());
                    var date1= new Date(end)
                    var dateTime2 = date1.getFullYear()+'-'+checkTime(date1.getMonth()+1)+'-'+checkTime(date1.getDate());
					//alert(dateTime);
                    // 这里是ajax请求，替换为你正在使用的ajax方式就可以
                    $.ajax({
                        cache:false,                                       //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                        type: "post",
                        url: '${ctx}/Hotelm/dayroom.do',
                        dataType: "json",//地址 type 带参数"id="+id+"&timeOne="+from+"&timeTwo="+to,
                        data:"id="+id+"&timeOne="+dateTime+"&timeTwo="+dateTime2,
                        async:false,                                          // 是否 异步 提交
                        success: function (result) {
                            var events=[];
                            // 不出现异常 进行立面方
                            //  for (var i=0;i<result.length;i++) {
                            $.each(result, function (i) {
                                var item = result[i];
                                var indate = getDate(item.in);//通过getDate方法将日期格式进行转化
                                var outdate = getDate(item.out);//通过getDate方法将日期格式进行转化
                                // 数据处理，将返回的数据添加到events中
                                    if (item.sorp ==1) {
                                    events.push({
                                        id: item.id,
                                        // 标题，即你想展示的内容
                                        title: item.roomNumber + "\n " + indate + "\n " + outdate +"\t"+item.checkouts+ "\n 满" ,
                                        start:indate,
                                        end: outdate,
                                        color: 'red'
                                    });
                                } else if (item.sorp ==2) {
                                    events.push({
                                        id: item.id,
                                        // 标题，即你想展示的内容
                                        title: item.roomNumber + "\n" + indate + "\n " + outdate +"\t"+item.checkouts+"\n 预定",
                                        start: indate,
                                        end: outdate,
                                        color: 'yellow'
                                    });
                                } else {
                                    events.push({
                                        id: item.id,
                                        // 标题，即你想展示的内容
                                        title: item.roomNumber + "\n" + indate + "\n " + outdate+"\t"+item.checkouts + "\n空",
                                        start: indate,
                                        end: outdate
                                    });
                                }
                            });
                            callback(events);
                        }, error: function(data) {
                            alert('获取信息失败！')
                        }
                    });
                },
				dayClick: function(date, jsEvent, view) {//空白的日期区，单击时触发
                    var id=document.getElementById("roomid").value;
                    var supperId=document.getElementById("supperid").value;
                    var date1= new Date(date)
                    var dateTime = date1.getFullYear()+checkTime(date1.getMonth()+1)+checkTime(date1.getDate());
                    var dateTimes = date1.getFullYear()+"-"+checkTime(date1.getMonth()+1)+"-"+checkTime(date1.getDate());
                    var date = new Date();
                    var nowDate=date.getFullYear()+checkTime(date.getMonth()+1)+checkTime(date.getDate());
                    if(dateTime<nowDate){//选择时间小于当前时间
                        return;
                    }
                    window.location="${ctx}/Hotelm/toaddRoom.do?id="+id+"&timeOne="+dateTimes+"&supperId="+supperId;

                },
                eventClick: function(event) {//日程区块，单击时触发
					var id=event.id;//id
                    var roomid=document.getElementById("roomid").value;
                    var supperId=document.getElementById("supperid").value;
                    $.ajax({
                        url: '${ctx}/Hotelm/viewRoom.do',
                        dataType: 'json',
                        type : 'post',
						data:'id='+id,
                        success: function(result){ //
							var time=getDate(result.time);
							var time2=getDate(result.time2);
                          	$("#Passenger").html(result.passenger);
                            $("#phone").html(result.phone);
                            $("#roomNumber").html(result.roomNumber);
                            $("#startTime").html(time);
                            $("#endTime").html(time2+"\t"+result.checkouts);
                            $("#preid").html(result.preid);
                            $("#stayid").html(result.stayid);
                           if (result.sorp==1){//满
								var out=document.getElementById("register");
								out.style.display="none";
                             /*  var out=document.getElementById("cancel");
                               out.style.display="none";*/

                           }else if (result.sorp==2) {
                               var check=document.getElementById("check-out");
                               check.style.display="none";
                           }
                           if (result.isdao==2) {//未到账
							var isdaos=document.getElementById("isdaos");
							isdaos.style.display="none";
                               var isdaoss=document.getElementById("isdaoss");
                               isdaoss.style.display="none";
                           }
                          $("#view").modal("show");//显示弹出框
                            //$("#view").css({"display":"block"});//显示弹出框
                        }, error: function(data) {
                            alert('获取信息失败！')
                        }
                    });
                    var check=document.getElementById("check-out");
                    check.onclick=function () {//退房
                        var currency=document.getElementById("currency").value;
                        var isdao=document.getElementById("isdao").value;
                        var flag=window.confirm("确定要退房吗？Are you sure you want to check out");
                        if (flag){
                            window.location="${ctx}/Hotelm/checkout.do?id="+id+"&isdao="
								+isdao+"&currency="+currency+"&roomid="+roomid+"&supperId="+supperId;
                        }else {
                            return;
                        }
                    };
                    var register=document.getElementById("register");
                    register.onclick=function () {
                        var flag=window.confirm("Check in");
                        if (flag){
                            window.location="${ctx}/Hotelm/register.do?id="+id+"&supperId="+supperId+"&roomid="+roomid;
                        }else {
                            return;
                        }
                    };
                  var cancel=document.getElementById("cancel");
                    cancel.onclick=function () {
                        //$("#view").css({"display":"block"});//显示弹出框
                        $("#view").modal("show");//显示弹出框
                    };
                }
			});
        });

	</script>


</head>
<body>
<div id="main" style="width:1060px">
	<div style="text-align:center">

	</div>
	<div id='calendar'></div>
	<div><input type="hidden" value="${id}" name="id" id="roomid">
		<input type="hidden" value="${supplierId}" name="supperid" id="supperid">
	</div>
		<%--//添加预约旅客--%>

	<%--查看--%>
	<div class="modal hide fade" id="view" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 80%;border:1px solid;margin:10%;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4 class="modal-title"><i class="fa fa-info-circle"></i>check</h4>
				</div>
				<div class="modal-body">
					<div class="form-group" style="margin: 2px; margin-bottom: 20px">
						<div class="input-group" style="width:100%;line-height: 3; ">
							<p>
								旅客：Passenger:<span id="Passenger"></span>
							</p>
							<p>
								手机号：Cell-phone number:<span id="phone"></span>
							</p>
							<p>
								房号：roomNumber:<span id="roomNumber" style="color:#7a1919;font-size: 20px;font-weight: bold "/></span>
							</p>
							<p>
								入住时间：check-in-time:<span id="startTime" /></span>
							</p>
							<p>
								退房时间：check-out-time:<span id="endTime" /></span>
							</p>
							<p id="isdaos" style="display: block">
								是否到账：Arrival account：
								<select  name="isdao" id="isdao" style="width: 50%;height:27px;">
									<option value="2">是(yes)</option>
									<option value="1">否(no)</option>
								</select>

							</p>
							<p id="isdaoss"style="display: block">
								货币类型：Currency type：
								<select  name="currency" id="currency" style="width: 100%;height:27px;">
									<option value="1">人民币(RMB)</option>
									<option value="0">菲律宾币(PHP)</option>
								</select>

							</p>
							<p>
								<span id="preid" style="display: none" ></span><span id="stayid"  style="display: none"></span>
								<input type="button" class="btn btn-xs btn-secondary" id="check-out" value="Check-out">
								<input type="button" class="btn btn-xs btn-success" id="register" value="register">
								<input type="button" class="btn btn-xs btn-secondary" id="cancel" value="cancel">
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>
	<script type="text/javascript">
		$(function () {
           /* $("#check-out").onclick=function () {
                alert("退房");
            };*/

            $("#register").onclick=function () {//点击登记
                alert("登记");
            };

            $("#cancel").onclick=function(){//点击退出
                $("#view").modal("hide");//显示弹出框
            };
        });

	</script>
</body>
</html>
