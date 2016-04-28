<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>登录</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">
	<script src="js/jquery-1.12.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>

<body>
<div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">4S店管理</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li ><a href="index.jsp">Home</a></li>
                  <li class="active"><a href="signin.jsp">登录</a></li>
                </ul>
              </nav>
            </div>
          </div>
          <div id="err">
			<div></div>
		  </div>
          <script type="text/JavaScript"> 
			var msg="${requestScope.Message}";
			if(msg!=""){
				var html ='<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>用户名或密码错误</div>';
				var target = document.getElementById('err');
				target.innerHTML = html;
			}
		  </script>
			
		  
          <form class="form-signin" method="post" action="signin">
			<h2 class="form-signin-heading">${flag}请登录</h2>
			<lable for="inputEmail"  class="sr-only">帐号</lable>
			<input type="text" id="username" name="username" class="form-control" placeholder="帐号" required>
			<lable for="inputPassword" class="sr-only">密码 </lable>
			<input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		  </form>

          <div class="mastfoot">
            <div class="inner">
              <p>template for <a href="http://getbootstrap.com">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
            </div>
          </div>

        </div>

      </div>

    </div>
</body>
</html>