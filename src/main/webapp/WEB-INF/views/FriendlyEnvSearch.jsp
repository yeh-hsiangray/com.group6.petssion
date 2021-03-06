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
<style>
.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}
</style>
<script>
	window.onload = function() {
		let role = '${userRole}'

		checkRole()

		function checkRole() {
			let role = '${userRole}'
			if (role == "admin") {
				// alert("it's role admin")
				var adminClass = document.querySelectorAll(".roleGeneral")
				for (i = 0; i < adminClass.length; i++) {
					adminClass[i].hidden = true
				}
			} else {
				//document.getElementById("editBtn").setAttribute("disabled", "")
				var adminClass = document.querySelectorAll(".roleAdmin")
				for (i = 0; i < adminClass.length; i++) {
					adminClass[i].hidden = true
				}
			}
		}
	}
</script>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!--imports-->
<c:choose>
	<c:when test="${userRole=='admin'}">
       <%@include file="commons/backend_imports.jsp"%>
    </c:when>

	<c:otherwise>
		<%@include file="commons/frontend_imports.jsp"%>
	</c:otherwise>
</c:choose>

</head>
<body>
	<!--header -->
	<c:choose>
		<c:when test="${userRole=='admin'}">
       		<%@include file="commons/backend_header.jsp"%>
       		<%@include file="commons/backend_sidebar.jsp"%>
   		 </c:when>
		<c:when test="${userRole!='admin'}">		
       		<%@include file="commons/frontend_header.jsp"%>
   		 </c:when>
		<c:otherwise>
			lalala
		</c:otherwise>
	</c:choose>



	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">${tag}</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='/frontend/blog/index'/>"></a> <a
							href="<c:url value='/frontend/blog/index'/>"></a> <a href="">
							${tag}</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- content -->
	<section class="post-content-area" style="background-color:rgb(243, 224, 115); height: 82vh">
		<div class="container">
			<div class="row">
				<div class="framefriendly">
					<div class="content">
						<br> <br>
						<div>
							<form id="idSearchForm"
								action="<c:url value='/GetOrUpdateOneEnv' />" class="black">
								??????????????????ID: <input type="text" name="envId"><input
									type="submit">
							</form>
						</div>
						<br>

						<hr>
						<div>
							<form action="<c:url value='/GetAllEnvs' />" class="black">
								?????????????????? <input type="submit" value="?????????" />
							</form>
						</div>
						<br>

						<hr class="roleAdmin">

						<div class="roleAdmin">
							<form action="<c:url value='/AddNewFriendlyEnv' />" method="get"
								class="black">
								?????????????????? <input type="submit" value="????????????" />
							</form>
						</div>
						<br class="roleAdmin">
						<hr>

						<div>
							<form action="<c:url value='/GetFilteredEnvs' />" method="get"
								class="black">
								<div>
									<strong><label>???????????????</label></strong>
								</div>
								<label>??????????????????????????????:</label> <select id="citySearch"
									name="citySearch">
									<option>?????????????????????</option>
									<option>?????????</option>
									<option>?????????</option>
									<option>?????????</option>
								</select> <br> <label>?????????????????????:</label> <input type="checkbox"
									name="animalTypes" value="???" />??? <input type="checkbox"
									name="animalTypes" value="???" />???

								<div>
									<input type="submit" value="????????????" />
								</div>

							</form>
						</div>
						<br>
						<hr>

					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- content -->

	<!--footer -->
	<c:choose>
		<c:when test="${userRole=='admin'}">
       		<%@include file="commons/backend_footer.jsp"%>
    	</c:when>

		<c:otherwise>
			<%@include file="commons/frontend_footer.jsp"%>
		</c:otherwise>
	</c:choose>

</body>

</html>