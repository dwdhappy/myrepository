<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户</title>
<style>
        div{
	        border:1px red solid;
	        width:300px;
	        height:300px;
	        margin:auto;
	        background: #5BC0DE
         }  
</style> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#ss").click(function(){
			
			//获取修改值
			var id=$("#txtid").val();
			var name=$("#txtname").val();
			var age=$("#txtage").val();
			var password=$("#txtpassword").val();
			//使用字符串形态的json对象
			var latedata={
					id:id,
					name:name,
					age:age,
					password:password
			}
			//用Ajax传送数据
			$.ajax({
				
				url:"http://localhost:8181/mavenproject/user/updateUser",
				type:"post",
				/* data:{
						"id":id,
						"name":name,
						"age":age,
						"password":password
					}, */
				data:JSON.stringify(latedata),//会产生一个json格式的字符串到后台
				dataType:"json",
				contentType:"application/json;charset=utf-8",//向服务器发送的数据格式设置，application/json;表示格式是json字符串而非对象
				success:function(xincan){
					if("success"==xincan.results){
 					   
 					   alert("修改成功");
 					   //跳转到所需数据展示页面
 					   window.location.href="http://localhost:8181/mavenproject/user/userList"
 				   }else{
 					   alert(xincan.results)
 				   }
				}
			})
		})
	});
</script>
</head>
<body style="padding-top:10%;">
     
      <div>
    <h1>修改用户</h1>
    <form action="" name="userForm" method="">
           <input type="hidden" name="id" value="${user.id }" id="txtid"/> 
    <table>
       <tr>
          <td>姓名：</td>
          <td><input type="text" name="name" value="${user.name }" id="txtname"/> </td>
       </tr>
       <tr>
          <td>年龄：</td>
          <td><input type="text" name="age" value="${user.age }" id="txtage"/> </td>
       </tr>
       <tr>
          <td> 密码：</td>
          <td> <input type="text" name="password" value="${user.password }" id="txtpassword"/> </td>
       </tr>
       <tr>
          <td colspan="2" align="center"> 
         <!--<input type="submit" value="保存"/>  --> 
          <input type="button" id="ss" value="修改">
          <input type="button" onclick="history.go(-1)" value="取消">
          </td>
       </tr>
    </table>        
  
    </form>
    </div>
       
     
</body>
</html>