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


        .head {
            line-height: 40px;
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
            <a href="user.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人信息</a>
            <a href="shoppingcar.jsp" class="list-group-item active"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a>
            <a href="sOrdersA" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a>
        </div>
        <div class="col-md-10">
            <h3><b>全部商品</b></h3>
            <hr class="feature-divider">
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
    	$('body').on('click','.add',function(){
			var me = this;
            var t=$(this).parent().find('input[class*=text]');
            t.val(parseInt(t.val())+1);
            var a=parseInt(t.val());
            var b = parseInt($(me).parent().find('input[class*=quantity]').val());
            if(a>b){
            	alert("超过库存范围");
            	t.val(b);
            }
            setTotal(me);
        });
    	$('body').on('click','.reduce',function(){
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
            s+=parseInt($(obj).parent().find('input[class*=text]').val())*($("#price").val());
            
            $(obj).parent().siblings().find('label[class*=total]').html(s.toFixed(2));
        }
        
        $('body').on('blur','.text',function(){
			var t=$(this);
            t.val(parseInt(t.val()));
            var a=parseInt(t.val());
            var b = parseInt(t.parent().find('input[class*=quantity]').val());
            if(a>b){
            	alert("超过库存范围");
            	t.val(b);
            }
            if(parseInt(t.val())<1||isNaN(t.val())){
                t.val(1);
            }
            setTotal(t);
		});
        
        
        $("#all").on('click',function(){    
            if(this.checked){    
                $("#list :checkbox").prop('checked',true);
            }else{    
                $("#list :checkbox").prop('checked',false);
            }    
         });  
        $("#list").on('click',' :checkbox',function(){ 
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
   		 	window.location.href ='shoppingcar.jsp';
      		},
      		error :function(data){
      			alert(data);
      		alert("下单失败");
      		}  
 		});
        });
        
       
		$.ajax({
			type : 'post',
			url : 'sshopCart.action',
			dataType : 'json',
			success : function(data) {
				var json = eval(data);
	   			 $.each(json, function (i) {  
	             	$.each(json[i], function (j) { 
	             		var id = json[i][j].id;  
	             		var img = json[i][j].img; 
	             		var order_list_id = json[i][j].order_list_id; 
	             		var chn_name = json[i][j].chn_name; 
	             		var price = json[i][j].price; 
	             		var num = json[i][j].num; 
	             		var quantity = json[i][j].quantity;
	             		if(quantity<num){
	             			num = quantity;
	             		}
	             		$("#list").append("<tr>"+
	                    '<td><input  type="checkbox" value="'+id+'"></td>'+
	                    '<td>'+
	                        '<a href="sDetialGoodsA?id='+id+'"><img class="img" src="'+img+'"></a>'+
							'<input type="hidden" value="'+order_list_id+'" >'+
	                    '</td>'+
	                    '<td>'+
	                        '<a class="break" href="sDetialGoodsA?id='+id+'">'+chn_name+'</a>'+
	                    '</td>'+
	                    '<td><input type="hidden" id="price" value="'+price+'">'+price+'</td>'+
	                    '<td>'+
	                        '<a class="btn btn-default reduce" >-</a>'+
	                        '<input type="text" name="num" class="text" onkeyup="this.value=this.value.replace(/\D/g,'+"''"+')" onafterpaste="this.value=this.value.replace(/\D/g,'+"''"+')" value="'+num+'" />'+
	                        '<a class="btn btn-default add" href="#">+</a>'+
	                        '<input type="hidden" class="quantity"  value="'+quantity+'">'+
	                    '</td>'+
	                    '<td><label class="total">'+num*price+'</label></td>'+
	                    '<td><a href="dshopCart?id='+order_list_id+'" id="delete">删除</a></td>'+
	                '</tr>' );
	             	});
	   			 });
				
				
			},
			error : function(data) {
				alert(data);
				alert("加载失败");
			}
		});
	
       
        
    });
    
    
    
</script>
</body>
</html>