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
<!-- 		<div class="container">
 --><!-- 			<div class="row">
				<div class="about-content col-lg-12">
				
				</div>
			</div>
		</div> -->
		<div style="d;width:auto;white-space: nowrap;">
					<h1>新增寵物</h1>	
					<a href="<c:url value='${header.referer}' /> "
						style="color: blue; font-size: 20px;">上一頁</a> &nbsp;&nbsp; <a
						href="<c:url value='/' />pet/showUserPets"
						style="color: blue; font-size: 20px;">寵物列表</a> &nbsp;&nbsp; <a
						href="<c:url value='/' />" style="color: blue; font-size: 20px;">回首頁</a>
				</div>
				    <input type="radio" id="r1" name="rr" />
    <label for="r1"><span></span>Radio Button 1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="radio" id="r2" name="rr" />
    <label for="r2"><span></span>Radio Button 2</label>
	</section>


	<!--footer -->
	<%@include file="../../commons/frontend_footer.jsp"%>
</body>

</html>