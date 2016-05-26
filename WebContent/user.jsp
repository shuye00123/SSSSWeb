<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <style>
        .top {
            margin-top: 70px;
        }

        .line {
            line-height: 40px;
            font-size: 20px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="buy.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp首页</a>


        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">

            <form action="sGoodsA" method="post" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" name="chn_name" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-danger">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="user.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><s:property value="#session.customer.customer_name " /><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="user.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人中心</a></li>
                        <li><a href="shoppingcar.jsp"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a></li>
                        <li><a href="sOrdersA"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a></li>
                        <li class="divider"></li>
                        <li><a href="logout">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container top">
    <div class="row">
<div class="list-group col-md-2">
            <a href="user.jsp" class="list-group-item active"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人信息</a>
            <a href="shoppingcar.jsp" class="list-group-item"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a>
            <a href="sOrdersA" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a>
        </div>
        <div class="col-md-8 line">
            <h4><b>基本资料</b></h4>
            <hr class="feature-divider">
            <table class="table table-hover">
            <tr>
                <td class="col-md-4">用户名:</td>
                <td class="col-md-8"><s:property value="#session.customer.customer_no " /></td>
            </tr>
            <tr >
                <td class="col-md-4">姓名:</td>
                <td class="col-md-8"><s:property value="#session.customer.customer_name " /></td>
            </tr>
            <tr>
                <td class="col-md-4 ">性别:</td>
                <td class="col-md-8"><s:property value="#session.customer.sex " /></td>
            </tr>
            <tr >
                <td class="col-md-4">职业:</td>
                <td class="col-md-8"><s:property value="#session.customer.job " /></td>
            </tr>
            <tr >
                <td class="col-md-4 ">联系电话:</td>
                <td class="col-md-8"><s:property value="#session.customer.tel " /></td>
            </tr>
            <tr>
                <td class="col-md-4 ">联系地址:</td>
                <td class="col-md-8"><s:property value="#session.customer.addr " /></td>
            </tr>
            <tr >
                <td class="col-md-4 ">身份证:</td>
                <td class="col-md-8"><s:property value="#session.customer.idcard  " /></td>
            </tr>
            <tr >
                <td class="col-md-4 ">备注:</td>
                <td class="col-md-8"><s:property value="#session.customer.remark " /></td>
            </tr>
            </table>
            <div class="row top">
                <div class="col-md-2"><a href="#" class="btn btn-warning" data-toggle="modal" data-target="#myModal">编辑</a></div>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">编辑</h4>
                            </div>
                            <form action="eCoustomerA" method="post">
                            <div class="modal-body">
                                
                                    <input type="hidden" value="111"/>
                                    <div class="form-group">
                                        <label>用户名:</label>
                                        <input type="hidden" name="customer_id" value="<s:property value="#session.customer.customer_id"/>">
                                        <input type="text" class="form-control" readonly  required name="customer_no" value="<s:property value="#session.customer.customer_no"/>" >
                                    </div>
                                    <div class="form-group">
                                        <label>姓名:</label>
                                        <input type="text" class="form-control" name="customer_name"  required value="<s:property value="#session.customer.customer_name"/>" >
                                    </div>
                                    <div class="form-group">
                                        <label>性别:</label>
                                        <select class="form-control" name="sex" >
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>职业:</label>
                                        <input type="text" class="form-control" required name="job" value="<s:property value="#session.customer.job " />">
                                    </div>
                                    <div class="form-group">
                                        <label>联系电话:</label>
                                        <input type="text" class="form-control" required name="tel" value="<s:property value="#session.customer.tel " />">
                                    </div>
                                    <div class="form-group">
                						<label>联系地址:</label>
                						<input type="text" class="form-control" required name="addr" value="<s:property value="#session.customer.addr " />" />
            						</div>
                                    <div class="form-group">
                                        <label>身份证:</label>
                                        <input type="text" class="form-control" required name="idcard" value="<s:property value="#session.customer.idcard  " />">
                                    </div>
                                    <div class="form-group">
                                        <label>备注:</label>
                                        <textarea class="form-control" name="remark" ><s:property value="#session.customer.remark"/></textarea>
                                    </div>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">保存</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-10"><a href="#" class="btn btn-danger" data-toggle="modal" data-target=".bs-example-modal-sm">修改密码</a></div>
                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel1">修改密码</h4>
                            </div>
                            <form method="post" action="cPswA">
                            <div class="modal-body">
                                    <div class="form-group">
                                        <label>新密码:</label>
                                        <input type="password" class="form-control" required name="passwordnew" placeholder="新密码">
                                    </div>
                                    <div class="form-group">
                                        <label>新密码:</label>
                                        <input type="password" class="form-control" required name="repasswordnew" placeholder="确认新密码">
                                    </div>
                                    

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">保存</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>



<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
     $(function(){
    	 $('#myModal').modal({
    	 		show: false,
    	 		backdrop: 'static', 
    	 		keyboard: false
    	 	});
    	 $('.bs-example-modal-sm').modal({
 	 		show: false,
 	 		backdrop: 'static', 
 	 		keyboard: false
 	 	});



    });  
</script>
</body>
</html>