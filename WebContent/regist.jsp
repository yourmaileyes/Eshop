<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>webshop商户注册</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="public/css/regist.css" />
<script type="text/javascript" src="public/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//注册前台验证
	var formObj = {
		"checkRegistForm" : function() {
			 //1. 非空验证
			var flag = true;//控制表单提交的变量，默认为true
			flag = this.checkNull("username", "用户名不能为空") && flag;
			flag = this.checkNull("password", "密码不能为空") && flag;
			flag = this.checkNull("password2", "确认密码不能为空") && flag;
			flag = this.checkNull("nickname", "昵称不能为空") && flag;
			flag = this.checkNull("phone", "手机号不能为空") && flag;
			flag = this.checkPassword("password", "两次密码应该一致") && flag;
			flag = this.checkEmail("phone", "手机格式不正确") && flag;
			return flag; 
		},
		"checkEmail" : function(name, msg) {
			var email = $("input[name='" + name + "']").val();
			// 当邮箱的值不为空串时再进行格式判断
			if ($.trim(email) != "") {
				var reg = /^1[3,5,8]\d{9}$/;
				if (!reg.test(email)) {
					this.setMsg(name, msg);//设置错误提示信息
					return false;
				} else {
					this.setMsg(name, "");// 清空之前添加的错误提示信息
					return true;
				}
			}
			return false;
		},
		"checkPassword" : function(name, msg) {
			var psd1 = $("input[name='" + name + "']").val();
			var psd2 = $("input[name='" + name + "2']").val();
			if ($.trim(psd1) != "" && $.trim(psd2) != "") {
				if (psd1 != psd2) {
					this.setMsg(name + "2", msg);
					return false;
				} else {
					this.setMsg(name + "2", "");// 清空之前添加的错误提示信息
					return true;
				}
			}
			return false;
		},
		"checkNull" : function(name, msg) {// 用来判断input值是否为null的方法
			var value = $("input[name='" + name + "']").val();//拿到对应的input框的值
			if ($.trim(value) == "") {
				this.setMsg(name, msg);
				return false;// 表单不应该提交
			} else {
				this.setMsg(name, "");
				return true;
			}
		},
		"setMsg" : function(name, msg) {
			// 获取name指定的input后面的span,然后将传入的错误提示信息
			$("input[name='" + name + "']").nextAll("span").html(msg).css(
					"color", "red");
		},
	};
	// 当input失去焦点时马上执行对应的表单验证
	//文档就绪事件，当当前文档加载完成后，会自动调用
	    //文档每次加载都会执行
		$(function(){
			$("input[name='username']").blur(function() {
				formObj.checkNull("username", "用户名不能为空");
			});
			$("input[name='password']").blur(function() {
				formObj.checkNull("password", "密码不能为空");
			});
			$("input[name='password2']").blur(function() {
				formObj.checkNull("password2", "确认密码不能为空");
				formObj.checkPassword("password", "两次密码应该一致");
			});
			$("input[name='nickname']").blur(function() {
				formObj.checkNull("nickname", "昵称不能为空");
			});
			$("input[name='phone']").blur(function() {
				formObj.checkNull("phone", "邮箱不能为空");
				formObj.checkEmail("phone", "邮箱格式不正确");
			});
		});
		
</script>
</head>
<body>
	<form action="sellerregist.do" method="post"
		onSubmit="return formObj.checkRegistForm()" >
		<h1>商户注册</h1>
		<table border="0">
			<tr>
			    <td class="tds">用户名：</td>
				<td><input type="text" name="username" id="username"/><span id="user_checkHas" style="color:red;font-family:STkaiti;">${registMsg}</span></td>
			</tr>
			<tr>
				<td class="tds">密码：</td>
				<td><input type="password" name="password" id="password"/><span style="color:red;font-family:STkaiti;"></span></td>
			</tr>
			<tr>
				<td class="tds">确认密码：</td>
				<td><input type="password" name="password2" id="password2"/><span style="color:red;font-family:STkaiti;"></span></td>
			</tr>
			<tr>
				<td class="tds">昵称：</td>
				<td><input type="text" name="nickname" id="nickname"/><span style="color:red;font-family:STkaiti;"></span></td>
			</tr>
			<tr>
				<td class="tds">手机号：</td>
				<td><input type="text" name="phone" id="phone"/><span style="color:red;font-family:STkaiti;"></span></td>
			</tr>
			<tr>
				<td class="sub_td" colspan="2" class="tds"><input type="submit"
					value="立即注册" /></td>
			</tr>
		</table>
	</form>
</body>
</html>

