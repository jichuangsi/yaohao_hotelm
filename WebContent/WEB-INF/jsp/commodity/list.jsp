<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <title>自有公寓-商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
 <%-- <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <link rel="stylesheet" href="${ctx}/css/amazeui.min.css" type="text/css"></link>
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
  <script type="text/javascript" src="${ctx }/js/layer/layer.js"></script>
  <script type="text/javascript" src="${ctx }/js/amazeui.min.js"></script>--%>
	  <link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all" />
	  <link rel="stylesheet" href="${ctx}//css/index.css" />
	  <link rel="stylesheet" href="${ctx}//css/administration.css" />
	  <link rel="stylesheet" href="${ctx}/jslib/layui/css/modules/layui-icon-extend/iconfont.css" />
	  <script src=${ctx}/js/jquery.min.js"></script>
	  <script src="${ctx}/js/layui/layui.all.js"></script>

	  <style>
		  .x-body {
			  padding: 20px;
		  }
		  .widths{
			  width: 300px;
		  }
		  #add_apar {
			  display: none;
			  margin-top: 10px;
		  }
		  #modify_apar {
			  display: none;
			  margin-top: 10px;
		  }
		  .layui-form-label{
			  width: 110px;
		  }
		  .layui-input-block {
			  margin-left: 150px
		  }
	  </style>
  <body>
  <div class="x-body">
	  <div class="layui-row">
		  <form class="layui-form layui-col-md12">
			  <!-- <div class="layui-input-inline">
                  <input type="text" name="username" placeholder="流水号" autocomplete="off" class="layui-input" style="width: 200px;">
              </div> -->
			  <div class="layui-input-inline">
				  <input type="text" name="courierNumber" placeholder="关键字" autocomplete="off" class="layui-input time" style="width: 200px;">
			  </div>

			  <div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
		  </form>
	  </div>
	  <table id="demo" lay-filter="test"></table>
  </div>
  </body>
  <script type="text/html" id="add">
	  <div class="layui-btn layui-btn-normal" onclick="add()"><i class=" layui-icon layui-icon-addition "></i>添加</div>
  </script>
  <script type="text/html" id="operation">
	  <div class="layui-btn layui-btn-normal layui-btn-sm" onclick="modify()"><i class=" layui-icon layui-icon-edit "></i>修改</div>
	  <div class="layui-btn layui-btn-normal layui-btn-sm" ><i class=" layui-icon layui-icon-delete "></i>删除</div>
  </script>
  <!-- 添加 -->
  <div id="add_apar" class="layui-fluid">
	  <form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
		  <div class="layui-form-item">
			  <label class="layui-form-label">商品名称：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="firstPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <label class="layui-form-label">商品类别：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="firstPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <label class="layui-form-label">计量单位：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="secondPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <label class="layui-form-label">销售价格：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="secondPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <div class="layui-input-block">
				  <div class="layui-btn" lay-submit lay-filter="update_Pwd">添加</div>
			  </div>
		  </div>
	  </form>
  </div>
  <!-- 修改 -->
  <div id="add_apar" class="layui-fluid">
	  <form class="layui-form" autocomplete="off" lay-filter="mod_pwd">
		  <div class="layui-form-item">
			  <label class="layui-form-label">商品名称：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="firstPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <label class="layui-form-label">商品类别：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="firstPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <label class="layui-form-label">计量单位：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="secondPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <label class="layui-form-label">销售价格：</label>
			  <div class="layui-input-block widths">
				  <input type="password" name="secondPwd" class="layui-input " lay-verify="required">
			  </div>
		  </div>
		  <div class="layui-form-item">
			  <div class="layui-input-block">
				  <div class="layui-btn" lay-submit lay-filter="update_Pwd">修改</div>
			  </div>
		  </div>
	  </form>
  </div>
  <script>
      function add() {
          index = layer.open({
              type: 1,
              area: ['30%', '60%'],
              anim: 2,
              title: '添加',
              maxmin: true,
              shadeClose: true,
              content: $("#add_apar")
          });
      }
      function modify() {
          index = layer.open({
              type: 1,
              area: ['30%', '60%'],
              anim: 2,
              title: '修改',
              maxmin: true,
              shadeClose: true,
              content: $("#modify_apar")
          });
      }
  </script>
  <script>
      layui.use(['form', 'table'], function() {
          var form = layui.form,
              table = layui.table;

          table.render({
              elem: '#demo',
              method: "get",
              async: false,
              id: 'idTest',
              url: '/',
              cols: [
                  [{
                      field: 'id',
                      title: '序号',
                      type: 'numbers'
                  },
                      {
                          field: 'account',
                          align: 'center',
                          title: '商品名称'
                      },
                      {
                          field: 'account',
                          align: 'center',
                          title: '商品类别'
                      },
                      {
                          field: 'userName',
                          align: 'center',
                          title: '计量单位'
                      },
                      {
                          field: 'userName',
                          align: 'center',
                          title: '销售价格'
                      },
                      {
                          field: 'account',
                          align: 'center',
                          title: '操作',
                          width: 300,
                          toolbar: '#operation'
                      }
                  ]
              ],
              toolbar: '#add',
              defaultToolbar: [],
              page: true,
              limit: 10,
              // loading: true,
              request: {
                  pageName: 'pageNum',
                  limitName: "pageSize"
              },
              where: {},
              parseData: function(res) {
                  var arr;
                  var code;
                  var total = 0;
                  if (res.code == "0010") {
                      arr = res.data;
                      total = res.total;
                      code = 0;
                  }
                  return {
                      "code": code,
                      "msg": res.msg,
                      "count": total,
                      "data": arr
                  };
              }
          });
      })
  </script>
</html>
