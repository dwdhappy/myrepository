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
<title>用户列表</title>
<link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	function del(id){
		if(confirm('确定删除该内容么？')){
			$.ajax({
				
				url:"http://localhost:8181/mavenproject/user/delUser",
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
	
</script>
</head>
<body>
     <div class="container">
        <!-- 标题 -->
        <div class="row">
            <center><h1>用户管理</h1></center>  
            <div class="text-right">
                        <p style="color: red">当前用户：${currentuser.name }
                         <a href="${pageContext.request.contextPath }/user/logout">退出</a>
                        </p>                  
            </div>
            
            
        </div>
        <!-- 按钮 -->
        <div class="row">
            <div class="text-left">
                <a class="btn btn-primary" href="${path}/user/toAddUser">新增</a>
            </div>
        </div>
        <!-- 表格  -->
        <div class="row" style="heigh:350px">
            <div class="col-md-12"style="heigh:350px">
                <table class="table" style="heigh:350px">
                    <tr>
                        <th>id</th>
                        <th>用户名</th>
                        <th>年龄</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${list}" var="user">
                        <tr>
                        <td>${user.id}</td>
                        <td>${user.name }</td>
                            <td>${user.age }</td>
                            <!-- <td><a  class="edit">编辑</a> <a
                                 class="delete">删除</a></td> -->
                            <td>
                                <a type="button"  href="${path}/user/getUser?id=${user.id}" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                                                编辑</a>
                                 <a href="javascript:del(${user.id})">                                
                                 <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                                                                 删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <hr style="height:1px;border:none;border-top:1px solid #ccc;" />
        <!-- 分页导航栏 -->

        <!-- 分页信息 -->
        <div class="row">
            <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
            <div class="col-md-6">
                             当前第：${page.pageNum}页，总共：${page.pages}页，总共：${page.total}条记录
            </div>

        <!-- 分页条 -->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <li><a href="${path}/user/userList.action?pn=1">首页</a></li>
                    <!-- 是否有上一页 -->
                    <c:if test="${page.hasPreviousPage }">
                         <li>
                          <a href="${path}/user/userList.action?pn=${page.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                          </a>
                        </li>
                    </c:if>

                    <c:forEach items="${page.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == page.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != page.pageNum }">
                            <li><a href="${path}/user/userList.action?pn=${ page_Num}">${ page_Num}</a></li> 
                           
                        </c:if> 
                    </c:forEach>  
                    <!-- 是否有下一页 -->
                    <c:if test="${page.hasNextPage }">
                        <li>
                          <a href="${path}/user/userList.action?pn=${page.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                    </c:if>   
                    <li><a href="${path}/user/userList.action?pn=${page.pages}">末页</a></li>
                  </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>