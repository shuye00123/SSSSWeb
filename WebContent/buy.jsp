

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

        body {
        padding-top: 50px;
        padding-bottom: 40px;
        color: #5a5a5a;
        }

        .carousel a {
        color: #FFF;
        }

        .carousel a:hover {
        color: #FFF;
        text-decoration:none;
        }

        #summary-container a {
        color: #5A5A5A;
        }

        #summary-container a:hover {
        color: #5A5A5A;
        text-decoration:none;
        }

        .feature-heading a {
        color: #2A6496;
        }

        .feature-heading a:hover {
        color: #2A6496;
        text-decoration:none;
        }

        .lead a {
        color: #5A5A5A;
        }

        .lead a:hover {
        color: #5A5A5A;
        text-decoration:none;
        }



        /* 轮播广告 */

        .carousel {
        height: 500px;
        margin-bottom: 60px;
        }

        .carousel .item {
        height: 500px;
        background-color: #000;
        }

        .carousel .item img {
        width: 100%;
        }

        .carousel-caption {
        z-index: 10;
        }

        .carousel-caption p {
        margin-bottom: 20px;
        font-size: 20px;
        line-height: 1.8;
        }

        /* 简介 */

        .summary {
        padding-right: 15px;
        padding-left: 15px;
        }

        .summary .col-md-4 {
        margin-bottom: 20px;
        text-align: center;
        }

        /* 特性 */

        .feature-divider {
        margin: 40px 0;
        }

        .feature {
        padding: 30px 0;
        }

        .feature-heading {
        font-size: 50px;
        color: #2a6496;
        }

        .feature-heading .text-muted {
        font-size: 28px;
        }


        /* 响应式布局 */

        @media (max-width: 768px) {

        .summary {
        padding-right: 3px;
        padding-left: 3px;
        }

        .carousel {
        height: 300px;
        margin-bottom: 30px;
        }

        .carousel .item {
        height: 300px;
        }

        .carousel img {
        min-height: 300px;
        }

        .carousel-caption p {
        font-size: 16px;
        line-height: 1.4;
        }

        .feature-heading {
        font-size: 34px;
        }

        .feature-heading .text-muted {
        font-size: 22px;
        }
        }

        @media (min-width: 992px) {
        .feature-heading {
        margin-top: 120px;
        }
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
        <button type="submit" class="btn btn-default">搜索</button>
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

        <div id="ad-carousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" id="top1">

        </ol>
        <div class="carousel-inner" id="top2">

        </div>
        </div>

        <div class="container summary">

        <!-- 简介 -->
        <div class="row" id="summary-container" >

        </div>

        <!-- 特性 -->

        <hr class="feature-divider">

        <ul class="nav nav-tabs" role="tablist" id="feature-tab">

        </ul>

        <div class="tab-content" id="bottom2">

        </div>

        <!-- 关于 -->
        <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
        aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span
        aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title" id="modal-label">关于</h4>
        </div>
        <div class="modal-body">
        <p>慕课网隶属于北京慕课科技中心(有限合伙)，是一家从事互联网免费教学的网络教育公司。秉承“开拓、创新、公平、分享”的精神，
        将互联网特性全面的应用在教育领域，致力于为教育机构及求学者打造一站式互动在线教育品牌。</p>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
        </div>
        </div>
        </div>
        </div>


        <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2014 慕课网 </p>
        </footer>

        </div>


        <script src="js/jquery-1.12.3.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script >
        $(function(){
        $.ajax({
        type : 'post',
        url : 'sNewsA.action',
        dataType : 'json',
        success : function(data) {
        var json = eval(data);
        var l = 0;
        var k = 0;
        $.each(json, function (i) {
        $.each(json[i], function (j) {
        var news_title = json[i][j].news_title;
        var img_adr = json[i][j].img_adr;
        var news_detial = json[i][j].news_detial;
        var link = json[i][j].link;
        var position = json[i][j].position ;
        if(position==="上"){
        if(l==0){
        $("#top1").append('<li data-target="#ad-carousel" data-slide-to="'+l+'" class="active"></li>');
        $("#top2").append('<div class="item active">'+
        '<a href="'+link+'"><img src="'+img_adr+'" alt="'+l+1+' slide"></a>'+
        '<div class="container">'+
        '<div class="carousel-caption">'+
        '<h1><a href="'+link+'">'+news_title+'</a></h1>'+
        '<p><a href="'+link+'">'+news_detial+'</a></p>'+
        '</div>'+
        '</div>'+
        '</div>');
        }else{
        $("#top1").append('<li data-target="#ad-carousel" data-slide-to="'+l+'"></li>');
        $("#top2").append('<div class="item">'+
        '<a href="'+link+'"><img src="'+img_adr+'" alt="'+l+1+' slide"></a>'+
        '<div class="container">'+
        '<div class="carousel-caption">'+
        '<h1><a href="'+link+'">'+news_title+'</a></h1>'+
        '<p><a href="'+link+'">'+news_detial+'</a></p>'+
        '</div>'+
        '</div>'+
        '</div>');
        }
        l++;
        }else if(position==="中"){
        $("#summary-container").append('<div class="col-md-4">'+
        '<a href="'+link+'"><img class="img-circle" src="'+img_adr+'" alt="'+news_title+'"></a>'+
        '<h2><a href="'+link+'">'+news_title+'</a></h2>'+
        '<p><a href="'+link+'">'+news_detial+'</a></p>'+
        '</div>');
        }else{
        if(k==0){
        $("#feature-tab").append('<li class="active"><a href="#'+news_title+'" role="tab" data-toggle="tab">'+news_title+'</a></li>');
        $("#bottom2").append('<div class="tab-pane active" id="'+news_title+'">'+
        '<div class="row feature">'+
        '<div class="col-md-7">'+
        '<h2 class="feature-heading"><a href="'+link+'">'+news_title+'</a></h2>'+
        '<p class="lead"><a href="'+link+'">'+news_detial+'</a></p>'+
        '</div>'+
        '<div class="col-md-5">'+
        '<a href="'+link+'"><img class="feature-images img-responsive" src="'+img_adr+'" alt="'+news_title+'"></a>'+
        '</div>'+
        '</div>'+
        '</div>');
        }else{

        if(k%2==0){
        $("#feature-tab").append('<li><a href="#'+news_title+'" role="tab" data-toggle="tab">'+news_title+'</a></li>');
        $("#bottom2").append('<div class="tab-pane" id="'+news_title+'">'+
        '<div class="row feature">'+
        '<div class="col-md-7">'+
        '<h2 class="feature-heading"><a href="'+link+'">'+news_title+'</a></h2>'+
        '<p class="lead"><a href="'+link+'">'+news_detial+'</a></p>'+
        '</div>'+
        '<div class="col-md-5">'+
        '<a href="'+link+'"><img class="feature-images img-responsive" src="'+img_adr+'" alt="'+news_title+'"></a>'+
        '</div>'+
        '</div>'+
        '</div>');
        }else{
        $("#feature-tab").append('<li><a href="#'+news_title+'" role="tab" data-toggle="tab">'+news_title+'</a></li>');
        $("#bottom2").append('<div class="tab-pane" id="'+news_title+'">'+
        '<div class="row feature">'+
        '<div class="col-md-5">'+
        '<a href="'+link+'"><img class="feature-images img-responsive" src="'+img_adr+'" alt="'+news_title+'"></a>'+
        '</div>'+
        '<div class="col-md-7">'+
        '<h2 class="feature-heading"><a href="'+link+'">'+news_title+'</a></h2>'+
        '<p class="lead"><a href="'+link+'">'+news_detial+'</a></p>'+
        '</div>'+
        '</div>'+
        '</div>');
        }
        }

        k++;
        }

        });
        });
        $("#top2").append('<a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>'+
        '<a class="right carousel-control" href="#ad-carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>');

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