<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>汽车4S店管理平台</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrapValidator.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
	<script src="js/jquery-1.12.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
    
  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.jsp">4S店管理平台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="main.jsp">主页</a></li>
            <li><a href="#" id="example_bottom" rel="popover" >个人资料</a></li>
            <li><a href="signout">退出登录</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">主页<span class="sr-only">(current)</span></a></li>
          </ul>
          <c:if test='${session.user.post eq "管理员"}'>
          <ul class="nav nav-sidebar">
            <li><a href="selectAllUser" >员工操作</a></li>
          </ul>
          </c:if>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h2 class="sub-header">主页</h2>
          <div class="table-responsive">
            	<h3>${user.username}，欢迎你!</h3>
            	
          </div>
        </div>
      </div>
    </div>
    <script type="text/JavaScript"> 
			var msg="${requestScope.Message}";
			if(msg!=""){
				alert(msg);
			}
	</script>
	<div class="modal fade" id="pswModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
      		<div class="modal-content">
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  		&times;
            		</button>
            		<h4 class="modal-title" id="myModalLabel">
               			修改密码
            		</h4>
         		</div>
         <form action="changePsw" method="post" id="pswForm">
         	<div class="modal-body">
            	<div id="err"><div class="form-group">
    				<label for="password">原密码</label>
    				<input type="password" class="form-control" id="password" name="password" placeholder="密码">
  				</div></div>
  				<div class="form-group">
    				<label for="password">新密码</label>
    				<input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="密码">
  				</div>
  				<div class="form-group">
    				<label for="repassword">新密码</label>
    				<input type="password" class="form-control" id="repassword" name="repassword" placeholder="密码">
  				</div>
         	</div>
         	<div class="modal-footer">
            	<button type="button" class="btn btn-default" 
               		data-dismiss="modal">关闭
            	</button>
            	<button type="submit" class="btn btn-primary" >
               		提交更改
            	</button>
         	</div>
         </form>
      		</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
    <script>
    $(function ()
    		{ $("#example_bottom").popover({html: true ,placement:'bottom',title: '${session.user["username"]}', 
    			content: '<strong>${session.user["usex"]}<br>${session.user["post"]}</strong><a class="btn btn-danger" data-toggle="modal" data-target="#pswModal" role="button">修改密码</a>'});
    		});
    $(document).ready(function() {
    
  		$('#pswForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: '密码长度必须小于10位'
                    },
                }
            },
        	newpassword: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: '密码长度必须小于10位'
                    },
                    identical: {
                        field: 'repassword',
                        message: '两次新密码不同'
                    }
                }
            },
            repassword: {
                validators: {
                	notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: '密码长度必须小于10位'
                    },
                    identical: {
                        field: 'newpassword',
                        message: '两次新密码不同'
                    }
                }
            }
        }
  });
});
	</script>
  </body>
</html>	