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
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="${path}/static/bootstrapvalidator/css/bootstrapValidator.css"/>
<link rel="stylesheet" href="${path}/static/css/style.default.css" id="theme-stylesheet">
</head>
<body>
	  <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>欢迎登录</h1>
                  </div>
                  <p>用户管理系统</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div ></div>
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form method="post" action="${path}/user/login" class="form-validate" id="loginFrom">
                    <div class="form-group">
                      <input id="login-username" type="text" name="name"  placeholder="用户名" value="admin" class="form-control">
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="password" name="password"  placeholder="密码" class="form-control">
                    </div>
                    <button id="login" type="submit" class="btn btn-primary">登录</button>
                  
                  </form>
                  <br />
                  <small>没有账号?</small><a href="${path}/register.jsp" class="signup">&nbsp;注册</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
<script type="text/javascript" src="${path}/static/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${path}/static/bootstrapvalidator/js/bootstrapValidator.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#loginFrom').bootstrapValidator({
        feedbackIcons: {  //根据验证结果显示的各种图标 
            valid: 'glyphicon glyphicon-ok',  //验证成功图标
            invalid: 'glyphicon glyphicon-remove', //验证失败图标
            validating: 'glyphicon glyphicon-refresh'  //验证中图标
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {  //检测非空
                        message: '文本框必须输入'
                    },
                    stringLength: { //检测长度  
                        min: 3,
                        max: 30,
                        message: '长度必须在6-30之间'
                    },
                    regexp: { //正则验证  
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: '所输入的字符不符要求'
                    }  
                }
            },
            password: {
                validators: {
                    notEmpty: { //检测非空
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 5,
                        message: '密码的长度必须至少为5个字符'
                    }
                }
            }  
        }
    });
});
</script>   
</body>
</html>