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
<title>个人信息</title>
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
<div style="position: relative;background-color: #fff;
width: 1152px;height:800px;padding-top:50px;padding-bottom:50px;
margin: 0 auto;">
<div style ="position: relative;padding-top:35px;float:left; width: 300px;height:100px;margin-left: 100px;
background-color: blue;background-color: #fff;">
<center>
<span style="font-weight: 600;
text-align: left;
font-size: 50px;
color: black;
line-height: 28px;">
${loginUser.username }
</span></center>
</div>
<div style ="position: relative;float:left; width: 550px;height:100px;margin-left: 150px;
background-color: blue;font-weight: 600;font-size: 35px;text-align:right;
color: black;padding-top:30px;
line-height: 28px;background-color: #fff;">
欢迎您！余额：￥${loginUser.collect }

</div>

<div style="position: relative;float:left; width: 950px;height:500px;margin-top:100px;
margin-left: 100px;
background-color: #;">
<div style="position: relative;width: 700px;height:100px;margin-left: 150px;margin-top:20px;
border-color: #e7e7e7;">
<div>
<ul style="list-style: none;">
<li><span onclick="infoset()" style="font-size: 25px;padding-top: 15px;
padding-bottom: 15px;float: left;cursor: pointer;
line-height: 48px;
color: #787d82;background-color: transparent;
text-align: left;">个人信息修改</span></li>
<li><span onclick="passwordset()" style="font-size: 25px;
line-height: 48px;float: left;padding-top: 15px;margin-left:80px;
padding-bottom: 15px;cursor: pointer;
color: #787d82;background-color: transparent;
text-align: left;">密码修改</span></li>
<li><span onclick="showorder()" onclick="passwordset()" style="font-size: 25px;cursor: pointer;
line-height: 48px;padding-top: 15px;margin-left:90px;
padding-bottom: 15px;background-color: #e7e7e7;
color: #787d82;float: left;
text-align: left;">订单查看</span></li>
</ul>
</div>
</div>

<div class="container" style="width: 950px;margin-left: 0px;
			margin-right: 0px;">
			<div class="container" style="width: 950px;margin-left: 0px;
			margin-right: 0px;padding-left: 0px;padding-right: 30px;">
			<table class="table table-striped" width="950">
				<tr>
					<td class="col-md-2 text-center">订单号</td>
					<td class="col-md-2 text-center">收货地址</td>
					<td class="col-md-2 text-center">价格</td>
					<td class="col-md-2 text-center">状态</td>
					<td class="col-md-2 text-center">操作</td>
				</tr>
				<c:if test="${orders.size()==0 }">
				<tr>
				<td colspan="5" style="font-size: 35px;text-align:center;">暂无订单 </td>
				</tr>
				</c:if>
				 <c:forEach items = "${orders }" var = "order">
					 
					
					<tr>
						<td class="col-md-2 text-center " >
							${order.orderid }
						</td>
						<td class="col-md-2 text-center" style="">
							${order.useraddr } 
						</td>
						<td class="col-md-2 text-center">￥ <b>${order.price } </b></td>
						<td class="col-md-2 text-center">
							<c:if test="${order.type==0 }"><b style="color: blue;">已付款</b></c:if>
							<c:if test="${order.type==1 }"><b style="color: red;">已发货</b></c:if>
							<c:if test="${order.type==2 }"><b style="color: geen;">已完成</b></c:if> 
						</td>
						<td class="col-md-2 text-center ">
							<a class="btn btn-danger delete" href="orders.do?orderid=${order.orderid }">查看详情</a>
						 </td>
					</tr>
					
					
				 </c:forEach> 
			</table>


</div>
</div>
</body>

</html>
