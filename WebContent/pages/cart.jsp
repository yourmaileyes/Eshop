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
<title>购物车</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link href="<%=cssUrl%>cart.css" rel="stylesheet">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>cartValidate.js"></script>
<%@ include file="/commons/queryCondition.jsp" %>
</head>
<body>
		<%@ include file="/commons/header.jsp"%>
			
		
		
		<br><br>
		<div class="container">
			<div class="container">
			<div class="alert alert-success tip-success" id="computerNumber">您的购物车中共有 ${cartnumber }<b></b>件商品</div>
			<table class="table table-striped">
				<tr>
					<td class="col-md-6">商品名</td>
					<td class="col-md-2 text-center">数量</td>
					<td class="col-md-2 text-center">价格</td>
					<td class="col-md-2 text-center">操作</td>
				</tr>
				<c:forEach items = "${productHomes }" var = "item">
					
					
					<tr>
						<td class="col-md-6 ">
							<img alt="" src="public/img/${item.productid }.jpg" style="width:180px;height:180px;">
							${item.productname } &nbsp; 
						</td>
						<td class="col-md-2 cartItem text-center" style="height:100px;line-height: 200px;">
						${item.number}
							<%-- <input class="cartItemNum" step="" type="text" size="1" name="productid" value="${item.number}" style="width:50px;height:30px;"/> --%>
						</td>
						<td class="col-md-2 text-center">￥ <b>${item.price }</b></td>
						<td class="col-md-2 text-center">
							<a class="btn btn-danger delete" href="delectcart.do?productid=${item.productid }">删除</a>
						</td>
					</tr>
					
					
				</c:forEach>
			</table>
				
				
				<div id="totalMoney" style="font-weight:bold;">总金额：￥    ${totoprice}</span> 
				</div>
			</div>
			<div class="container">
					<div class="row">
						<div class="col-xs-6 col-md-8"></div>
						<div class="col-xs-12 col-md-4 text-right" style="padding-left:30px;">
							<a href="products.do" class="btn btn-default" role="button">继续购物</a>
					
			
							<a href="clearcart.do" class="btn btn-danger" role="button">清空购物车</a>
				
					
							<a href="cashcart.do" class="btn btn-primary" role="button">结账</a>
						</div>
						
					</div>		
					
					
			</div>
	
			
		
	
		</div>
			
		
	<%@ include file="/commons/footer.jsp"%>
</body>
</html>