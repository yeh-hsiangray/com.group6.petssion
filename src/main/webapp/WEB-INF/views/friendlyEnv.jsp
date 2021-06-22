
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="<c:url value='/css/style.css' />"
	type="text/css" />
<meta charset="UTF-8">
<title>友善搜尋</title>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<!-- Start contact-page Area -->
	<section class="contact-page-area">

		<div class="row">
			<div class="framefriendly">
				<div class="content">
					<br> <br>
					<div>
						<form id="friendlyEnvSearch"
							action="<c:url value='/FriendlyEnvSearch' />" class="black">
							FriendlyBK: <input type="submit">
						</form>
						<hr>
						<form id="friendlyFR" action="<c:url value='/FriendlyEnvSearchFR' />"
							class="black">
							FriendlyFR: <input type="submit">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End contact-page Area -->
</body>
</html>


<!-- 
名字: Gina
日期: 2021/05/01
 -->

