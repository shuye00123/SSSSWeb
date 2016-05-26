<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <style>
        .detial-left {
            height: 350px;
            width: 350px;
            position:absolute;
            margin: 22px 0 0;
        }

        .detial-right {
            height: 400px;
            width: 700px;
            position:absolute;
            right: 0;
            top: 0;
        }

        .img {
            display:inline;
            width: 25px;
            height: 25px;
        }
        
        .img1 {
        	width: 350px;
            height: 350px;
        }
        
        .img2 {
        	width: 1000px;
        }

        .text {
            width:40px;
            line-height:25px;
            text-align: center;
        }
        .row {
            line-height:50px;
            font-size: 20px;
        }
		
		
		.top {
		margin-top:80px;
		position:relative;
		}

		.top1 {
		margin-top:500px;
		}
		
		.size {
			width:1000px
		}


    </style>
</head>
<body >
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
        <s:if test="null==#session.customer||#session.customer.isEmpty()">
           		<li>
                    <a href="login.jsp">登录</a>
                </li>
                </s:if>
                <s:else>
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
                </s:else>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<div class="container top">
    <div class="detial-left">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->

    <ol class="carousel-indicators">
    <s:set name="a" value="0" />
    <s:iterator value="list" var="u">
        <s:if test="#a==0">
        <li data-target="#carousel-example-generic" data-slide-to="<s:property value="#a"/>" class="active"></li>
        </s:if>
        <s:else>
        <li data-target="#carousel-example-generic" data-slide-to="<s:property value="#a"/>" ></li>
        </s:else>
    <s:set name="a" value="#a+1" />
    </s:iterator>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    <s:set name="b" value="1" />
    <s:iterator value="list" var="u">
        <s:if test="#b==1">
        <div class="item active">
            <img class="img1" src="<s:property value="#u.img"/>" alt="<s:property value="#b"/>"><!-- file:///<s:property value="#u.img"/> -->
            <div class="carousel-caption">
            </div>
        </div>
    </s:if>
    <s:else>
        <div class="item">
            <img class="img1" src="<s:property value="#u.img"/>" alt="<s:property value="#b"/>"><!-- file:///<s:property value="#u.img"/> -->
            <div class="carousel-caption">
            </div>
        </div>
        </s:else>
        <s:set name="b" value="#b+1" />
    </s:iterator>

    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
    </div>
    <div class="detial-right">
    <form action= 'ishopCart' method = "post" id="form">
    <s:set name="c" value="1" />
    <s:iterator value="list" var="u">
        <s:if test="#c==1">
        <input type="hidden" name="id" value="<s:property value="#u.id"/>">
        
        <div class="row">
            <h3 class="col-md-12" style="word-wrap: break-word;"><s:property value="#u.chn_name"/><s:property value="#u.eng_name"/></h3>
        </div>
        <div class="row"><p class="col-md-3">价格</p> <p class="col-md-9"><input type="hidden" id="price" value="<s:property value="#u.price"/>">¥<s:property value="#u.price"/></p></div>
        <div class="row"><p class="col-md-3">销量</p> <p class="col-md-9"><s:property value="#u.num"/></p></div>
        <div class="row"><p class="col-md-3">库存</p> <p class="col-md-9"><s:property value="#u.quantity"/></p></div>
        <div class="row">
            <p class="col-md-3">数量</p>
            <div class="col-md-3">
            <a class="btn btn-default reduce" >-</a>
			<input type="text" class="text" onkeyup="this.value=this.value.replace(/\D/g,'')" name="num" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="1" />
			 <a class="btn btn-default add" href="#">+</a>
			 <input type="hidden" class="quantity"  value="<s:property value="#u.quantity"/>">
            </div>
            <div class="col-md-6">
            <p>总价：<label class="total">¥<s:property value="#u.price"/></label></p>
                </div>
        </div>
        <div class="row">
            <div class="col-md-9 col-md-offset-3">
            <s:if test="null==#session.customer||#session.customer.isEmpty()">
            	<button class="btn default"  onclick="refuse(); return false;"><img class="img" src="image/shoppingCar.png"/>&nbsp;加入购物车</button>
            </s:if>
            <s:else>
            	<button class="btn btn-danger" id="addShopCart" onclick="alert('加入购物车成功')"><img class="img" src="image/shoppingCar.png"/>&nbsp;加入购物车</button>
            </s:else>
            
            </div>
        </div>
        </s:if>
        <s:set name="c" value="#c+1" />
    </s:iterator>
    </form>
    </div>
</div>

<div class="container top1">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="#">详情</a></li>
	</ul>
</div>	
<div class="container size">
        <s:set name="d" value="1" />
        <s:iterator value="list" var="u">
            <s:if test="#d==1">
                <div class="row">
                <p class="col-md-2">中文名:</p> <p class="col-md-3"><s:property value="#u.chn_name"/></p>
                <p class="col-md-2">英文名:</p> <p class="col-md-3"><s:property value="#u.eng_name"/></p>
                </div>
                <div class="row">
                <p class="col-md-2">品牌:</p> <p class="col-md-3"><s:property value="#u.brand"/></p>
                <p class="col-md-2">型号:</p> <p class="col-md-3"><s:property value="#u.code"/></p>
                </div>
                <div class="row">
                <p class="col-md-2">颜色:</p> <p class="col-md-3"><s:property value="#u.color"/></p>
                <p class="col-md-2">规格:</p> <p class="col-md-3"><s:property value="#u.standard"/></p>
                </div>
                <div class="row">
                <p class="col-md-2">种类:</p> <p class="col-md-3"><s:if test="#u.type==1">车辆</s:if><s:else>配件</s:else></p>
                <p class="col-md-2">排量:</p> <p class="col-md-3"><s:property value="#u.displacement"/></p>
                </div>
                
                <div class="divider"></div>
            </s:if>
            <s:set name="d" value="#d+1" />
        </s:iterator>
        <div class="divider"></div>
        <s:iterator value="list" var="u">
        	<img class="img2" src="<s:property value="#u.img"/>" ><!-- file:///<s:property value="#u.img"/> -->
        </s:iterator>
        <hr style="margin: 20px 0;">
		<footer style="margin: 20px 0;">
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 汽车4S店系统</p>
        </footer>
</div>


<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script>
    
	$(function() {
		
		$(".add").click(
				function() {
					var me = this;
					var t = $(this).parent().find('input[class*=text]');
					t.val(parseInt(t.val()) + 1);
					var a = parseInt(t.val());
					var b = parseInt($(me).parent().find('input[class*=quantity]').val());
					if (a > b) {
						alert("超过库存范围");
						t.val(b);
					}
					setTotal(me);
				});
		$(".reduce").click(function() {
			var me = this;
			var t = $(this).parent().find('input[class*=text]');
			t.val(parseInt(t.val()) - 1);
			if (parseInt(t.val()) < 1) {
				t.val(1);
			}
			setTotal(me);
		});

		function setTotal(obj) {
			var s = 0;
			s += parseInt($(obj).parent().find('input[class*=text]').val())* ($("#price").val());

			$(obj).parent().siblings().find('label[class*=total]').html(
					s.toFixed(2));
		}

		$(".text").blur(function() {
					var t = $(this);
					t.val(parseInt(t.val()));
					var a = parseInt(t.val());
					var b = parseInt(t.parent().find('input[class*=quantity]').val());
					if (a > b) {
						alert("超过库存范围");
						t.val(b);
					}
					if (parseInt(t.val()) < 1 || isNaN(t.val())) {
						t.val(1);
					}
					setTotal(t);
				});

		

	});

	function refuse() {
		alert("请登入！！！");
		return false;
	}
</script>
</body>
</html>