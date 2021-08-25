<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			$.ajax({
				url:"http://localhost:8181/mavenproject/user/returntext",
				type:"post",
				datatype:"text",//表示服务器发送来的数据是字符串
				success:function(data){
					alert(data);
				}
			})
		})
	});
</script>
</head>
<body>
	<button id="btn">点我发送</button>
</body>
</html>