<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				我的商品.
			</h1>
		</div>
	</div>
	<div class="row clearfix">
	<c:forEach items="${products}" var="product">
		<div class="col-md-4 column" style="height: 360px;">
			<div class="media well">
						 <a href="#" class="pull-left"><img src="<%=imgUrl %>${product.productid }.jpg" width="300" height="200" class="media-object" alt='' /></a>
						<div class="media-body">
							<h4 class="media-heading">
								${product.name }
							</h4> 
							<span style="color: red;font-size: 20px;">￥ ${product.price }</span>
							<a href="sellerdetails.do?productid=${product.productid }" class="btn btn-primary addToCart" style="position:relative ;float: right;">
							管理</a>
						</div>
					</div>
		</div>
		</c:forEach>
	</div>
</div>
</body>
</html>