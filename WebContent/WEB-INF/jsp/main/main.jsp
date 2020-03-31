<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<html >
	<head>
		<title>欢迎使用酒店管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<meta name="description" content="概述及统计" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="viewport" content="width=device-width,initial-scale=0.5,maximum-scale=1,minimum-scale=1,user-scalable=no">
		<!--basic styles-->

		<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${ctx}/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>

		  <link rel="stylesheet" href="${ctx}/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<!--fonts-->

		<!--ace styles-->

		<link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${ctx}/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>

	<style type="text/css">
		.nav-list>li>a{
			height: 50px;
			line-height: normal;
		}
	</style>

	</head>

	<body>

	<input  value="${user}" type="hidden" id="user"/>
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand" lang>hotel</a>
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>
		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success"id="enBtn" onclick="checkEn()">
							English
						</button>
						<button class="btn btn-small btn-success"id="zhBtn"onclick="checkZh()">
						简体中文
						</button>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
					<li>
						<a id="privateId" onclick="privateapartment()" class="dropdown-toggle">
							<i class="icon-home"></i>
							<span class="menu-text" lang>private</span>
							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a id="occupancyId" onclick="occupancy()">
									<i class="icon-double-angle-right"></i>
									<span lang>in</span>
								</a>
							</li>
							<li>
								<a id="myorderId" onclick="myorder()">
									<i class="icon-double-angle-right"></i>
									<span lang>myorder</span>
								</a>
							</li>
							<li>
								<a id="myfinanceId" onclick="myfinance()">
									<i class="icon-double-angle-right"></i>
									<span lang>financeial</span>
								</a>
							</li>
							<li>
								<a id="roomSetId" onclick="roomSet()">
									<i class="icon-double-angle-right"></i>
									<span lang>roomset</span>
								</a>
							</li>
							<li>
								<a id="platformmanagerId" onclick="platformmanager()">
									<i class="icon-double-angle-right"></i>
									<span lang>platform</span>
								</a>
							</li>
							<li>
								<a id="suppliermanager" onclick="suppliermanager()">
									<i class="icon-double-angle-right"></i>
									<span lang>supplier</span>
								</a>
							</li>
							<li>
								<a id="consumptionId" onclick="consumption()">
									<i class="icon-double-angle-right"></i>
									<span  lang>consumptions</span>
								</a>
							</li>
							<li>
								<a id="bookingId" onclick="booking()">
									<i class="icon-double-angle-right"></i>
									<span lang>ticheng</span>
								</a>
							</li>
							<li>
								<a id="questionId" onclick="question()">
									<i class="icon-double-angle-right"></i>
									<span lang>question</span>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a id="contractApartmentId" onclick="contractApartment()" class="dropdown-toggle">
							<i class="icon-dashboard"></i>
							<span class="menu-text" lang>contract</span>
							<b class="arrow icon-angle-down"></b>
						</a>
						<ul class="submenu">
							<li>
								<a id="pmyorderId" onclick="pmyorder()">
									<i class="icon-double-angle-right"></i>
									<span lang>order</span>
								</a>
							</li>
							<li>
								<a id="pcheckinorderId" onclick="pcheckinorder()">
									<i class="icon-double-angle-right"></i>
									<span lang>stay</span>
								</a>
							</li>
							<li>
								<a id="pmyorderStatisticsId" onclick="pmyorderStatistics()">
									<i class="icon-double-angle-right"></i>
									<span lang>orderDetails</span>
								</a>
							</li>
							<li>
								<a id="pmyfinanceId" onclick="pmyfinance()">
									<i class="icon-double-angle-right"></i>
									<span lang>financeialStatistics</span>
								</a>
							</li>

							<%--<li>
								<a id="proomSetId" onclick="proomSet()">
									<i class="icon-double-angle-right"></i>
									<span>房间管理
										<br>Room setup
									</span>
								</a>
							</li>
							<li>
								<a id="pplatformmanagerId" onclick="pplatformmanager()" href="#">
									<i class="icon-double-angle-right"></i>
									<span>平台信息
										<br>Platform information
									</span>
								</a>
							</li>
							<li>
								<a id="psuppliermanager" onclick="psuppliermanager()" href="#">
									<i class="icon-double-angle-right"></i>
									<span>供应商信息
										<br>Supplier information
									</span>
								</a>
							</li>--%>
						</ul>
					</li>
					<li>
						<a id="setup" onclick="passengerManage()" class="dropdown-toggle">
							<i class=" icon-wrench"></i>
							<span class="menu-text" lang>set</span>
							<b class="arrow icon-angle-down"></b>
						</a>
						<ul class="submenu">

							<li>
								<a id="operator" onclick="operator()" href="#">
									<i class="icon-double-angle-right"></i>
									<span lang>Account</span>
								</a>
							</li>
							<li>
								<a id="exit" onclick="exit()" href="#">
									<i class="icon-double-angle-right"></i>
									<span lang>out</span>
								</a>
							</li>

						</ul>
					</li>
				</ul>


				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a id="bigGuide" href="#"></a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li id="smallGuide" class="active"></li>
					</ul><!--.breadcrumb-->
							
					</ul><!--.breadcrumb-->

				</div>

				<div style="width:100%;height:100%;">
				  <iframe id="Mainid" src="${ctx}/Main/todata.do" name="main"style="width:100%;height:100%;white-space:nowrap;"  frameBorder="0" scrolling="yes"></iframe>
				</div>

				<%--<div class="ace-settings-container" id="ace-settings-container">
					&lt;%&ndash;<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>&ndash;%&gt;

					&lt;%&ndash;<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-class="default" value="#438EB9" />#438EB9
									<option data-class="skin-1" value="#222A2D" />#222A2D
									<option data-class="skin-2" value="#C6487E" />#C6487E
									<option data-class="skin-3" value="#D0D0D0" />#D0D0D0
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header">固定头部</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar">固定侧栏</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">左右互换</label>
						</div>
					</div>&ndash;%&gt;
				</div><!--/#ace-settings-container-->--%>
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
        
		<!--<![endif]-->

		<!--[if IE]>
<script src="${ctx}/assets/js/jquery-1.10.2.min.js"></script>

<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ctx}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${ctx}/assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--[if lte IE 8]>
		  <script src="${ctx}/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="${ctx}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="${ctx}/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="${ctx}/assets/js/jquery.slimscroll.min.js"></script>
		<script src="${ctx}/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="${ctx}/assets/js/jquery.sparkline.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.resize.min.js"></script>
		
        <script src="${ctx}/assets/js/ace-extra.min.js"></script>
		

		<!--ace scripts-->

		<script src="${ctx}/assets/js/ace-elements.min.js"></script>
		<script src="${ctx}/assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
			
				
			
			
			
			 
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);
			
			 /**
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);
			
			
			
			  var $tooltip = $("<div class='tooltip top in hide'><div class='tooltip-inner'></div></div>").appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
				
			 });
			
			
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').slimScroll({
					height: '300px'
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
				
			
			})

            function privateapartment(){

            }
            function occupancy(){
			    var time=getNowFormatDate();
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("occupancyId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
              //document.getElementById('Mainid').src='${ctx}/Order/occupancy.do?time='+time;
                document.getElementById('Mainid').src='${ctx}/Order/occupancy.do?time='+time;
                //document.getElementById('Mainid').src='${ctx}/Order/test.do';joccupancy
            }
            //确认
			function myorder() {
				var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
				document.getElementById("bigGuide").innerHTML=a+"";
				var s=document.getElementById("myorderId").getElementsByTagName('span')[0].innerHTML;
				document.getElementById("smallGuide").innerHTML=s+"";
			   document.getElementById('Mainid').src='${ctx}/Order/pageorders.do?status=0';
			}
        //已入住
            function checkinorder() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("checkinorderId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/checkinorder.do';
            }
            //已退房
            function checkoutorder() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("checkoutorderId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/checkoutorder.do';
            }
            //订单明细
            function myorderStatistics() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("myorderStatisticsId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/myorderStatistics.do';
            }

            //财务报表
            function myfinance() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("myfinanceId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/myfinance.do';
            }
            //已到账
            function myaccount() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("myaccountId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/myaccount.do';
            }



            function roomSet(){
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("roomSetId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
                document.getElementById('Mainid').src='${ctx}/RoomSet/tolist.do';
            }
            function commoditySet(){
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("commoditySetId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
                document.getElementById('Mainid').src='${ctx}/Commodity/tolist.do?user='+user;
            }

            function consumption(){
			    var time=getNowFormatDate();
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("consumptionId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
             document.getElementById('Mainid').src='${ctx}/Order/todaily.do';
               //document.getElementById('Mainid').src='${ctx}/Order/monthRoom.do?time='+time+"&roomId=48";
            }
			function booking() {
                var time=getNowFormatDate();
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("bookingId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
                document.getElementById('Mainid').src='${ctx}/Order/bookinglist.do';
               // document.getElementById('Mainid').src='${ctx}/Order/date.do';
			}
            function question() {
                var time=getNowFormatDate();
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("questionId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
                document.getElementById('Mainid').src='${ctx}/Order/question.do';
                // document.getElementById('Mainid').src='${ctx}/Order/date.do';
            }
            //==============================================================================================================================//

            function platformmanager() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("platformmanagerId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Platform/tolist.do';
                //document.getElementById('Mainid').src='${ctx}/platform/merchantManagement.jsp';
            }

            function suppliermanager() {
                var a=document.getElementById("privateId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("suppliermanager").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Supplier/tolist.do';
            }

            /*////////////////////////////////////合约//////////////////////////////*/

            function  contractApartment(){

			}

            function poccupancy(){
                var time=getNowFormatDate();
                alert(time);
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("poccupancyId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                // document.getElementById('Mainid').src='${ctx}/Order/occupancy.do?time='+time;
                document.getElementById('Mainid').src='${ctx}/Order/test.do';
            }
            //确认
            function pmyorder() {
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pmyorderId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Hotelm/allorder.do';
            }
            //已入住
            function pcheckinorder() {
                var time=getNowFormatDate();
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pcheckinorderId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Hotelm/checkinorder.do?time='+time;
            }
            //已退房
            function pcheckoutorder() {
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pcheckoutorderId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/checkoutorder.do';
            }
            //订单明细
            function pmyorderStatistics() {
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pmyorderStatisticsId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Hotelm/myorderStatistics.do';
            }

            //财务报表
            function pmyfinance() {
                var time=getNowFormatDate();
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pmyfinanceId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Hotelm/myfinance.do?time='+time;
            }
            //已到账
            function pmyaccount() {
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pmyaccountId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Order/myaccount.do';
            }
            function proomSet(){
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
                document.getElementById('Mainid').src='${ctx}/RoomSet/tolist.do';
            }

            function pcommoditySet(){
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pcommoditySetId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                var user=document.getElementById("user").value;
                document.getElementById('Mainid').src='${ctx}/Commodity/tolist.do?user='+user;
            }
            //==============================================================================================================================//



            function pplatformmanager() {
                var a=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("pplatformmanagerId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Platform/tolist.do';
                //document.getElementById('Mainid').src='${ctx}/platform/merchantManagement.jsp';
            }

            function psuppliermanager() {
                var a=document.getElementById("platformId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("contractApartmentId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Supplier/tolist.do';
            }


            function operator() {
                var a=document.getElementById("setup").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("operator").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/User/tolist.do';
            }

            function exit() {
                var flag=confirm("确定退出吗?");
                if (flag==true){
                    //window.location.href="http://localhost:8080/hotelm/Login/tomain.do";
                    window.location.href="http://hotelm.sample.jichuangsi.com/hotelm/Login/tomain.do";
                }

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
			//获取当前年月
            function doHandleDate() {
                var myDate = new Date();
                var tYear = myDate.getFullYear();
                var tMonth = myDate.getMonth();

                var m = tMonth + 1;
                if (m.toString().length == 1) {
                    m = "0" + m;
                }
                return tYear + m;
            }
            //获取当前年月
            function doHandleDate2() {
                var myDate = new Date();
                var tYear = myDate.getFullYear();
                var tMonth = myDate.getMonth();

                var m = tMonth + 1;
                if (m.toString().length == 1) {
                    m = "0" + m;
                }
                return tYear +"-"+ m;
            }
            function getNowFormatDate() {
                var date = new Date();
                var seperator1 = "-";
                var year = date.getFullYear();
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = year + seperator1 + month + seperator1 + strDate;
                return currentdate;
            }
            function checkEn()
            {
                var ifr = document.getElementsByName("main")[0];
                var btn = ifr.contentWindow.document.getElementById("enBtn");
                btn.click();
            }
            function checkZh()
            {
                var ifr = document.getElementsByName("main")[0];
                var btn = ifr.contentWindow.document.getElementById("zhBtn");
                btn.click();
            }
			/*
            function hotelm() {
                var a=document.getElementById("hotelm2Id").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("bigGuide").innerHTML=a+"";
                var s=document.getElementById("hotelmId").getElementsByTagName('span')[0].innerHTML;
                document.getElementById("smallGuide").innerHTML=s+"";
                document.getElementById('Mainid').src='${ctx}/Hotelm/tolist.do';
            }*/
		</script>
	</body>
</html>
