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

    <title>test</title>

    <!-- Bootstrap core CSS -->
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrapValidator.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
	<script src="js/jquery-1.12.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
</head>
<body>
	<div class="col-md-5 col-md-offset-5">
          	<button class="btn btn-success" data-toggle="modal" data-target="#addModal" role="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加员工</button>
    </div>
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
      		<div class="modal-content">
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  		&times;
            		</button>
            		<h4 class="modal-title" id="myModalLabel">
               			添加员工
            		</h4>
         		</div>
         <form action="addUser" method="post" id="addForm">
         	<div class="modal-body">
            	<div class="form-group">
    				<label for="username">姓名</label>
    				<input type="text" class="form-control" id="username" name="username" placeholder="姓名">
  				</div>
  				<div class="form-group">
    				<label for="password">密码</label>
    				<input type="password" class="form-control" id="password" name="password" placeholder="密码">
  				</div>
         	</div>
         	<div class="modal-footer">
            	<button type="button" class="btn btn-default" 
               		data-dismiss="modal">关闭
            	</button>
            	<button type="submit" class="btn btn-primary" >
               		提交
            	</button>
         	</div>
         </form>
      		</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

<script type="text/javascript">
$(document).ready(function() {
    $('#addForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>