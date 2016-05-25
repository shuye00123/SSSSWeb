<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
          <form class="navbar-form navbar-right" action="selectUser" method="post">
            <input type="text" class="form-control" name="key" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <c:if test="${user.post eq '管理员'}">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="selectAllUser" >员工操作</a></li>
          </ul>
          </c:if>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">查询结果</h1>
          <table class="table table-hover piece" style="margin-left: 0;">
          <thead>
          	<tr>
          		<th>ID</th>
          		<th>姓名</th>
          		<th>联系方式</th>
          		<th>性别</th>
          		<th>职位</th>
          		<th>编辑</th>
          		<th>删除用户</th>
          	</tr>
          </thead>
          <tbody>
          	<s:iterator value="list" >  
       		<tr>  
          		<td><s:property value="userid"/></td>  
          		<td><s:property value="username"/></td>
          		<td><s:property value="phonenum"/></td>
          		<td><s:property value="usex"/></td>  
          		<td><s:property value="post"/></td> 
          		<td><a href="javascript:void(0);" class="btn btn-warning" rel="${userid}" role="button" /><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>修改资料</a></td>
   				<td><a href="deleteUser?userid=${userid}" class="btn btn-danger" role="button" /><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除用户</a></td>
       		</tr>  
    		</s:iterator>  
          </tbody>
          </table>
          	<s:url id="url_pre" value="selectUser">  
         		<s:param name="pageNow" value="pageNow-1"></s:param>
         		<s:param name="key" value="%{key}"></s:param>  
     		</s:url>  
  
     		<s:url id="url_next" value="selectUser">  
         		<s:param name="pageNow" value="pageNow+1"></s:param>
         		<s:param name="key" value="%{key}"></s:param>    
     		</s:url>    
  			
  			<s:if test="%{pageNow!=1}">
     			<s:a href="%{url_pre}" class="btn btn-primary btn-lg" role="button">上一页</s:a>
     		</s:if>
       		<s:else>
       			<s:a href="%{url_pre}" class="btn btn-primary btn-lg disabled" role="button">上一页</s:a>
       		</s:else>
     		<s:bean name="org.apache.struts2.util.Counter" id="counter">
   				<s:param name="first" value="1" />
   				<s:param name="last" value="%{pageNum}" />
   				<s:iterator>
     				<a href="selectUser?pageNow=<s:property/>&key=${key}" class="btn btn-primary btn-lg" role="button"><s:property/></a>
   				</s:iterator>
			</s:bean> 
  			<s:if test="%{pageNum>pageNow}">
     			<s:a href="%{url_next}" class="btn btn-primary btn-lg" role="button">下一页</s:a>
     		</s:if>
     		<s:else>
     			<s:a href="%{url_next}" class="btn btn-primary btn-lg disabled" role="button">下一页</s:a>
     		</s:else>
        </div>
      </div>
    </div>
    <!-- 模态框（Modal） -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
      		<div class="modal-content">
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  		&times;
            		</button>
            		<h4 class="modal-title" id="myModalLabel">
               			修改资料
            		</h4>
         		</div>
         <form action="changeUser" method="post" id="changeForm">
         	<div class="modal-body">
            	<div class="form-group">
    				<label for="username">姓名</label>
    				<input type="text" class="form-control" id="username" name="username" placeholder="姓名">
  				</div>
  				<div class="form-group">
    				<label for="phonenum">手机号码</label>
    				<input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="手机号码">
  				</div>
  				<div class="form-group">
    				<label for="post">职位</label>
    				<input type="text" class="form-control" id="post" name="post" placeholder="职位">
  				</div>
  				<div class="radio">
  					<label>
    				<input type="radio" name="usex" id="optionsRadios1" value="男">男
  					</label>
  					<label>
    				<input type="radio" name="usex" id="optionsRadios2" value="女" >女
  					</label>
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
            	<div class="form-group">
    				<label for="password">原密码</label>
    				<input type="password" class="form-control" id="password" name="password" placeholder="密码">
  				</div>
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
	<script type="text/javascript">
	$(function ()
	{ $("#example_bottom").popover({html: true ,placement:'bottom',title: '${session.user["username"]}', 
		content: '<strong>${session.user["usex"]}<br>${session.user["post"]}</strong><a class="btn btn-danger" data-toggle="modal" data-target="#pswModal" role="button">修改密码</a>'});
	});
	
	$(document).ready(function() {
		  $(".btn-warning").click(function() {
		    var id = $(this).attr('rel');
		    $("#myModal .modal-content > form").attr("action", "changeUser?userid=" + id);
		    $("#myModal").modal();
		  });
		  
		  $('#changeForm').bootstrapValidator({
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
		                    stringLength: {
		                        min: 1,
		                        max: 8,
		                        message: '姓名长度必须小于8'
		                    },
		                    regexp: {
		                        regexp: /^[A-Za-z\u4e00-\u9fa5]+$/,
		                        message: '含有非法字符'
		                    }
		                }
		            },
		            phonenum: {
		                message: 'The phonenum is not valid',
		                validators: {
		                    stringLength: {
		                        min: 11,
		                        max: 11,
		                        message: '长度必须为11位'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]+$/,
		                        message: '含有非法字符'
		                    }
		                }
		            }
		        }
		  });
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