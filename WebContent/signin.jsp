<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><title>无标题文档</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<title>登录</title>
	<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">	
	<link href="signin.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<form class="form-signin" method="post" action="signin">
			<h2 class="form-signin-heading">请登录</h2>
			<lable for="inputEmail"  class="sr-only">用户名</lable>
			<input type="text" id="username" class="form-control" placeholder="Password">
			<lable for="inputPassword" class="sr-only">密码</lable>
			<input type="password" id="password" class="form-control" placeholder="Password" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		</form>
	
	</div><!-- /container -->
	
</body>
</html>