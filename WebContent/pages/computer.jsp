<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
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
<title>商品详情  ${product.name } </title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=cssUrl %>login.css">
<script
	src="<%=jsUrl %>login.js"></script>	
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%@ include file="/commons/queryCondition.jsp" %>

</head>

<body>
	<%@ include file="/commons/header.jsp"%>
	
	<center>
		<div class="thumbnail">
			<img src="public/img/${product.productid }.jpg" style="width:400px;height:400px;"/>
		</div>
		<div class="caption" style="width: 500px;">
		<br><br>
		品牌：${product.addr}
		<br><br>
		名称: ${product.name }
		<br><br>
		价格: ￥ ${product.price }
		<br><br>
		商品备注: <c:if test="${ product.type!=null}">
		         <c:if test="${product.type==0}">无货</c:if>
		         <c:if test="${product.type==1}">少量货源</c:if>
		         <c:if test="${product.type==2}">货源充足</c:if>
		         </c:if>
		<br><br>
		<span style="text-indent: 50px;">商品介绍: ${product.context }</span>
		<br><br>
		
		<a href="products.do" class="btn btn-default">继续购物</a>
		<c:if test="${ product.type!=null}">
		         <c:if test="${product.type!=0}">
		<a href="#" onclick="addcart(p='${product.price}',n='${product.name }',i='${product.productid }');" class="btn btn-primary addToCart" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 加入购物车</a> 
		</c:if></c:if>
		<c:if test="${loginUser!=null }">
		<a href="talk.do" target="_blank" class="btn btn-primary addToCart"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 联系商家</a>
		</c:if>
		</div>
		
		
	</center>
	<%@ include file="/commons/footer.jsp"%>
</body>
<script type="text/javascript">

function addcart(p,n,i){
	var price =p;
	var productname = n;
	var productid = i;
	$
	.ajax({
		type : "post",
		url : "addcart.do",
		data : {
			"price" : price,
			"productname" : productname,
			"productid" : productid
		},
		async : false,
		dataType : 'text',
		success : function(data) {
			alert(data);
		},
		error : function(data) {
			alert("添加出错！请联系管理员" + data);
		}
	});
	return;
}
</script>
</html>