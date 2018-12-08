function showdenglu() {
		$("#dengluinput").fadeIn();
	}
	function guanbi() {
		$("#dengluinput").fadeOut();
	}
	function zhuce() {
		var addr = document.createElement("input");
		var phone = document.createElement("input");
		var br = document.createElement("br");
		$("#labeladdr").text("地址");
		addr.id = "addr";
		addr.name = "addr";
		addr.type = "text";
		br.id="br";
		$("#labeladdr").after(addr);
		$("#labeladdr").after(br);
		$("#labelphone").text("手机号码");
		phone.id = "phone";
		phone.name = "phone";
		phone.type = "text";
		$("#labelphone").after(phone);
		$("#addr").addClass("denglu-input");
		$("#phone").addClass("denglu-input");
		$("#tijiao").html("注册");
		$("#registseller").html("注册成为商家～");
		$("#tijiao").attr("onclick", "quickregist()");
		$("#zhuce").css("border-bottom", "1px solid #f01400");
		$("#denglu").css("border-bottom", "1px solid #d0d6d9");
		$("#zhuce").attr("onclick", "#");
		$("#denglu").attr("onclick", "denglu()");
		$("#form1").attr("action", "regist.do");
	}
	function denglu() {
		$("#labeladdr").text("");
		$("#labelphone").text("");
		$("#phone").remove();
		$("#addr").remove();
		$("#br").remove();
		$("#registseller").html("");
		$("#zhuce").css("border-bottom", "1px solid #d0d6d9");
		$("#denglu").css("border-bottom", "1px solid #f01400");
		$("#denglu").attr("onclick", "#");
		$("#zhuce").attr("onclick", "zhuce()");
		$("#tijiao").html("登录");
		$("#tijiao").attr("onclick", "quickpasswordchat()");
		$("#form1").attr("action", "login.do");
	}
	function quickpasswordchat() {
		var username = $("#username").val();
		var password = $("#password").val();
		var isok = true;
		if (username == "" || password == "") {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>用户名或密码不能为空!</b>");
			isok = false;
			return;
		}
		$
				.ajax({
					type : "post",
					url : "quickpasswordchat.do",
					data : {
						"username" : username,
						"password" : password
					},
					async : false,
					dataType : 'text',
					success : function(data) {
						if (data == "0") {
							$("#tishi")
									.html(
											"<b style='color:red;font-size:15px;'>用户名或密码错误!</b>");
							isok = false;
						} else {
							$("#tishi").html("正在登录.....");
						}
					},
					error : function(data) {
						alert("登录出错！请联系管理员" + data);
						isok = false;
					}
				});
		if (isok) {
			$("#form1").submit();
		}
	}

	function quickregist() {
		var username = $("#username").val();
		var password = $("#password").val();
		var phone = $("#phone").val();
		var addr = $("#addr").val();
		var isok = true;
		if (username == "" || password == "") {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>用户名或密码不能为空!</b>");
			isok = false;
			return;
		}
		if (phone == "" || addr == "") {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>手机号或地址不能为空!</b>");
			isok = false;
			return;
		}
		$
				.ajax({
					type : "post",
					url : "quickusernamechat.do",
					data : {
						"username" : username
					},
					async : false,
					datatype : "text",
					success : function(data) {
						if (data == "1") {
							$("#tishi")
									.html(
											"<b style='color:red;font-size:15px;'>用户名已经存在!</b>");
							isok = false;
						} else {
							$("#tishi").html("正在注册.....");
						}
					},
					error : function(data) {
						alert("注册出错！请联系管理员" + data);
						isok = false;
					}
				});
		if (isok) {
			$("#form1").submit();
		}

	}