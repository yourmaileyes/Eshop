<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="container" style="margin: 20px 100px 100px 100px;width: 1700px;">
    <div class="row clearfix" style="margin-bottom: 20px;">
		<div class="col-md-3 column">
			<h1 class="text-center">
				欢迎您&nbsp;<span class="glyphicons glyphicons-nameplate"></span>${loginUser.username }!
			</h1>
		</div>
		<c:if test="${loginUser.type eq 'seller' }">
		<div class="col-md-3 column">
			<h1 class="text-center">
				订单总数&nbsp;<span class="glyphicons glyphicons-nameplate"></span><b style="color: green;">${allnumber }</b>
			</h1>
		</div>
		<div class="col-md-3 column">
			<h1 class="text-center">
				未处理订单数&nbsp;<span class="glyphicons glyphicons-nameplate"></span><b style="color: red;">${notnumber}</b>
			</h1>
		</div>
		</c:if>
		<div class="col-md-3 column">
			<h1 class="text-center">
				钱包余额&nbsp;<span class="glyphicons glyphicons-nameplate"></span><b style="color: blue;">￥${loginUser.collect }</b>
			</h1>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
			<div class="panel-group" id="panel-397253">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-397253" href="#panel-element-926993">商品管理</a>
					</div>
					<div id="panel-element-926993" class="panel-collapse collapse">
						<div class="panel-body">
							<a href="sellerproduct.do" target="right_show">所有商品信息</a>
						</div>
						<div class="panel-body">
							<a href="sellerdetails.do" target="right_show">上架新商品</a>
						</div>
					</div>
				</div>
				<c:if test="${loginUser.type eq 'seller' }">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-397253" href="#panel-element-237329">订单管理</a>
					</div>
					<div id="panel-element-237329" class="panel-collapse in">
						<div class="panel-body">
							<a href="sellerorders.do" target="right_show">所有订单信息</a>
						</div>
						
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-397253" href="#panel-element-237320">会话管理</a>
					</div>
					<div id="panel-element-237320" class="panel-collapse in">
						<div class="panel-body">
							<a href="sellertalk.do" target="right_show">客户聊天信息</a>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${loginUser.type eq 'admin' }">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-397253" href="#panel-element-237321">用户管理</a>
					</div>
					<div id="panel-element-237321" class="panel-collapse in">
						<div class="panel-body">
							<a href="alluser.do" target="right_show">所有用户</a>
						</div>
						<div class="panel-body">
							<a href="balance.jsp" target="right_show">余额充值</a>
						</div>
					</div>
				</div> 
				</c:if>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-397254" href="#panel-element-237321">退出系统</a>
					</div>
					<div id="panel-element-237321" class="panel-collapse in">
						<div class="panel-body">
							<a href="logout.do">退出</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-10 column">
		<iframe style="border: 0px;" name="right_show" src="sellerproduct.do" width="1400" height="800"></iframe>
		</div>
	</div>
</div>
</body>
</html>