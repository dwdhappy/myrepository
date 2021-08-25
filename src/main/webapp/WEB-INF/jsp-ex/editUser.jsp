<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 客户编辑对话框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
					<input type="hidden" id="id" name="id" value="${user.id}"/>
					<div class="form-group">
						<label for="edit_customerName" class="col-sm-2 control-label">用户名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_customerName"
								placeholder="用户名称" name="name" value="${user.name}">
						</div>
					</div>
					<%-- <div class="form-group">
						<label for="edit_customerFrom"
							style="float:left;padding:7px 15px 0 27px;">客户来源</label>
						<div class="col-sm-10">
							<select class="form-control" id="edit_customerFrom"
								placeholder="客户来源" name="cust_source">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name
										}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custIndustry"
							style="float:left;padding:7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10">
							<select class="form-control" id="edit_custIndustry"
								name="cust_industry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name
										}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custLevel"
							style="float:left;padding:7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select class="form-control" id="edit_custLevel"
								name="cust_level">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name
										}</option>
								</c:forEach>
							</select>
						</div>
					</div> --%>
					<div class="form-group">
						<label for="edit_age" class="col-sm-2 control-label">年龄</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_age"
								placeholder="年龄" name="age">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_password"
								placeholder="密码" name="password">
						</div>
					</div>
					<!-- <div class="form-group">
						<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_mobile"
								placeholder="移动电话" name="cust_mobile">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_zipcode"
								placeholder="邮政编码" name="cust_zipcode">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address"
								placeholder="联系地址" name="cust_address">
						</div>
					</div> -->
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					onclick="updateCustomer()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- /#wrapper -->