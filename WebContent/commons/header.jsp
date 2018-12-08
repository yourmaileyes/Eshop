<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<nav class="navbar navbar-default navbar-static-top">
<div id="dengluinput"
	style="position: fixed; background: rgb(255, 255, 255) none repeat scroll 0% 0%; z-index: 100000; width: 360px; left: 50%; top: 50%; margin: -218px 0px 0px -180px; box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.25); display: none;">

	<div
		style="font-size: 16px; line-height: 49px; height: 49px; color: #787d82; border-bottom: 1px solid #d0d6d9;">

		<span id="denglu" onclick="denglu()"
			style="border-bottom: 1px solid #f01400; color: #f01400; float: left; width: 80px; text-align: center; height: 49px; line-height: 49px; cursor: pointer; padding: 0 20px;">登录</span>

		<span id="zhuce" onclick="zhuce()"
			style="border-bottom: 1px solid #d0d6d9; color: #f01400; float: left; width: 80px; text-align: center; height: 49px; line-height: 49px; cursor: pointer; padding: 0 20px;">注册</span>

		<span style="float: right; cursor: pointer; padding-right: 20px"
			onclick="guanbi()"> X </span>

	</div>
	<div style="padding: 30px 30px;">
		<form id="form1" action="login.do" method="post">
			<label for="username">用户名</label> <input class="denglu-input"
				id="username" type="text" name="username"><br> <label
				for="password">密码</label> <input class="denglu-input" id="password"
				type="password" name="password"><br> <label
				id="labeladdr" for="addr"><br></label>
				<br/> <label id="labelphone"
				for="phone"></label><br> <a id="registseller" href="regist.jsp"></a><span id="tishi"></span><br>
		</form>
		<button id="tijiao" onclick="quickpasswordchat()" type="button"
			style="color: #fff; margin-top: 20px; border-color: #c20a0a; width: 90%; height: 50px; background: #c20a0a;">登录</button>

	</div>
</div>
	      <div class="container">
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <a class="navbar-brand" href="index.do"><span class="glyphicon glyphicon-home"></span>&nbsp;Webshop</a>
		        </div>
		        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
		          <ul class="nav navbar-nav">
		            <li><a href="index.do">首页</a></li>
		            <li><a href="products.do">所有商品</a></li>
		            </ul>
		            <!-- 搜索框 --><ul class="nav navbar-nav">
        <div class="container searchBox" style="margin-top:5px;position:relative;margin-bottom:0; left:50px;">
				<form action="productsucah.do" method="post" class="form-inline">
					<div class="form-group">
						<div >
						    <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
						    <div class="input-group" style="width: 450px;">
						      <div class="input-group-addon">搜索商品</div>
						      <input type="text" class="form-control col-xs-1" name="name" value="${name }"/>
						    </div>
						  </div>
					 </div>
  					<button type="submit" class="btn btn-primary searchBtn "><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
				</form>
			</div>
		          </ul>
		          <ul class="nav navbar-nav navbar-right">
		          <c:if test="${loginUser!=null }">
      				<li role="presentation" ><a href="cart.do"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;购物车&nbsp;<span id="huowugeshu" class="badge" style="background-color: red;">${cartnumber }</span></a></li>
        		  </c:if>
	       	 		<li class="dropdown">
		          		<c:if test="${loginUser!=null}">
		          		<a name="top" href="#"  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
		          		   
		          		${loginUser.username}<c:if test="isnew"><span class="badge" style="background-color: red;">new</span></c:if><span class="caret"></span></a>
		          		<ul class="dropdown-menu">
				            <li><a href="info.do?type=0">我的账号</a></li>
				            <li><a href="info.do?type=1">修改密码</a></li>
				            <li><a href="info.do?type=2">我的订单</a></li>
				            <li><a href="talk.do" target="_blank">我的消息<c:if test="isnew"><span class="badge" style="background-color: red;">new</span></c:if></a></li>
				            <li role="separator" class="divider"></li>
				            <li><a href="logout.do">退出</a></li>
		          		</ul>
		          		</c:if>
		          		<c:if test="${loginUser==null}">
		          		<a href="#" name="top" onclick="showdenglu()" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		          		登录|注册
		          		</a>
		          		</c:if>
	        		</li>
      			  </ul>
		        </div><!--/.nav-collapse -->
	      </div>
    	</nav>