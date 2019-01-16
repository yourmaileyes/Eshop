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
<script type="text/javascript" src="public/js/banner.js"></script>
<script type="text/javascript" src="public/js/ad.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table">
				<thead>
					<tr>
						<th>
							用户id
						</th>
						<th>
							用户昵称
						</th>
						<th>
							地址
						</th>
						<th>
							手机
						</th>
						<th>
							余额
						</th>
						<th>
							属性
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="user">
					<tr class="success">
						<td>
							${user.userid }
						</td>
						<td>
							${user.username }
						</td>
						<td>
							${user.addr }
						</td>
						<td>
							${user.phone }
						</td>
						<td>
							${user.collect }
						</td>
						<td>
						<c:if test="${user.type eq 'admin' }">管理员</c:if>
						<c:if test="${user.type eq 'seller'}">卖家</c:if>
							<c:if test="${user.type == null}">普通用户</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>