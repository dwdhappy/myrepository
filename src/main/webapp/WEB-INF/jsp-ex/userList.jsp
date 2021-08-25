<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/static/css/metisMenu.min.css" />
<link rel="stylesheet" href="${path}/static/css/dataTables.bootstrap.css" />
<link rel="stylesheet" href="${path}/static/css/sb-admin-2.css" />
<link rel="stylesheet" href="${path}/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="${path}/static/css/boot-crm.css" />
<script type="text/javascript" src="${path}/static/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/static/js/metisMenu.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/static/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/static/js/sb-admin-2.js"></script>
<script type="text/javascript">
function addCustomer(){
	$("#customerList").hide();
	$("#addCustomer").show();
}
function deleteCustomer(id){
	if(confirm('确定删除该内容么？')){
		$.ajax({
			
			url:"http://localhost:8181/ssmdemo/user/delUser",
			type:"post",
			data:{"id":id},
			datatype:"json",
			success:function(data){
				if("success"==data.results){
					alert("删除成功");
					window.location.reload();
				}else{
					alert("删除失败");
				}
			}
		})
	}
}
function addSubmit(id){
		
		$.ajax({
			
			   url:"http://localhost:8181/ssmdemo/user/addUser",
			
			   type:"post",

			   data:{
				  	 	"name":name,
				  	 	"age":age,
				  	 	"password":password  
			   		},
			
			   datatype:"json",
			  
			   success:function(xincan){
				   if("success"==xincan.results){
					   
					   alert("添加成功");
					   
					   window.location.href="http://localhost:8181/ssmdemo/user/userList"
					   
				   }else{
					   alert(xincan.results)
					   
				   }
			   }
		})
}
function editCustomer(id){
	
	$.ajax({
		
		url:"http://localhost:8181/ssmdemo/user/getUser",
		type:"post",
		data:{"id":id}	
	})
}
function updateCustomer(){
	
	var id=$("#id").val();
	var name=$("#edit_customerName").val();
	var age=$("#edit_age").val();
	var password=$("#edit_password").val();
	
	//用Ajax传送数据
	$.ajax({
		
		url:"http://localhost:8181/ssmdemo/user/updateUser",
		type:"post",
		data:{
				"id":id,
				"name":name,
				"age":age,
				"password":password
			},
		dataType:"json",
		success:function(xincan){
			if("success"==xincan.results){
				   
				   alert("修改成功");
				   //跳转到所需数据展示页面
				   window.location.href="http://localhost:8181/ssmdemo/user/userList"
			   }else{
				   alert(xincan.results)
			   }
		}
	})	
}
</script>
</head>
<body>
     <div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">xxx管理系统 v2.0</a>
		</div>
		 <div class="row">
            <div class="text-right" style="padding-right:50px;padding-top:20px">                
                     <span style="color: red">当前用户：${currentuser.name } </span> 
                     <a href="${pageContext.request.contextPath }/user/logout">退出</a>
                                        
          </div>
            
            
        </div>
		<!-- /.navbar-header --> <!-- /.navbar-top-links -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容...">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button> </span>
						</div> 
					</li>
					<li><a href="#" class="active"> 用户信息</a></li>
					<li><a href="#" class="">员工信息</a></li>
					<li><a href="#" class="">部门信息</a></li>
					<li><a href="#" class="">考勤信息</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<!-- 高级查询 -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">用户管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="" method="post">
						<div class="form-group">
							<label for="customerName">用户名称</label> 
							<input type="text" class="form-control" id="name" name="name">
						</div>
						 <div class="form-group">
							<label for="customerFrom">来源</label> <select
								class="form-control" id="customerFrom" placeholder="客户来源"
								name="custSource">
								<option value="">--请选择--</option>
								<c:forEach items="" var="item">
									<option value=""
										<c:if test=""> selected</c:if>>
									</option>
								</c:forEach>
							</select>
						</div>		
						<div class="form-group">
							<label for="custLevel">级别</label> <select class="form-control"
								id="custLevel" name="custLevel">
								<option value="">--请选择--</option>
								<c:forEach items="" var="item">
									<option value=""
										<c:if test=""> selected</c:if>>
									</option>
								</c:forEach>
							</select>
						</div> 
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			
			<button class="btn btn-primary" onclick="addCustomer()">添加</button>
			
			<!-- 显示客户列表页面 -->
			<%@include file="allUser.jsp"%>
			
			<!-- 添加客户页面 -->
			<%@include file="addUser.jsp"%>
			
			<!-- 编辑客户页面 -->
			<%@include file="editUser.jsp"%>
			
		</div>
	</div>
</body>
</html>