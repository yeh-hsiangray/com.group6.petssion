<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Author Meta -->
<meta name="author" content="DixonLiao">
<!-- Meta Description -->
<meta name="description" content="a blog about pets from Petssion.com">
<!-- Meta Keyword -->
<meta name="keywords" content="petssion">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>首頁</title>
<!--imports-->
<%@include file="../../commons/frontend_imports.jsp"%>
<style>
.ellipsis {
	display: -webkit-box;
	-webkit-line-clamp: 3;
	color: black;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}

.fshbox {
	font-size: 16px;
}

.fshboxh {
	font-size: 20px;
}

.joinbtn {
	font-size: 20px !important;
	margin: 30px;
}

body {
	background-color: rgb(243, 224, 115);
}

section {
	background-color: rgb(243, 224, 115);
}

.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}
.banner-area1 {
	background: url("<c:url value='/Sources/img/banner-bg-2.jpg' />") right
		!important;
	background-size: cover !important;
}
.banner-area2 {
	background: url("<c:url value='/Sources/img/banner-bg-3.jpg' />") right
		!important;
	background-size: cover !important;
}
.banner-area3 {
	background: url("<c:url value='/Sources/img/banner-bg-4.jpg' />") right
		!important;
	background-size: cover !important;
}
</style>
</head>
<body>

	<!--header -->
	<%@include file="../../commons/frontend_header.jsp"%>
	<!-- #header -->

	<!-- start banner Area -->
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-9 col-md-12"></div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<section class="banner-area1">
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-9 col-md-12"></div>
			</div>
		</div>
	</section>
	
	
	<section class="banner-area2">
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-9 col-md-12"></div>
			</div>
		</div>
	</section>
	
	
	<section class="banner-area3">
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-9 col-md-12"></div>
			</div>
		</div>
	</section>
	<!--footer -->
	<%@include file="../../commons/frontend_footer.jsp"%>

	<!--slideshoe js -->

</body>

</html>