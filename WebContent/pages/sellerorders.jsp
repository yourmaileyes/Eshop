<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>webshop商家管理</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=cssUrl %>login.css">
<script
	src="<%=jsUrl %>login.js"></script>	
<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="public/css/base.css">
<link rel="stylesheet" type="text/css" href="public/css/home.css">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h1 class="text-center">
				所有订单.
			</h1>
			<table class="table">
				<thead>
					<tr>
						<th>
							订单编号
						</th>
						<th>
							购买用户
						</th>
						<th>
							收货地址
						</th>
						<th>
							总价
						</th>
						<th>
							快递单号
						</th>
						<th>
							状态
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${orders }" var="order">
				  <c:if test="${order.type eq '0' }">
				    <tr class="error">
						<td>
							${order.orderid }
						</td>
						<td>
							${order.username }
						</td>
						<td>
							${order.useraddr }
						</td>
						<td>
							￥${order.price }
						</td>
						<td>
							${order.remark }
						</td>
						<td>
							已付款，请尽快<a href="orders.do?orderid=${order.orderid }&type='0'" target="right_show">发货</a>
						</td>
					</tr>
					</c:if>
					<c:if test="${order.type eq '1' }">
				    <tr class="info">
						<td>
							${order.orderid }
						</td>
						<td>
							${order.username }
						</td>
						<td>
							${order.useraddr }
						</td>
						<td>
							￥${order.price }
						</td>
						<td>
							<a href="orders.do?orderid=${order.orderid }&type='0'" target="right_show">${order.remark }</a>
						</td>
						<td>
							已发货，等待收货
						</td>
					</tr>
					</c:if>
				  <c:if test="${order.type eq '2' }">
					<tr class="success">
						<td>
							${order.orderid }
						</td>
						<td>
							${order.username }
						</td>
						<td>
							${order.useraddr }
						</td>
						<td>
							￥${order.price }
						</td>
						<td>
							<a href="orders.do?orderid=${order.orderid }&type='0'" target="right_show">${order.remark }</a>
						</td>
						<td>
							已确认收货，订单完成
						</td>
					</tr>
					</c:if>
					
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>