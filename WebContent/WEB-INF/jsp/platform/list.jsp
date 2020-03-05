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
			<label class="labelroomnumber">平台名称：<br/><span style="font-size: 12px;">Platform name</span></label>
			<form action="${ctx}/Platform/tolist.do" method="post" style="float: left;">
				<input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
				<div class="input-append">
					<button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>search</button>
				</div>
			</form>
		</div>
	</div>
	<div class="span6">
		<div class="row-fluid">
			<div class="span3">
				<button class="btn btn-info btn-small textone" type="button" onclick="addfunction()">
					<li class="icon-plus icon-white"></li>add</button>
			</div>
			<div class="span3">
				<button class="btn btn-warning btn-small textone" type="button" onclick="updatefunction()">
					<li class="icon-pencil icon-white"></li>modify</button>
			</div>
			<%--<div class="span3">
				<button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>
			</div>--%>
		</div>
	</div>
	<br>
	<div class="dgvone">
		<table class="table table-condensed table-bordered table-striped" id="tableid">
			<thead class="theadone">
			<tr>
				<th >选择<br/><span style="font-size: 12px;">Choice</span></th>
				<th >名称<br/><span style="font-size: 12px;">Name</span></th>
				<th >是否启用<br/><span style="font-size: 12px;">Is it enabled</span></th>
			</tr>
			</thead>
			<tbody id="tbody">
			<c:forEach items="${list.result}" var="item">
				<tr>
					<td><input type="checkbox" name="id" value="${item.id}"></td>
					<td>${item.name}</td>
						<c:if test="${item.isYong==0}">
							<td><a style="color:#00be67;margin-right: 30px">已启用<span style="font-size: 12px;">Enabled</span></a>
								<a style="color: red"href="${ctx}/Platform/delete.do?id=${item.id}">禁用<span style="font-size: 12px;">Prohibit</span></a></td>
						</c:if>
					<c:if test="${item.isYong==1}">
						<td><a style="color: #00be67;margin-right: 30px">已禁用<span style="font-size: 12px;">disabled</span></a>
							<a style="color: red"href="${ctx}/Platform/enabled.do?id=${item.id}">启用<span style="font-size: 12px;">Enable</span></a></td>

					</c:if>
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
    function addfunction(){
        parent.document.getElementById('Mainid').src='${ctx}/Platform/toadd.do';
    }

    function updatefunction(){
        var chk_value=[];
        $('input[name="id"]:checked').each(function(){
            chk_value.push($(this).val());
        });
        if(chk_value!=""){
            if(chk_value.toString().indexOf(",")>0){
                alert("修改只能选择一条"+' \n '+"Only one can be selected for modification");
            }else{
                parent.document.getElementById("Mainid").src='${ctx}/Platform/toupdate.do?id='+chk_value;
            }
        }else{
            alert("请选择一条数据进行修改"+' \n '+"Please select a piece of data to modify");
        }
    }

    function deletefunction(){
        var chk_value=[];
        $('input[name="id"]:checked').each(function(){
            chk_value.push($(this).val());
        });
        if(chk_value!=""){
            var flag=window.confirm("注意：您确定要永久删除该信息吗?"+' \n '+"Are you sure you want to permanently delete this information");
            if(flag){
                parent.document.getElementById("Mainid").src='${ctx}/Platform/delete.do?id='+chk_value;
            }
        }else{
            alert("请选择一条或多条数据进行删除"+' \n '+"Please select one or more data to delete");
        }

    }

    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${list.totalPage},
        current:${list.currentPage},
        backFn:function(p){
            var txtname=document.getElementById("txtnameid").value;
            location.href="${ctx}/Platform/tolist.do?currentPage="+p+"&name="+txtname;
        }
    });

</script>

</body>
</html>
