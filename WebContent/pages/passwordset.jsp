<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String jsUrl = request.getContextPath() + "/public/js/";
	String cssUrl = request.getContextPath() + "/public/css/";
	String imgUrl = request.getContextPath() + "/public/img/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cssUrl%>login.css">
<script src="<%=jsUrl%>login.js"></script>
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%@ include file="/commons/queryCondition.jsp"%>

</head>
<body>
	<%@ include file="/commons/header.jsp"%>
	<div
		style="position: relative; background-color: #fff; width: 1152px; height: 800px; padding-top: 50px; padding-bottom: 50px; margin: 0 auto;">
		<div
			style="position: relative; padding-top: 35px; float: left; width: 300px; height: 100px; margin-left: 100px; background-color: blue; background-color: #fff;">
			<center>
				<span
					style="font-weight: 600; text-align: left; font-size: 50px; color: black; line-height: 28px;">
					${loginUser.username } </span>
			</center>
		</div>
		<div
			style="position: relative; float: left; width: 550px; height: 100px; margin-left: 150px; background-color: blue; font-weight: 600; font-size: 35px; text-align: right; color: black; padding-top: 30px; line-height: 28px; background-color: #fff;">
			欢迎您！余额：￥${loginUser.collect }</div>

		<div
			style="position: relative; float: left; width: 950px; height: 500px; margin-top: 100px; margin-left: 100px; background-color: #; border: 1px solid #ddd; border-radius: 4px;">
			<div
				style="position: relative; width: 700px; height: 100px; margin-left: 150px; margin-top: 20px; border-color: #e7e7e7;">
				<div>
					<ul style="list-style: none;">
						<li><span onclick="infoset()"
							style="font-size: 25px; padding-top: 15px; padding-bottom: 15px; float: left; cursor: pointer; line-height: 48px; color: #787d82; background-color: transparent; text-align: left;">个人信息修改</span></li>
						<li><span onclick="passwordset()"
							style="font-size: 25px; line-height: 48px; float: left; padding-top: 15px; margin-left: 80px; padding-bottom: 15px; cursor: pointer; color: #787d82; background-color: #e7e7e7; text-align: left;">密码修改</span></li>
						<li><span onclick="showorder()"
							style="font-size: 25px; cursor: pointer; line-height: 48px; padding-top: 15px; margin-left: 90px; padding-bottom: 15px; color: #787d82; float: left; text-align: left;">订单查看</span></li>
					</ul>
				</div>
			</div>
			<div style="margin-left: 150px;">
				<form id="form2" action="infoset.do" method="post">
					<input type="hidden" name="userid" value="${loginUser.userid }">
					<input id="username1" type="hidden" name="username"
						value="${loginUser.username }"> <label for="oldpassword">原密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input class="denglu-input" id="oldpassword" name="oldpassword"
						type="password"><br>
					<br>
					<br> <label for="password0">新密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input class="denglu-input" id="password0" name="password"
						type="password"><br>
					<br>
					<br> <label for="password1">确认新密码&nbsp;</label> <input
						class="denglu-input" id="password1" name="password1"
						type="password"><br>
					<br>
					<br> <span id="tishitishi"
						style="color: red; font-size: 20px;"></span>
				</form>
			</div>
			<button onclick="info();"
				style="color: #333; background-color: #e6e6e6; border-color: #adadad; padding: 6px 12px; margin-bottom: 0; font-size: 14px; font-weight: 400; line-height: 1.42857143; text-align: center; white-space: nowrap; cursor: pointer; border: 1px solid transparent; margin-left: 700px; width: 100px; height: 50px; border-radius: 4px;">提交</button>
		</div>
	</div>
	<%@ include file="/commons/footer.jsp"%>
</body>
<script type="text/javascript">
	function info() {
		var oldpassword = $("#oldpassword").val();
		var password = $("#password0").val();
		var passwordconfim = $("#password1").val();
		var username = $("#username1").val();
		var isok = true;
		if (oldpassword == "" || password == "" || passwordconfim == "") {
			$("#tishitishi").text("密码不能为空");
			isok = false;
			return;
		}
		if (password != passwordconfim) {
			$("#tishitishi").text("两次密码不一致");
			isok = false;
			return;
		}
		$.ajax({
			type : "post",
			url : "quickpasswordchat.do",
			data : {
				"username" : username,
				"password" : oldpassword
			},
			async : false,
			dataType : 'text',
			success : function(data) {
				if (data == "0") {
					isok = false;
					$("#tishitishi").html("原密码错误");
				} else {
					$("#tishitishi").css("color", "black");
					$("#tishitishi").html("正在提交.....");
				}
			},
			error : function(data) {
				alert("登录出错！请联系管理员" + data);
				isok = false;
			}
		});
		if (isok) {
			$("#form2").submit();
		}
	}
</script>
</html>