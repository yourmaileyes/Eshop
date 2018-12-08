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
				订单号码：${order.orderid }
			</h1>
			<table class="table">
				<thead>
					<tr>
						<th>
							商品名称
						</th>
						<th>
							商品数量
						</th>
						<th>
							价格小计
						</th>
					</tr>
				</thead>
				<tbody>
				  <c:forEach items="${orderdetals }" var="orderdetal">
					<tr class="info">
						<td>
							<img src="public/img/${orderdetal.productid }.jpg" height="50px" width="50px;" > 
							<a href="productdetail.do?productid=${orderdetal.productid }" target="_blank">
							${orderdetal.productname }</a>
						</td>
						<td>
							${orderdetal.number } 
						</td>
						<td>
							￥ <b>${orderdetal.price } </b>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table> <button type="button" class="btn btn-default" onclick="javascript:location.href='sellerorders.do'">返回订单列表</button>
			<c:choose>
			<c:when test="${order.type eq '0' }"><button type="button" class="btn btn-default" onclick="sendproduct(orderid='${order.orderid}')">发货</button></c:when>
			<c:otherwise>快递单号：${order.remark }</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function sendproduct(orderid){
	var r=confirm("请确认所要发的货物均已备齐！");
	if (r==true){
		var tnumber=prompt("请输入快递单号","");
		if (tnumber==null || tnumber==""){
			alert("快递单号不能为空！");
		    return;
		}else{
		$.ajax({
			type : "post",
			url : "sendproduct.do",
			data : {
				"orderid" : orderid,
				"tnumber" : tnumber
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
}

</script>
</html>