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

		.textone{
			margin-top:12px;
		}

		.rightOne{
			margin-right: 50px;
			font-size:16px;
		}

		.table th,.table td{
			text-align: center;
		}

		.theadone{
			background-color: #CCFF99;
		}

		.dgvone{
			margin-top: 12px;
		}

		.roomnumberwidth{
			width:70%;
		}


	</style>

</head>


<body>
<div class="container" >
	<div class="span5">
		<div class="row-fluid">
			<label class="labelroomnumber">酒店入住情况：<br/><span style="font-size: 12px;">Hotelm Check-in</span> </label>
			<form action="${ctx}/Hotelm/tolist.do" method="post" style="float: left;">
				<input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
				<div class="input-append">
					<button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>search</button>
				</div>
			</form>
		</div>
	</div>
	<br>
	<div class="dgvone">
		<table class="table table-condensed table-bordered table-striped" id="tableid">
			<thead class="theadone">
			<tr>
				<th >选择<br/><span style="font-size: 12px;">Choice</span></th>
				<th >名称<br/><span style="font-size: 12px;">Name</span></th>
			</tr>
			</thead>
			<tbody id="tbody">
			<c:forEach items="${list.result}" var="item">
				<tr>
					<td><input type="checkbox" name="id" value="${item.id}" id="supper"></td>
					<td>
						<a href="${ctx}/Hotelm/toRoomList.do?currentPage=1&id=${item.id}">
							${item.supplierName}
							</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="span11">
		<div class="row-fluid">
			<div class="tcdPageCode" style="text-align:center;"></div>
		</div>
	</div>
</div>






<script type="text/javascript">

   /* function checkRoom(){
      /!*  var id=r.value;
        alert(id);*!/
       parent.document.getElementById('Mainid').src='${ctx}/Hotelm/toRoomList.do?currentPage=1';
    }*/

    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${list.totalPage},
        current:${list.currentPage},
        backFn:function(p){
            var txtname=document.getElementById("txtnameid").value;
            location.href="${ctx}/Supplier/tolist.do?currentPage="+p+"&name="+txtname;
        }
    });

</script>

</body>
</html>
