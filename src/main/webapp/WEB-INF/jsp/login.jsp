<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
     pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
 <style>
         #ss{
             width: 390px;
             height: 260px;
             margin: 130px auto;
             text-align: center;
             line-height: 38px;
             background: #5BC0DE;
             border-radius: 4px
         }
 </style>
<link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
     <form action="${pageContext.request.contextPath}/user/login" method="post" id="ss"> 
    <div class="form-group">
      <h3>登录页面</h3>
    </div>
  
  <div class="col-sm-offset-1 col-sm-8">
	  <table class="form-group">
	     <tr>
	       <td>账  号：</td>
	       <td><input type="text" id="name" name="name" placeholder="请输入账号" /></td>
	     </tr>
	     <tr>
	       <td>密   码：</td>
	       <td> <input type="password"  id="password" name="password" placeholder="请输入密码" /><br/></td>
	     </tr>
	  </table>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">登录</button>
    </div>
  </div>
  
 </form>
</body>
</html>