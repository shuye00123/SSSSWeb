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
	border: 2px solid #C8F0FF !important;
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

				<form action="sGoodsA" method="post" class="navbar-form navbar-left"
					role="search">
					<div class="form-group">
						<input type="text" class="form-control" name="chn_name"
							placeholder="Search">
					</div>
					<button type="submit" class="btn btn-danger">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="user.jsp"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false"><s:property
								value="#session.customer.customer_name " /><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="user.jsp"><span
									class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人中心</a></li>
							<li><a href="shoppingcar.jsp"><span
									class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a></li>
							<li><a href="sOrdersA"><span
									class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp我的订单</a></li>
							<li class="divider"></li>
							<li><a href="logout">退出</a></li>
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
				<a href="user.jsp" class="list-group-item"><span
					class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp个人信息</a>
				<a href="shoppingcar.jsp" class="list-group-item "><span
					class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp购物车</a>
				<a href="sOrdersA" class="list-group-item active"><span
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
											<s:set name="total" value="0" />
											<s:iterator value="list1" var="u">
												<s:set name="k" value="#u.order_id" />
												<s:if test="#z.order_id ==#u.order_id ">

													<s:set name="total" value="#total+#u.price*#u.num" />
												</s:if>
											</s:iterator>
											<s:iterator value="list1" var="u">
												<s:set name="k" value="#u.order_id" />
												<s:if test="#z.order_id ==#u.order_id ">
													<s:if test="#j!=#k">
														<tr style="background-color: #C8F0FF">
															<th width="60px"><s:if
																	test='#z.order_state == "待发货"'>
																	<s:date name="#u.order_time" format="yyyy/MM/dd hh:mm" />
																</s:if> <s:elseif test='#z.order_state == "已发货"'>
																	<s:date name="#u.send_time" format="yyyy/MM/dd hh:mm" />
																</s:elseif> <s:else>
																	<s:date name="#u.settle_time" format="yyyy/MM/dd hh:mm" />
																</s:else></th>
															<th width="250px">订单号:<s:property
																	value="#u.order_id" /></th>
															<th width="80px"></th>
															<th width="80px"></th>
															<th width="80px"></th>
															<th width="100px"></th>
															<th width="80px"></th>
														</tr>

														<tr>
															<td><a
																href="sDetialGoodsA?id=<s:property value="#u.id" />"><img
																	class="img" src="<s:property value="#u.img" />"></a></td>
															<td><a class="break"
																href="sDetialGoodsA?id=<s:property value="#u.id" />"><s:property
																		value="#u.chn_name" />
																	<s:property value="#u.eng_name" />
																	<s:property value="#u.code" /></a></td>
															<td><s:property value="#u.price" /></td>
															<td><s:property value="#u.num" /></td>
															<td rowspan="<s:property value="#z.count" />"><label
																class="total"><s:property value="#total" /></label></td>
															<td rowspan="<s:property value="#z.count" />"><s:property
																	value="#z.order_state" /></td>

															<s:if test='#z.order_state == "待发货"'>
																<td rowspan="<s:property value="#z.count" />"><a
																	href="rOrdersA?order_id=<s:property value="#u.order_id" />"
																	class="btn btn-primary">取消订单</a></td>
															</s:if>
															<s:elseif test='#z.order_state == "已发货"'>
																<td rowspan="<s:property value="#z.count" />"><a
																	href="suOrdersA?order_id=<s:property value="#u.order_id" />"
																	class="btn btn-primary">确认收货</a></td>
															</s:elseif>
															<s:elseif test='#z.order_state == "交易成功"'>
																<td rowspan="<s:property value="#z.count" />">交易成功</td>
															</s:elseif>
															<s:else>
																<td rowspan="<s:property value="#z.count" />">交易失败</td>
															</s:else>

														</tr>
													</s:if>

													<s:else>
														<tr>
															<td><a href="#"><img class="img"
																	src="<s:property value="#u.img" />"></a></td>
															<td><a class="break" href="#"><s:property
																		value="#u.chn_name" />
																	<s:property value="#u.eng_name" />
																	<s:property value="#u.code" /></a></td>
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
						</table>
					</div>

					<div class="tab-pane" id="tab-send">
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
										<s:if test='#z.order_state == "待发货"'>
											<table class="table table-bordered">
												<s:set name="total" value="0" />
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:set name="total" value="#total+#u.price*#u.num" />
													</s:if>
												</s:iterator>
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:if test="#j!=#k">
															<tr style="background-color: #C8F0FF">
																<th width="60px"><s:date name="#u.order_time"
																		format="yyyy/MM/dd hh:mm" /></th>
																<th width="250px">订单号:<s:property
																		value="#u.order_id" /></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="100px"></th>
																<th width="80px"></th>
															</tr>

															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
																<td rowspan="<s:property value="#z.count" />"><labelclass="total">
																	<s:property value="#total" />
																	</label></td>
																<td rowspan="<s:property value="#z.count" />"><s:property
																		value="#z.order_state" /></td>
																<td rowspan="<s:property value="#z.count" />"><a
																	href="rOrdersA?order_id=<s:property value="#u.order_id" />"
																	class="btn btn-primary">取消订单</a></td>

															</tr>
														</s:if>

														<s:else>
															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
															</tr>


														</s:else>
														<s:set name="j" value="k" />
													</s:if>



												</s:iterator>

											</table>
										</s:if>
									</s:iterator>

								</tr>
						</table>
					</div>

					<div class="tab-pane" id="tab-sended">
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
										<s:if test='#z.order_state == "已发货"'>
											<table class="table table-bordered">
												<s:set name="total" value="0" />
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:set name="total" value="#total+#u.price*#u.num" />
													</s:if>
												</s:iterator>
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:if test="#j!=#k">
															<tr style="background-color: #C8F0FF">
																<th width="60px"><s:date name="#u.send_time"
																		format="yyyy/MM/dd hh:mm" /></th>
																<th width="250px">订单号:<s:property
																		value="#u.order_id" /></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="100px"></th>
																<th width="80px"></th>
															</tr>

															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
																<td rowspan="<s:property value="#z.count" />"><label
																	class="total"><s:property value="#total" /></label></td>
																<td rowspan="<s:property value="#z.count" />"><s:property
																		value="#z.order_state" /></td>

																<td rowspan="<s:property value="#z.count" />"><a
																	href="suOrdersA?order_id=<s:property value="#u.order_id" />"
																	class="btn btn-primary">确认收货</a></td>

															</tr>
														</s:if>

														<s:else>
															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
															</tr>


														</s:else>
														<s:set name="j" value="k" />
													</s:if>



												</s:iterator>

											</table>
										</s:if>
									</s:iterator>

								</tr>
						</table>

					</div>

					<div class="tab-pane" id="tab-success">
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
										<s:if test='#z.order_state == "交易成功"'>
											<table class="table table-bordered">
												<s:set name="total" value="0" />
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:set name="total" value="#total+#u.price*#u.num" />
													</s:if>
												</s:iterator>
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:if test="#j!=#k">
															<tr style="background-color: #C8F0FF">
																<th width="60px"><s:date name="#u.settle_time"
																		format="yyyy/MM/dd hh:mm" /></th>
																<th width="250px">订单号:<s:property
																		value="#u.order_id" /></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="100px"></th>
																<th width="80px"></th>
															</tr>

															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
																<td rowspan="<s:property value="#z.count" />"><label
																	class="total"><s:property value="#total" /></label></td>
																<td rowspan="<s:property value="#z.count" />"><s:property
																		value="#z.order_state" /></td>


																<td rowspan="<s:property value="#z.count" />">交易成功</td>

															</tr>
														</s:if>

														<s:else>
															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
															</tr>


														</s:else>
														<s:set name="j" value="k" />
													</s:if>



												</s:iterator>

											</table>
										</s:if>
									</s:iterator>

								</tr>
						</table>

					</div>

					<div class="tab-pane" id="tab-false">
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
										<s:if test='#z.order_state == "交易失败"'>
											<table class="table table-bordered">
												<s:set name="total" value="0" />
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">
														<s:set name="total" value="#total+#u.price*#u.num" />
													</s:if>
												</s:iterator>
												<s:iterator value="list1" var="u">
													<s:set name="k" value="#u.order_id" />
													<s:if test="#z.order_id ==#u.order_id ">


														<s:if test="#j!=#k">
															<tr style="background-color: #C8F0FF">
																<th width="60px"><s:date name="#u.settle_time"
																		format="yyyy/MM/dd hh:mm" /></th>
																<th width="250px">订单号:<s:property
																		value="#u.order_id" /></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="80px"></th>
																<th width="100px"></th>
																<th width="80px"></th>
															</tr>

															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
																<td rowspan="<s:property value="#z.count" />"><label
																	class="total"><s:property value="#total" /></label></td>
																<td rowspan="<s:property value="#z.count" />"><s:property
																		value="#z.order_state" /></td>
																<td rowspan="<s:property value="#z.count" />">交易失败</td>

															</tr>
														</s:if>

														<s:else>
															<tr>
																<td><a href="#"><img class="img"
																		src="<s:property value="#u.img" />"></a></td>
																<td><a class="break" href="#"><s:property
																			value="#u.chn_name" />
																		<s:property value="#u.eng_name" />
																		<s:property value="#u.code" /></a></td>
																<td><s:property value="#u.price" /></td>
																<td><s:property value="#u.num" /></td>
															</tr>


														</s:else>
														<s:set name="j" value="k" />
													</s:if>




												</s:iterator>

											</table>
										</s:if>
									</s:iterator>

								</tr>
						</table>

					</div>
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