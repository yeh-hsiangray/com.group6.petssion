<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="../images/favicon1.ico">
<!-- Author Meta -->
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>錯誤Error</title>

<!--imports-->
<%@include file="../commons/frontend_imports.jsp"%>
<style type="text/css">

body {
	background: #fff281;
	color: #666666;
	/* 	font-family: "RobotoDraft", "Roboto", sans-serif; */
	font-size: 20px;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<!--header -->
	<%@include file="../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">錯誤Error</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='/' />">返回首頁</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- content -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12"></div>
						<p style="color:red; font-weight:bold;">很抱歉，服務異常，請聯繫Petssion客服進行處理</p>
						<div>
						<p>請求路徑:${pageContext.errorData.requestURI}</p>
						<p>錯誤訊息:${pageContext.exception}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- content -->

	<!--footer -->
	<%@include file="../commons/frontend_footer.jsp"%>
</body>

</html>