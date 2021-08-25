<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
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
        		   
        		   //使用ajax进行添加操作
        		   //jquery获取文本框里的值
        		   var name=$("#txtname").val();
        		   var age=$("#txtage").val();
        		   var password=$("#txtpassword").val();
        		   //使用Ajax发送数据
        		   $.ajax({
        			   //数据发送到什么地方去(使用绝对路径)*必填
        			   url:"http://localhost:8181/mavenproject/user/addUser",
        			   //请求发送方式
        			   type:"post",
        			   //要发送的数据(以json对象方式传送)
        			   data:{
        				  	 	"name":name,
        				  	 	"age":age,
        				  	 	"password":password  
        			   		},
        			   	//指出服务器返回到前端的数据类型
        			   datatype:"JSON",
        			   //处理服务器返回的数据的回调函数
        			   success:function(xincan){//xincan就是{"results":"success"}的json内容
        				   if("success"==xincan.results){
        					   
        					   alert("添加成功");
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
    <h1>添加用户</h1>
	    <form action="" name="userForm" method="">
	    <table >
	        <tr>
	          <td>姓名： </td>
	          <td> <input type="text" name="name" id="txtname"></td>
	        </tr>
	         <tr>
	          <td>年龄： </td>
	          <td> <input type="text" name="age" id="txtage"></td>
	        </tr> 
	        <tr>
	          <td>密码： </td>
	          <td><input type="text" name="password" id="txtpassword"> </td>
	        </tr>
	         
	        <tr>
	          <td colspan="2" align="center">
	          <!-- <input type="submit" value="添加"> -->
	          <input type="button" id="ss" value="添加">
	          <input type="button" onclick="history.go(-1)" value="取消"></td>
	        </tr> 
	    </table>      
	    </form>
   </div>
</body>
</html>