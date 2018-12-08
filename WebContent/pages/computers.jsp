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
		<%-- <div class="container searchBox" style="margin-top:20px;margin-bottom: 0px; left:25%;">
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
			</div> --%>
		<!-- <div class="aui-content-max" style="margin-top: 50px;margin-bottom: 50px;">
	

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
</div> -->
	
	
		<div class="container tips">
			<c:if test="${param.model != null}">
			
				<div class="alert alert-success tip-success"> 
	   				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	   				<strong>成功！</strong>您已经将 <b>${param.brand } ${param.model} </b>加入到购物车中!
	   				<b><a href="computerServlet?method=forwardPage&page=cart&pageNo=${computerpage.pageNo }">立即查看购物车</a></b>
	  			</div> 
				
			</c:if>
			
		</div>
	

		
			
		 	<div class="container">
					<div class="container">
					<c:if test="${products.size()==0}"><h1>抱歉没有相关商品</h1></c:if>
					
					
					
			
					
					
					
					
					
					<c:forEach items="${products}" var="product">
					
						
						  <div class="col-sm-6 col-md-4">
							  <a href="productdetail.do?productid=${product.productid }" >
							  		<div class="thumbnail">
								      <img src="public/img/${product.productid }.jpg" style="width: 240px;height: 240px;">
								      <div class="caption">
								        <h3 style="color:black;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${product.name }&nbsp;${product.addr }</h3>
								        <p  class="prcieNum">￥ ${product.price }</p>
								        <p><c:if test="${product.type==0}">
								        
								        <a   class="btn btn-primary addToCart" role="button" style="background-color: gray;"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 暂时无货</a> 
								        </c:if>
								        <c:if test="${product.type==1}">
								        	<a href="#" onclick="addcart(p='${product.price}',n='${product.name }',i='${product.productid }');" class="btn btn-primary addToCart" role="button" ><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 少量货源~加入购物车</a> 
								        	</c:if>
								        	<c:if test="${product.type==2}">
								        	<a href="#" onclick="addcart(p='${product.price}',n='${product.name }',i='${product.productid }');" class="btn btn-primary addToCart" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 加入购物车</a> 
								        	</c:if>
								        	<!-- <a href="#" class="btn btn-default" role="button"> <span class="glyphicon glyphicon-star" aria-hidden="true" style="color:#FF8F1C;"></span> 收藏</a> -->
						        		</p>
						      		 </div>
						    		</div>
							  </a>
							    
						  </div>
						
					</c:forEach>
					</div>
				
		
					<%-- <div class="container">
						共 <span class="badge">${computerpage.totalPageNumber }</span> 页
					&nbsp;&nbsp;
					当前第 <span class="badge">${computerpage.pageNo } </span> 页		
					&nbsp;&nbsp;
					
					<c:if test="${computerpage.hasPrev }">
						<a class="btn btn-default" role = "button" href="computerServlet?method=getComputers&pageNo=1">首页</a>
						&nbsp;&nbsp;
						<a class="btn btn-default" role = "button" href="computerServlet?method=getComputers&pageNo=${computerpage.prevPage }">上一页</a>
					</c:if>
			
					&nbsp;&nbsp;
					
					<c:if test="${computerpage.hasNext }">
						<a class="btn btn-default" role = "button" href="computerServlet?method=getComputers&pageNo=${computerpage.nextPage }">下一页</a>
						&nbsp;&nbsp;
						<a class="btn btn-default" role = "button" href="computerServlet?method=getComputers&pageNo=${computerpage.totalPageNumber }">末页</a>
					</c:if>
					
					&nbsp;&nbsp;
					
					转到 <input  type="text" size="1" id="pageNo"  data-dismiss="alert" aria-label="Close"/> 页	
					</div> --%>
					
			
		</div>
		<%@ include file="/commons/footer.jsp"%>
		
			

	
<script type="text/javascript">

function addcart(p,n,i){
	var price =p;
	var productname = n;
	var productid = i;
	var huowugeshu = $("#huowugeshu").text();
	$
	.ajax({
		type : "post",
		url : "addcart.do",
		data : {
			"price" : price,
			"productname" : productname,
			"productid" : productid
		},
		async : false,
		dataType : 'text',
		success : function(data) {
			alert(data);
			huowugeshu++;
			$("#huowugeshu").text(huowugeshu);
			window.scrollTo(100,500);
		},
		error : function(data) {
			alert("添加出错！请联系管理员" + data);
		}
	});
	return;
}

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