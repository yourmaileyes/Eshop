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
		<div class="col-md-8 column">
		    
			<form class="form-horizontal"  action="sellerdetailsupdata.do" enctype="multipart/form-data" method="post">
	 	    <c:if test="${product!=null }">
		    <img alt="" src="<%=imgUrl %>${product.productid}.jpg">
		    </c:if><input type="file" name="file" accept="image/jpeg" >商品图片
			   <c:if test="${product!=null }">
			    <div class="form-group">
					
					<div class="col-sm-10">
						<input class="form-control"  type="hidden" name="productid" value="${product.productid }" />
						<input class="form-control"  type="hidden" name="ttype" value="0" />
					</div>
				</div>
				</c:if>
				<div class="form-group">
					 <label for="productname" class="col-sm-2 control-label">商品名称</label>
					<div class="col-sm-10">
						<input class="form-control" id="productname" type="text" name="name" value="${product.name }"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="productprice" class="col-sm-2 control-label">商品价格</label>
					<div class="col-sm-10">
						<input class="form-control" id="productprice" type="number" name="price" value="${product.price }"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="productaddr" class="col-sm-2 control-label">商品品牌</label>
					<div class="col-sm-10">
						<input class="form-control" id="productaddr" type="text" name="addr" value="${product.addr }"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="productcontext" class="col-sm-2 control-label">商品介绍</label>
					<div class="col-sm-10">
						<input class="form-control" id="productcontext" type="text" name="context" value="${product.context }"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					   <c:if test="${product==null }">
						<div class="checkbox">
							 <label><input name="type" type="radio" value="0"/>无货</label>
							 <label><input name="type" type="radio" value="1"/>少量货源</label>
							 <label><input name="type" type="radio" value="2"/>货源充足</label>
						</div>
						</c:if><c:if test="${product!=null }">
						<div class="checkbox">
						     <c:if test="${product.type eq '0' }">
							 <label><input name="type" type="radio" value="0" checked="checked"/>无货</label>
							 <label><input name="type" type="radio" value="1" />少量货源</label>
							 <label><input name="type" type="radio" value="2" />货源充足</label>
							 </c:if>
							 <c:if test="${product.type eq '1' }">
							 <label><input name="type" type="radio" value="0" />无货</label>
							 <label><input name="type" type="radio" value="1" checked="checked"/>少量货源</label>
							 <label><input name="type" type="radio" value="2" />货源充足</label>
							 </c:if>
							 <c:if test="${product.type eq '2' }">
							 <label><input name="type" type="radio" value="0" />无货</label>
							 <label><input name="type" type="radio" value="1" />少量货源</label>
							 <label><input name="type" type="radio" value="2" checked="checked"/>货源充足</label>
							 </c:if>
						</div>
						</c:if>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					     <c:if test="${product!=null }">
						 <button type="submit" class="btn btn-default">修改商品</button> &nbsp;${msg }
						 </c:if>
						 <c:if test="${product==null }">
						 <button type="submit" class="btn btn-default">添加商品</button> &nbsp;${msg }
						 </c:if>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
</body>
</html>