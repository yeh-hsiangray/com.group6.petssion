<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>ShowPet</title>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

body {
	background: #fff281;
	color: #666666;
	font-family: "RobotoDraft", "Roboto", sans-serif;
	font-size: 16px;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

/* Container */
.container {
	position: relative;
	max-width: 900px;
	width: 100%;
	margin: 0 auto 100px;
}

.container.active .card:first-child {
	background: #f2f2f2;
	margin: 0 15px;
}

.container.active .card:nth-child(2) {
	background: #fafafa;
	margin: 0 10px;
}

/* Card */
.card {
	position: relative;
	background: #ffffff;
	border-radius: 5px;
	padding: 60px 0 40px 0;
	box-sizing: border-box;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: 0.3s ease;
}

.card:first-child {
	background: #fafafa;
	height: 10px;
	border-radius: 5px 5px 0 0;
	margin: 0 10px;
	padding: 0;
}

.card .title {
	position: relative;
	z-index: 1;
	border-left: 5px solid #ed5e25;
	margin: 0 0 35px;
	padding: 10px 0 10px 50px;
	color: #ed5e25;
	font-size: 32px;
	font-weight: 600;
	text-transform: uppercase;
}

.card .input-container, .card .ra1 {
	position: relative;
	margin: 0 60px 50px;
}


.card .input-container input:focus ~ label {
	color: #9d9d9d;
	transform: translate(-12%, -50%) scale(0.9);
}

.card .input-container input:focus ~ .bar:before, .card .input-container input:focus 
	 ~ .bar:after {
	width: 50%;
}

.card .input-container input:valid ~ label {
	color: #9d9d9d;
	transform: translate(-12%, -50%) scale(0.75);
}

.card .input-container label {
/* 	position: absolute; */
	top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
	transition: 0.2s ease;
}

.card .ra1 label {
	/*  	position: absolute; */
	top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
}

.card .input-container .bar, .card .ra1 .bar {
	position: absolute;
	left: 0;
	bottom: 0;
	background: #757575;
	width: 100%;
	height: 1px;
}

.card .input-container .bar:before, .card .input-container .bar:after {
	content: "";
	position: absolute;
	background: #ed5e25;
	width: 0;
	height: 2px;
	transition: 0.2s ease;
}

.card .input-container .bar:before {
	left: 50%;
}

.card .input-container .bar:after {
	right: 50%;
}

.card .button-container {
	margin: 0 60px;
	text-align: center;
}

.card .button-container button {
	outline: 0;
	cursor: pointer;
	position: relative;
	display: inline-block;
	background: 0;
	width: 140px;
	border: 2px solid #e3e3e3;
	padding: 20px 0;
	font-size: 20px;
	font-weight: 600;
	line-height: 0.5;
	text-transform: uppercase;
	overflow: hidden;
	transition: 0.3s ease;
}

.card .button-container button span {
	position: relative;
	z-index: 1;
	color: #ddd;
	transition: 0.3s ease;
}

.card .button-container button:before {
	content: "";
	position: absolute;
	top: 50%;
	left: 50%;
	display: block;
	background: #ed5e25;
	width: 30px;
	height: 30px;
	border-radius: 100%;
	margin: -15px 0 0 -15px;
	opacity: 0;
	transition: 0.3s ease;
}

.card .button-container button:hover, .card .button-container button:active,
	.card .button-container button:focus {
	border-color: #ed5e25;
}

.card .button-container button:hover span, .card .button-container button:active span,
	.card .button-container button:focus span {
	color: #ed5e25;
}

.card .button-container button:active span, .card .button-container button:focus span
	{
	color: #ffffff;
}

.card .button-container button:active:before, .card .button-container button:focus:before
	{
	opacity: 1;
	transform: scale(10);
}

.t1 img {
	
}

.a1 {
	top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
	margin: 0 60px 0;
}

.t1 td {
	border: 2px solid #ccc;
	width: 200px;
	height: 200px;
	padding: o;
}

.t1 {
	margin: auto;
}

.b1 {
	display: none;
}


#tab-demo {
	width: 400px;
	height: 200px;
	margin-left: 320px;
}

#tab-demo>ul {
	display: block;
	margin: 0;
	list-style: none;
	width: 900PX;
}

.tab-title {
	list-style: none;
}

#tab-demo>ul>li {
	display:inline-block;
	vertical-align: top;
	font-family: '微軟正黑體';
	font-size:20px;
	margin: 0 -1px -1px 0;
	border: 1px solid #BCBCBC;
	line-height: 25px;
	background: #cdcdcd;
	padding: 4px 25px;
	list-style: none;
	box-sizing: border-box;
}

#tab-demo>ul>li a {
	color: #000;
	text-decoration: none;
	margin:auto;
}

#tab-demo>ul>li.active {
	border-bottom: 1px solid #fff;
	background: #fff;
}

#tab-demo>.tab-inner {
margin:auto;
	clear: both;
	color: #000;
/* 	border: 1px #BCBCBC solid; */
	width: 900px;
}

</style>
<script src="//apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var $li = $('ul.tab-title li');
		$($li.eq(0).addClass('active').find('a').attr('href')).siblings(
				'.tab-inner').hide();

		$li.click(function() {
			$($(this).find('a').attr('href')).show().siblings('.tab-inner')
					.hide();
			$(this).addClass('active').siblings('.active')
					.removeClass('active');
		});
	});
</script>

</head>
<body>
	
			<div style="text-align: center">
				<h1>寵物列表</h1>
			</div>
	
	<div align='center'>
		<a href="<c:url value='/' />">新增寵物</a> <a href="<c:url value='/' />">回首頁</a>
	</div>
	<hr
		style="width: 1400px; height: 3px; border: none; color: #ed5e25; background-color: #ed5e25;">

	<c:choose>
		<c:when test="${empty pet}">
			<p align="center">
				沒有任何寵物資料<br>
		</c:when>
		<c:otherwise>

			<div id="tab-demo">

				<ul class="tab-title">
					<c:forEach var='pets' items='${pet}' varStatus="petStatus">
						<c:forEach var='i' begin="${petStatus.begin}" end="${petStatus.end}">
							<li value="${i}"><a href="#tab0${petStatus.index}">${pets.name}</a></li>
						</c:forEach>
					</c:forEach>
				</ul>

				<c:forEach var='pets' items='${pet}' varStatus="petStatus">
					<c:forEach var='i' begin="${petStatus.begin}"
						end="${petStatus.end}">

						<div value="${i}" id="tab0${petStatus.index}" class="tab-inner">
<!-- 							------------------------------------------------------------- -->
							<div class="container">
								<div class="card"></div>
								<div class="card">
									<h1 class="title">寵物檔案:${pets.name}</h1>
									<table class="t1">
										<tr>
<!-- 										用map的key值去對應到petId 取出對應的圖片id -->
											<c:forEach var='petImg' items='${petImgIdMap[pets.id]}' varStatus="petStatus">
												<td>
													<img id="preview_petImage" src='picture/${petImg}' width="200px" />
												</td>
<!-- 												在4格後新增tr換列 -->
												<c:if test="${petStatus.count % 4 == 0}" >
													<tr></tr>
												</c:if>
											</c:forEach>
											
											</tr>
											</table>
									<br> <br> <br>

									<div class="ra1">
										<label for="#{label}">名字:</label> ${pets.name}
										<div class="bar"></div>
									</div>
									<div class="ra1">
										<label for="#{label}">性別:</label> ${pets.gender}
									</div>

									<div class="ra1">
										<label for="#{label}">年齡:</label> ${pets.age}
										<div class="bar"></div>
									</div>
									<div class="ra1">
										<label for="#{label}">種類:</label>
										${pets.type.name}-${pets.kind.name}
									</div>

									<div class="ra1">
										<label for="#{label}">喜愛食物:</label> ${pets.food.name}
									</div>

									<div class="ra1">
										<label for="#{label}">個性:</label> ${pets.personality.name}
									</div>

									<div class="button-container">
										<a href="<c:url value='/' />pet/update/${pets.id}">
										<button type="button">
											<span>編輯</span>
										</button>
										</a>
									</div>
								</div>
							</div>
							<!-- 					---------------------------- -->
						</div>
					</c:forEach>
				</c:forEach>
			</div>

		</c:otherwise>
	</c:choose>
</body>
</html>