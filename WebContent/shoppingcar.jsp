<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

        .img {
            width: 70px;
            height: 70px;
        }

        .text {
            width:40px;
            line-height:25px;
            text-align: center;
        }

        .break {
            word-wrap: break-word;
        }

        .center {
            width: 100%;
            height: 90px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #fcfcfc;
            margin:10px 0;
        }

        .head {
            line-height: 40px;
        }

        .list {
            float:left;
            padding-left: 10px;
        }

        .check {
            padding-left: 40px;
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

            <form  action="sGoodsA" method="post" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">王建程<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人中心</a></li>
                        <li><a href="sshopCart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a></li>
                        <li><a href="sOrdersA"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container top">
    <div class="row">
        <div class="list-group col-md-2">
            <a href="user.html" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人信息</a>
            <a href="shoppingcar.html" class="list-group-item active"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a>
            <a href="sOrdersA" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a>
        </div>
        <div class="col-md-10">
            <table class="table table-hover">
               <thead>
               <tr>
                   <th width="50px"><input id="all" type="checkbox" class="head" >全选</th>
                   <th width="60px"></th>
                   <th width="200px">商品信息</th>
                   <th width="80px">单价</th>
                   <th width="100px">数量</th>
                   <th width="80px">金额</th>
                   <th width="80px">操作</th>
               </tr>
               </thead>
                <tbody id="list">
                <s:iterator value="list" var="u">
                <tr>
                    <td><input  type="checkbox" value="<s:property value="#u.id"/>"></td>
                    <td>
                        <a href="#"><img class="img" src="file:///<s:property value="#u.img"/>"></a>
						<input type="hidden" value="<s:property value="#u.order_list_id"/>">
                    </td>
                    <td>
                        <a class="break" href="sDetialGoodsA?id=<s:property value="#u.id"/>"><s:property value="#u.chn_name"/></a>
                    </td>
                    <td><s:property value="#u.price"/></td>
                    <td>
                        <a class="btn btn-default reduce" >-</a>
                        <input type="text" name="num" class="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="<s:property value="#u.num"/>" />
                        <a class="btn btn-default add" href="#">+</a>
                    </td>
                    <td><label class="total"><s:set name="a" value="0" /> <s:property value="#u.num*#u.price"/></label></td>
                    <td><a href="#" id="delete">删除</a></td>
                </tr>
                </s:iterator>
               
                </tbody>
            </table>

        </div>

    </div>
</div>
<div class="container">
    <ul class="nav nav-pills nav-justified ">
        <a href="#" class="btn btn-danger pull-right" id="submit">结算</a>
    </ul>
</div>
<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(function(){
        $(".add").click(function(){
            var me = this;
            var t=$(this).parent().find('input[class*=text]');
            t.val(parseInt(t.val())+1);
            setTotal(me);
        });
        $(".reduce").click(function(){
            var me = this;
            var t=$(this).parent().find('input[class*=text]');
            t.val(parseInt(t.val())-1);
            if(parseInt(t.val())<1){
                t.val(1);
            }
            setTotal(me);
        });

        function setTotal(obj){
            var s=0;
            //$("#tab td").each(function(){
            s+=parseInt($(obj).parent().find('input[class*=text]').val())*10.00;
            //});

            $(obj).parent().siblings().find('label[class*=total]').html(s.toFixed(2));
        }

        $(".text").blur(function(){
            var t=$(this);
            t.val(parseInt(t.val()));
            if(parseInt(t.val())<1||isNaN(t.val())){
                t.val(1);
            }
            setTotal(t);
        });
        
        
        $("#all").click(function(){    
            if(this.checked){    
                $("#list :checkbox").prop('checked',true);
            }else{    
                $("#list :checkbox").prop('checked',false);
            }    
         });  
        $("#list :checkbox").click(function(){ 
        	var chknum = $("#list :checkbox").size();//选项总个数 
        	var chk=0;
        	$("#list :checkbox").each(function () {   
                if($(this).prop("checked")==true){ 
                    chk++; 
                } 
            }); 
            if(chknum==chk){//全选 
                $("#all").prop("checked",true); 
            }else{//不全选 
                $("#all").prop("checked",false); 
            } 
        });
        
        
        $("#submit").click(function(){
        	
        	 function Data(id,num,order_list_id) {  
                 this.id = id;  
                 this.num = num; 
                 this.order_list_id = order_list_id;
             }  
        	var Alldata = new Array(); 
        	var datan;
        	var i = 0;
        	$("#list :checkbox").each(function () {   
                if($(this).prop("checked")==true){ 
                	datan = new Data($(this).val(),$(this).parent().siblings().find("input[name=num]").val(),$(this).parent().siblings().find("input[type=hidden]").val());
                	
                	Alldata[i] = datan;
                	i++;
                } 
            }); 
        	var all = JSON.stringify(Alldata);  
        $.ajax ({
 			type : 'post',
 			url : 'iOrdersA.action',
   			dataType:'json', 
   			data:{'Alldata':all}, 
   			success:function(data){ 
   		 	alert("下单成功");
      		},
      		error :function(data){
      			alert(data);
      		alert("下单失败");
      		}  
 		});
        });
    });
    
    
    
</script>
</body>
</html>