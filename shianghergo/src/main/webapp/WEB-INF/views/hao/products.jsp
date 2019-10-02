<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script> -->
<script
	src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/static/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<script>
	function goCart(x){
		$.ajax({
			url:"../gocart?itemid="+x,
			type:"get",
			success:function(data){
				alert("添加成功")
			},
		})
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/eric/header.jsp"></jsp:include>

	<div class="content content-nav-base commodity-content">
		<div class="commod-cont-wrap">
			<div class="commod-cont w1200 layui-clear">
				<div class="left-nav">
					<div class="title">所有分类</div>
					<div class="list-box">
						<dl>
							<dt>奶粉辅食</dt>
							<dd>
								<a href="javascript:;">进口奶粉</a>
							</dd>
							<dd>
								<a href="javascript:;">宝宝辅食</a>
							</dd>
							<dd>
								<a href="javascript:;">营养品</a>
							</dd>
						</dl>
						<dl>
							<dt>儿童用品</dt>
							<dd>
								<a href="javascript:;">纸尿裤</a>
							</dd>
							<dd>
								<a href="javascript:;">婴儿湿巾</a>
							</dd>
							<dd>
								<a href="javascript:;">婴儿车</a>
							</dd>
							<dd>
								<a href="javascript:;">婴儿床</a>
							</dd>
							<dd>
								<a href="javascript:;">儿童安全座椅</a>
							</dd>
						</dl>
						<dl>
							<dt>儿童早教</dt>
							<dd>
								<a href="javascript:;">儿童玩具</a>
							</dd>
							<dd>
								<a href="javascript:;">早教书籍</a>
							</dd>
							<dd>
								<a href="javascript:;">孕产育儿书</a>
							</dd>
						</dl>
						<dl>
							<dt>儿童服饰</dt>
							<dd>
								<a href="javascript:;">童装</a>
							</dd>
							<dd>
								<a href="javascript:;">童鞋</a>
							</dd>
							<dd>
								<a href="javascript:;">宝宝配饰</a>
							</dd>
						</dl>
						<dl>
							<dt>孕妈专区</dt>
							<dd>
								<a href="javascript:;">孕妇装</a>
							</dd>
							<dd>
								<a href="javascript:;">孕妇护肤</a>
							</dd>
							<dd>
								<a href="javascript:;">孕妇用品</a>
							</dd>
						</dl>
					</div>
				</div>



				<div class="right-cont-wrap">
					<div class="right-cont">
						<div class="prod-number"></div>
						<div class="cont-list layui-clear" id="list-cont">
							<c:forEach var='product' items='${products }'>
								<div class="item" style="height: 390px;">
									<div class="img">
										<a
											href="<spring:url value='/hao/product?id=${product.id }' />">
											<img width='280px' height='280px'
											src="<c:url value='/hao/getPicture/${product.id }' />">
										</a>
									</div>
									<div class="text">
										<p class="title">
											&nbsp;&nbsp;&nbsp;&nbsp;${product.name } <span class="pri"
												style="float: right; font-size: 20px; color: gray;"><del>${product.price+100 }元</del>&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</p>
										<p class="price">
											<button class="layui-btn  layui-btn-danger car-btn"
												style="width: 140px; height: 40px; float: left;">
												<i class="layui-icon layui-icon-cart-simple"></i>加入購物車
											</button>
											<span class="pri" style="float: right; font-size: 20px;">${product.price }元&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<div id="demo0" style="text-align: center;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>商品清單</h1>
				<a href="../cart">進入購物車</a>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<c:forEach var='product' items='${products }'>
			<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
				<div class="thumbnail" style="width: 320px; height: 340px">
					<img width='100' height='200'
						src="<c:url value='/hao/getPicture/${product.id }' />" />
					<div class="caption">
						<p>
							<b style='font-size: 16px;'>${product.name }</b>
						</p>
						<p>價格：${product.price }</p>
						<p>目前在庫數量：${product.reserve }</p>
						<p>
							<a href="<spring:url value='/hao/product?id=${product.id }' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>詳細資料
							</a> <a
								href="<spring:url value='/hao/product/Update?id=${product.id }' />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sigh glyphicon"></span>修改
							</a>
							<button onclick="goCart(${product.id})">加入購物車</button>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>
</body>
</html>