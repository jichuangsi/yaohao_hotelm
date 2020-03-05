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
	<link rel="stylesheet" type="text/css" href="${ctx}/css/fullcalendar.css">

	<style type="text/css">
		#calendar{width:960px; margin:20px auto 10px auto}
		body{font-size:12px;}
		a{color:#666;text-decoration:none;}
	</style>
	<script src='${ctx}/js/fullcalendar/jquery-1.9.1.min.js'></script>
	<script src='${ctx}/js/fullcalendar/jquery-ui-1.10.2.custom.min.js'></script>
	<script src='${ctx}/js/fullcalendar/fullcalendar.min.js'></script>
	<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${ctx}/js/page.js"></script>

	<script type="text/javascript">
        $(function() {
           $(document).ready( function (){
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
                // 渲染日历
                $('#calendar').fullCalendar({
                    header:  {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month'
                    }, // 不显示头部
                    firstDay:1,
                    contentHeight: 500, // 设置内容高度
                    editable: true, // 可编辑
                    eventLimit: true, // allow "more" link when too many events
                    //初始化时的默认视图，month、agendaWeek、agendaDay
                    defaultView: 'month',
                    // 使用function动态获取数据，start为开始时间，end为结束时间，这个不需要我们来设置，日历自动获取
                    events: function (start, end, timezone,callback) {
						var id=document.getElementById("roomid").value;
                        // 这里是ajax请求，替换为你正在使用的ajax方式就可以
                        $.ajax({
                            cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                            type: "post",                                           //上面3行都是必须要的
                            url: '${ctx}/Hotelm/dayroom.do',
                            dataType: "json",//地址 type 带参数
                            data:"id="+id+"&timeOne="+from+"&timeTwo="+to,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
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
                                        if (item.sorp == 1) {
                                            events.push({
                                                id: item.id,
                                                // 标题，即你想展示的内容
                                                title: item.roomNumber + "," + indate + "-" + outdate + "," + item.sorp,
                                                start: indate,
                                                end: outdate,
                                                color: 'red'
                                            });
                                        } else if (item.sorp == 2) {
                                            events.push({
                                                id: item.id,
                                                // 标题，即你想展示的内容
                                                title: item.roomNumber + "," + indate + "," + item.sorp,
                                                start: indate,
                                                end: outdate,
                                                color: 'yellow'
                                            });
                                        } else {
                                            events.push({
                                                id: item.id,
                                                // 标题，即你想展示的内容
                                                title: item.roomNumber + "," + indate + "," + item.sorp,
                                                start: indate,
                                                end: outdate,
                                                color: 'white'
                                            });
                                        }
                                    });
                                callback(events)
                            }, error: function(data) {
								alert('获取信息失败！')
                            }
						});
                    },
                 // 点击某一天响应事件
                    /*dayClick : function(date, allDay, jsEvent, view ) {
                        var events = $('#calendar').fullCalendar('clientEvents', function(event) {
                            var eventStart = event.start.format('YYYY-MM-DD');
                            alert(eventStart)
                        });
                },*/
            });
			});
		});
	</script>
</head>

<body>

<div id="main" style="width:1060px">
	<div style="text-align:center">

	</div>
	<div id='calendar'></div>
	<div><input type="hidden" value="${id}" name="id" id="roomid"></div>

</div>

</body>
</html>
