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
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>></title>

<!--imports-->
<%@include file="../../commons/frontend_imports.jsp"%>
</head>
<body>

	<!--header -->
	<%@include file="../../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">${tag}</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='/frontend/blog/index'/>">寵物專欄</a> <span
							class="lnr lnr-arrow-right"></span><a
							href="<c:url value='/frontend/blog/index'/>">文章分類</a> <span
							class="lnr lnr-arrow-right"></span> <a href=""> ${tag}</a>
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
			 <!-- 新增內容 -->		
			</div>
		</div>
	</section>
	<!-- content -->

	<!--footer -->
	<%@include file="../../commons/frontend_footer.jsp"%>
</body>

</html>