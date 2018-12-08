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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>webshop购物</title>
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

<%@ include file="/commons/queryCondition.jsp" %>
</head>
<body>
		<%@ include file="../commons/header.jsp"%>
		
		<div class="aui-content-max" style="margin-top: 50px;margin-bottom: 100px;">
	

	<div class="aui-content-box" >
		<div class="example2" >
			<ul>
				<li>
					<img src="public/img/welcome2.jpg" alt="2" width="1200" height="350">
				</li>
				<li>
					<img src="public/img/welcome1.jpg" alt="1" width="1200" height="350">
				</li>
				<li>
					<img src="public/img/welcome3.jpg" alt="3" width="1200" height="350">
				</li>
			</ul>
			<ol>
				<li></li>
				<li></li>
				<li></li>
			</ol>
		</div>
	</div>
</div>
			
					<div class="container" style="margin-top: 100px;">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				每日精选
			</h3>
			<div class="row clearfix">
				<div class="col-md-4 column">
					<div class="media well">
						 <a href="#" class="pull-left"><img src="public/img/${dayproducts[0].productid }.jpg" width="300" height="200" class="media-object" alt='' /></a>
						<div class="media-body">
							<h4 class="media-heading">
								${dayproducts[0].name }
							</h4> 
							<span style="color: red;font-size: 20px;">￥ ${dayproducts[0].price }</span>
							<a href="productdetail.do?productid=${dayproducts[0].productid }" class="btn btn-primary addToCart" style="position:relative ;float: right;">
							<span  class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 查看详情</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="media well">
						 <a href="#" class="pull-left"><img src="public/img/${dayproducts[1].productid }.jpg" width="300" height="200" class="media-object" alt='' /></a>
						<div class="media-body">
							<h4 class="media-heading">
								${dayproducts[1].name }
							</h4> 
							<span style="color: red;font-size: 20px;">￥ ${dayproducts[1].price }</span>
							<a href="productdetail.do?productid=${dayproducts[1].productid }" class="btn btn-primary addToCart" style="position:relative ;float: right;">
							<span  class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 查看详情</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 column">
					<div class="media well">
						 <a href="#" class="pull-left"><img src="public/img/${dayproducts[2].productid }.jpg" width="300" height="200" class="media-object" alt='' /></a>
						<div class="media-body">
							<h4 class="media-heading">
								${dayproducts[2].name }
							</h4> 
							<span style="color: red;font-size: 20px;">￥ ${dayproducts[2].price }</span>
							<a href="productdetail.do?productid=${dayproducts[2].productid }" class="btn btn-primary addToCart" style="position:relative ;float: right;">
							<span  class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 查看详情</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		<%@ include file="/commons/footer.jsp"%>
		
			

	
<script type="text/javascript">

//商品滚动
$(function(){

	$(".next a").click(function(){ nextscroll() });

	function nextscroll(){

		var vcon = $(".aui-content-box-list ");

		var offset = ($(".aui-content-box-list li").width())*-1;

		vcon.stop().animate({left:offset},"slow",function(){

			var firstItem = $(".aui-content-box-list ul li").first();

			vcon.find("ul").append(firstItem);

			$(this).css("left","0px");

			circle()

		});

	};

	function circle(){

		var currentItem = $(".aui-content-box-list ul li").first();

		var currentIndex = currentItem.attr("index");

		$(".circle li").removeClass("circle-cur");

		$(".circle li").eq(currentIndex).addClass("circle-cur");

	}


	$(".prev a").click(function(){

		var vcon = $(".aui-content-box-list ");

		var offset = ($(".aui-content-box-list li").width()*-1);

		var lastItem = $(".aui-content-box-list ul li").last();

		vcon.find("ul").prepend(lastItem);

		vcon.css("left",offset);

		vcon.animate({left:"0px"},"slow",function(){

			circle()

		})

	});


});

var intDiff = parseInt(600000);//倒计时总秒数量

function timer(intDiff){
	window.setInterval(function(){

		var day=0,

			hour=0,

			minute=0,

			second=0;//时间默认值

		if(intDiff > 0){

			day = Math.floor(intDiff / (60 * 60 * 24));

			hour = Math.floor(intDiff / (60 * 60)) - (day * 24);

			minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);

			second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);

		}

		if (minute <= 9) minute = '0' + minute;

		if (second <= 9) second = '0' + second;


		$('#hour_show').html('<s id="h"></s>'+hour+'时');

		$('#minute_show').html('<s></s>'+minute+'分');

		$('#second_show').html('<s></s>'+second+'秒');

		intDiff--;

	}, 1000);

}


$(function(){

	timer(intDiff);

});

//ad自动滚动
$(function(){
	$(".example2").luara({width:"1200",height:"350",interval:3500,selected:"seleted",deriction:"left"});

});

</script>
</body>
</html>