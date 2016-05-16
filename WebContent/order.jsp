<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

.break {
	word-wrap: break-word;
}

.table-bordered td,.table-bordered th {
	border: 2px solid #eaf8ff !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="buy.jsp"><span
					class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp首页</a>


			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-right"
				id="bs-example-navbar-collapse-1">

				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">王建程<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><span class="glyphicon glyphicon-user"
									aria-hidden="true"></span>&nbsp个人中心</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container top">
		<div class="row">
			<div class="list-group col-md-2">
				<a href="user.html" class="list-group-item "><span
					class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人信息</a>
				<a href="shoppingcar.html" class="list-group-item"><span
					class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a>
				<a href="order.html" class="list-group-item active"><span
					class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a>
			</div>
			<div class="col-md-10">
				<ul class="nav nav-tabs" role="tablist" id="feature-tab">

					<li class="active"><a href="#tab-all" role="tab"
						data-toggle="tab">所有订单</a></li>
					<li><a href="#tab-send" role="tab" data-toggle="tab">待发货</a></li>
					<li><a href="#tab-sended" role="tab" data-toggle="tab">已发货</a></li>
					<li><a href="#tab-success" role="tab" data-toggle="tab">交易成功</a></li>
					<li><a href="#tab-false" role="tab" data-toggle="tab">交易失败</a></li>
				</ul>
				<hr class="feature-divider">
				<div class="tab-content">
					<div class="tab-pane active" id="tab-all">
						<table class="table">
							<thead>
								<tr>
									<th width="60px"></th>
									<th width="300px">商品</th>
									<th width="80px">单价</th>
									<th width="80px">数量</th>
									<th width="80px">实付款</th>
									<th width="100px">交易状态</th>
									<th width="80px">操作</th>
								</tr>
								<tr>


									<s:set name="j" value="-100" />
									<s:iterator value="list" var="z">
										<table class="table table-bordered">
											<s:iterator value="list1" var="u">
												<s:set name="k" value="#u.order_id" />
												<s:if test="#z.order_id ==#u.order_id ">
													<s:if test="#j!=#k">
														<tr style="background-color: #eaf8ff">
															<th width="60px">
																<s:if test='{#order_state == "待发货"}'>
																	<s:date name="#u.order_time" format="yyyy/MM/dd hh:mm" />
																</s:if> 
																<s:elseif test='{#order_state == "已发货"}'>
																	<s:date name="#u.send_time" format="yyyy/MM/dd hh:mm" />
																</s:elseif> 
																<s:else>
																	<s:date name="#u.settle_time" format="yyyy/MM/dd hh:mm" />
																</s:else></th>
															<th width="250px">订单号:<s:property value="#u.order_id" /></th>
															<th width="80px"></th>
															<th width="80px"></th>
															<th width="80px"></th>
															<th width="100px"></th>
															<th width="80px"></th>
														</tr>

														<tr>
															<td><a href="#"><img class="img" src="<s:property value="#u.img" />"></a></td>
															<td><a class="break" href="#"><s:property value="#u.chn_name" /><s:property value="#u.eng_name" /><s:property value="#u.code" /></a>
															</td>
															<td><s:property value="#u.price" /></td>
															<td><s:property value="#u.num" /></td>
															<td rowspan="<s:property value="#z.count" />"><label
																class="total">100.00</label></td>
															<td rowspan="<s:property value="#z.count" />">待发货</td>
															<td rowspan="<s:property value="#z.count" />"><a
																href="#" class="btn btn-primary">取消订单</a></td>
														</tr>
													</s:if>

													<s:else>
														<tr>
															<td><a href="#"><img class="img" src="<s:property value="#u.img" />"></a></td>
															<td><a class="break" href="#"><s:property value="#u.chn_name" /><s:property value="#u.eng_name" /><s:property value="#u.code" /></a>
															</td>
															<td><s:property value="#u.price" /></td>
															<td><s:property value="#u.num" /></td>
														</tr>


													</s:else>
													<s:set name="j" value="k" />
												</s:if>



											</s:iterator>

										</table>
									</s:iterator>

								</tr>







								<tr>
									<table class="table table-bordered">
										<tr style="background-color: #eaf8ff">
											<th width="60px">2016-5-5</th>
											<th width="250px">订单号:0000001112</th>
											<th width="80px"></th>
											<th width="80px"></th>
											<th width="80px"></th>
											<th width="100px"></th>
											<th width="80px"></th>
										</tr>
										<tr>
											<td><a href="#"><img class="img" src="image/11.jpg"></a>
											</td>
											<td><a class="break" href="#">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具cxzczxcxzcxzcxzcxzc</a>
											</td>
											<td>10.00</td>
											<td>10</td>
											<td rowspan=3><label class="total">100.00</label></td>
											<td rowspan=3>待发货</td>
											<td rowspan=3><a href="#" class="btn btn-primary">取消订单</a></td>
										</tr>
										<tr>
											<td><a href="#"><img class="img" src="image/11.jpg"></a>
											</td>
											<td><a class="break" href="#">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具cxzczxcxzcxzcxzcxzc</a>
											</td>
											<td>10.00</td>
											<td>10</td>
										</tr>
										<tr>
											<td><a href="#"><img class="img" src="image/11.jpg"></a>
											</td>
											<td><a class="break" href="#">驿路坊新古典田园沙发欧式组合沙发法式布艺实木客厅家具cxzczxcxzcxzcxzcxzc</a>
											</td>
											<td>10.00</td>
											<td>10</td>
										</tr>
									</table>
								</tr>
						</table>
					</div>

					<div class="tab-pane active" id="tab-send"></div>

					<div class="tab-pane active" id="tab-sended"></div>

					<div class="tab-pane active" id="tab-success"></div>

					<div class="tab-pane active" id="tab-false"></div>
				</div>
			</div>
		</div>
	</div>






	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		$(function() {

		})
	</script>
</body>
</html>