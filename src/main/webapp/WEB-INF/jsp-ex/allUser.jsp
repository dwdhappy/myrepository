<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<!-- 所有客户列表 -->
<div class="row" id="customerList">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">用户信息列表</div>
			<!-- /.panel-heading -->
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>用户名</th>
						<th>年龄</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.name}</td>
							<td>${user.age}</td>
							<td><a href="#" class="btn btn-primary btn-xs"
								data-toggle="modal" data-target="#customerEditDialog"
								onclick="editCustomer(${user.id})">修改</a> 
								<a href="#" class="btn btn-danger btn-xs"
								onclick="deleteCustomer(${user.id})">删除</a>
						    </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			 <div class="col-md-12 text-right">
				<!-- 分页标签 -->
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
</div>