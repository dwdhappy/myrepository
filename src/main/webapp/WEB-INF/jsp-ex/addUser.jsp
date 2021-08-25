<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 添加客户列表 -->
<div class="row" id="addCustomer" style="display: none">
	<div class="col-lg-12">
		<form id="addCustomerForm" class="form-horizontal" style="width: 600px; margin: 0 auto;" method="post">
			<div class="form-group">
				<label for="edit_name" class="col-sm-2 control-label">用户名称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="用户名称"
						name="name" id="txtname">
				</div>
			</div>
			<%-- <div class="form-group">
				<label for="edit_customerFrom" class="col-sm-2 control-label">客户来源</label>
				<div class="col-sm-10">
					<select class="form-control" placeholder="客户来源" name="cust_source">
						<option value="">--请选择--</option>
						<c:forEach items="${fromType}" var="item">
							<option value="${item.dict_id}">${item.dict_item_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="edit_custIndustry" class="col-sm-2 control-label">所属行业</label>
				<div class="col-sm-10">
					<select class="form-control" name="cust_industry">
						<option value="">--请选择--</option>
						<c:forEach items="${industryType}" var="item">
							<option value="${item.dict_id}">${item.dict_item_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="edit_custLevel" class="col-sm-2 control-label">客户级别</label>
				<div class="col-sm-10">
					<select class="form-control" name="cust_level">
						<option value="">--请选择--</option>
						<c:forEach items="${levelType}" var="item">
							<option value="${item.dict_id}">${item.dict_item_name}</option>
						</c:forEach>
					</select>
				</div>
			</div> --%>
			<div class="form-group">
				<label for="edit_age" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="年龄"
						name="age" id="txtage">
				</div>
			</div>
			<div class="form-group">
				<label for="edit_password" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="密码"
						name="password" id="txtpassword">
				</div>
			</div>
			<!-- <div class="form-group">
				<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="移动电话"
						name="cust_mobile">
				</div>
			</div>
			<div class="form-group">
				<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="邮政编码"
						name="cust_zipcode">
				</div>
			</div>
			<div class="form-group">
				<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="联系地址"
						name="cust_address">
				</div>
			</div> -->
			
			<div class="form-group text-right">
				<button class="btn btn-default" onclick="addSubmit()">添加</button>
				<button class="btn btn-default" onclick="backSubmit()">返回</button>
			</div>
		</form>
	</div>
</div>
<!-- /#page-wrapper -->
