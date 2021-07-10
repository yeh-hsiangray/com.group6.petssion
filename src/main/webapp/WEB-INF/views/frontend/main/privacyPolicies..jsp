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
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12"></div>

						<div class="container">
						</div>
						<div id="exTab1" class="container">
							<ul class="nav nav-pills">
								<li class="active"><a href="#1a" data-toggle="tab">隱私權政策</a>
								</li>
								<li><a href="#2a" data-toggle="tab">法律資訊</a></li>
								<li><a href="#3a" data-toggle="tab">Cookie政策</a></li>
							</ul>

							<div class="tab-content clearfix">
								<div class="tab-pane active" id="1a">
									<h3>Content's background color is the same for the tab</h3>
								</div>
								<div class="tab-pane" id="2a">
									<h3>We use the class nav-pills instead of nav-tabs which
										automatically creates a background color for the tab</h3>
								</div>
								<div class="tab-pane" id="3a">
									<h3>We applied clearfix to the tab-content to rid of the
										gap between the tab and the content</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- content -->

	<!--footer -->
	<%@include file="../../commons/frontend_footer.jsp"%>
</body>

</html>