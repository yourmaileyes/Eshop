<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String jsUrl = request.getContextPath() + "/public/js/";
	String cssUrl = request.getContextPath() + "/public/css/";
	String imgUrl = request.getContextPath() + "/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>webshop商家聊天</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cssUrl%>login.css">
<link rel="stylesheet" href="<%=cssUrl%>amazeui.min.css">
<script src="<%=jsUrl%>login.js"></script>
<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="public/css/base.css">
<link rel="stylesheet" type="text/css" href="public/css/home.css">
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
</head>
<body>
	<div class="admin-content">
		<div class="" style="width: 80%; float: left;">
			<!-- 聊天区 -->
			<div class="am-scrollable-vertical" id="chat-view"
				style="height: 310px;">
				<ul class="am-comments-list am-comments-list-flip" id="chat">
					<c:forEach items="${messages}" var="message">
						<c:if test="${message.fromid eq loginUser.userid }">
					<li class="am-comment am-comment-flip am-comment-primary"><a
						href="#link-to-user-home"><img width="48" height="48"
							class="am-comment-avatar" alt=""
							src="static/source/img/default_head.jpg"></a>
					<div class="am-comment-main">
							<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">${loginUser.username }</a> 发表于
								<time><fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
								
							</div>
							</header>
							<div class="am-comment-bd">
								<p>${message.context }</p>
							</div>
						</div></li>
                   </c:if>
                   <c:if test="${message.toid eq loginUser.userid }">
					<li class="am-comment am-comment-primary"><a
						href="#link-to-user-home"> <img width="48" height="48"
							class="am-comment-avatar" alt=""
							src="static/source/img/default_head.jpg"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd">
							<div class="am-comment-meta">
								<a class="am-comment-author" href="#link-to-user">${message.fromid }</a> 发表于
								<time><fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
								
							</div>
							</header>
							<div class="am-comment-bd">
								<p>${message.context }</p>
							</div>
						</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<!-- 输入区 -->
			<form action="talksend.do" method="post">
			<input type="hidden" name="fromid" value="${loginUser.userid }">
			<input type="hidden" name="toid" value="${messagefromid }"> 
			<div class="am-form-group am-form">
				<textarea class="" id="message" name="context" rows="5"
					placeholder="这里输入你想发送的信息..."></textarea>
			</div>
			<!-- 接收者 -->
			<div class="" style="float: left">
				<p class="am-kai">
					<!-- 发送给 : <span id="sendto">赵丽丽</span> -->
				</p>
			</div>
			<!-- 按钮区 -->
			<div class="am-btn-group am-btn-group-xs" style="float: right;">
				<button class="am-btn am-btn-default" type="submit"
					onClick="sendMessage()">
					<span class="am-icon-commenting"></span> 发送
				</button>
			</div>
			</form>
		</div>
		<!-- 列表区 -->
		<div class="am-panel am-panel-default"
			style="float: right; width: 20%;">
			<div class="am-panel-hd">
				<h3 class="am-panel-title">客户列表 [${usersmap.size() }]</h3>
			</div>
			<c:forEach items="${users }" var="fromid">
			<c:if test="${fromid!=loginUser.userid }">
			<ul class="am-list am-list-static am-list-striped">
				<li><a href="sellertalk.do?messagefromid=${fromid }">${fromid}</a>
					<c:if test="${usersmap.get(fromid) }"><button class="am-btn am-btn-xs am-btn-danger" id="tuling"
						data-am-button>新消息！</button></c:if>
				</li>
			</ul>
			</c:if>
			<!-- <ul class="am-list am-list-static am-list-striped" id="list">
				<li>赵丽丽
					<button type="button"
						class="am-btn am-btn-xs am-btn-primary am-round"
						onclick="addChat('赵丽丽');">
						<span class="am-icon-phone"><span> 私聊
					</button>
				</li>
			</ul> -->
			</c:forEach>
		</div>
	</div>
</body>
</html>