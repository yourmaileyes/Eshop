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
<title>订单详情</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%@ include file="/commons/queryCondition.jsp" %>
</head>
<body>
	<%@ include file="/commons/header.jsp"%>
	<center>
		<br><br>
		<h4>订单号码: ${order.orderid }</h4>
		<div class="container" style="width: 950px;margin-left: 0px;
			margin-right: 0px;">
			<div class="container" style="width: 950px;margin-left: 0px;
			margin-right: 0px;padding-left: 0px;padding-right: 30px;">
			<table class="table table-striped" width="950">
				<tr>
					<td class="col-md-2 text-center">商品名称</td>
					<td class="col-md-2 text-center">商品数量</td>
					<td class="col-md-2 text-center">价格小计</td>
				</tr>
				
				 <c:forEach items = "${orderdetals }" var = "order">
					 
					
					<tr>
						<td class="col-md-2 text-center " style="text-align: left;" >
							<img src="public/img/${order.productid }.jpg" height="50px" width="50px;" > <a href="productdetail.do?productid=${order.productid }" target="_blank">${order.productname }</a>
						</td>
						<td class="col-md-2 text-center" >
							${order.number } 
						</td>
						<td class="col-md-2 text-center">￥ <b>${order.price } </b></td>
						
					</tr>
					
					
				 </c:forEach> 
			</table>

<div id="totalMoney" style="font-weight:bold;">总金额：￥    ${order.price}</span> <br>
<c:if test="${order.remark!=null }">
<div id="totalMoney" style="font-weight:bold;">快递单号：    ${order.remark}</span><br>
</c:if>
<c:if test="${order.type eq '2' }">
<div id="totalMoney" style="font-weight:bold;">订单已完成！</span>
</c:if>
				</div>
</div>
<div class="container">
					<div class="row">
						<div class="col-xs-6 col-md-8"></div>
						<div class="col-xs-12 col-md-4 text-right" style="padding-left:30px;text-align: left;">
						     <c:if test="${order.type eq '1' }">
							<button onclick="takeproduct(orderid='${order.orderid }')" class="btn btn-default" >确认收货</button>
							</c:if>
							<a href="showorder.do" class="btn btn-default" role="button">返回订单列表</a>
						</div>
						
					</div>		
					
					
			</div>
	
</div>
	</center>
	
	<%@ include file="/commons/footer.jsp"%>
</body>
<script type="text/javascript">
function takeproduct(orderid){
	var r=confirm("请确认您已收货！确认收货后货款将交给卖家！");
	if (r==true){
		
		$.ajax({
			type : "post",
			url : "takeproduct.do",
			data : {
				"orderid" : orderid
			},
			async : true,
			dataType : 'text',
			success : function(data) {
				alert(data);
				location.reload(true);
			},
			error : function(data) {
				alert("出错！请联系管理员" + data);
				isok = false;
			}
		});}
	}


</script>
</html>