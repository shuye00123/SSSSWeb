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
        .container ul .navbar-right ul li a {
            padding: 5px 15px;
        }

        .Goods {
            margin: 22px 16px 0;
            padding: 0;
            border: 1px solid #ededed;
            height: 330px;
            width: 250px;
            word-wrap: break-word;
            float: left;
            text-shadow: #3c3c3c;
        }

        .Goods:hover {
            border: 1px solid #ff4400;
        }

        .detialImg {
            height: 250px;
            width: 248px;
        }

        .goodsText {
            line-height: 20px;
            font-size: 13px;
            color: #3d3d3d;
        }

        .goodsText:hover {
            color: #ff4400;
            text-underline-color: #ff4400;
        }

        .money {
            color: #ff4400;
            font-weight: bold;
            float:left;
            font-size: 20px;
            margin-bottom: 0;
        }

        .saleNum {
            color: #888;
            float:right;
            margin-bottom: 0;
        }

        .clear {
            height: 28px;
            display:block;
        }
		
		.top {
		margin-top:80px;
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
	
      <form class="navbar-form navbar-left" role="search">
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
              <li><a href="#"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a></li>
              <li class="divider"></li>
              <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container top">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="#">综合排序</a></li>
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                类别<span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation" ><a href="#">汽车</a></li>
                <li role="presentation"><a href="#">配件</a></li>
            </ul>
        </li>
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                销量<span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation" ><a href="#">从高到低</a></li>
                <li role="presentation"><a href="#">从低到高</a></li>
            </ul>
        </li>
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                价格<span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation" ><a href="#">从高到低</a></li>
                <li role="presentation"><a href="#">从低到高</a></li>
            </ul>
        </li>
    </ul>
</div>
<div class="container">
    <s:iterator value="list" var="u">
        <div class="Goods">
        <a href="sDetialGoodsA?id=<s:property value="#u.id"/>"> <img class="detialImg" src="file:///<s:property value="#u.img"/>"/></a>
        <div class="clear"><p class="money">&nbsp;¥<s:property value="#u.price"/></p><p class="saleNum">已售<s:property value="#u.num"/>件</p></div>
        <a class="goodsText" href="sDetialGoodsA?id=<s:property value="#u.id"/>"><s:property value="#u.chn_name"/></a>
        </div>
    </s:iterator>


    <div class="Goods">
        <a href="detial.jsp"> <img class="detialImg" src="image/11.jpg"/></a>
        <div class="clear"><p class="money">&nbsp;¥10.00</p><p class="saleNum">已售100件</p></div>
        <a class="goodsText" href="detial.jsp">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具</a>
    </div>
    <div class="Goods">
        <a href="detial.jsp"> <img class="detialImg" src="image/11.jpg"/></a>
        <div class="clear"><p class="money">&nbsp;¥10.00</p><p class="saleNum">已售100件</p></div>
        <a class="goodsText" href="detial.jsp">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具</a>
    </div>
    <div class="Goods">
        <a href="#"> <img class="detialImg" src="image/11.jpg"/></a>
        <div class="clear"><p class="money">&nbsp;¥10.00</p><p class="saleNum">已售100件</p></div>
        <a class="goodsText" href="#">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具</a>
    </div>
    <div class="Goods">
        <a href="#"> <img class="detialImg" src="image/11.jpg"/></a>
        <div class="clear"><p class="money">&nbsp;¥10.00</p><p class="saleNum">已售100件</p></div>
        <a class="goodsText" href="#">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具</a>
    </div>
    <div class="Goods">
        <a href="#"> <img class="detialImg" src="image/11.jpg"/></a>
        <div class="clear"><p class="money">&nbsp;¥10.00</p><p class="saleNum">已售100件</p></div>
        <a class="goodsText" href="#">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具</a>
    </div>

</div>




<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>