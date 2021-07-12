<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 
名字: Gina
日期: 2021/05/01
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>All Friendly Environment</title>
<%@include file="commons/frontend_imports.jsp"%>
<script>
	window.onload = function() {
		let role = '${userRole}'
		checkRole()
		flashMsg()

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

		function flashMsg() {
			let msg = document.getElementById("msg")
			var millisecondsToWait = 1200;
			setTimeout(function() {
				msg.innerHTML = ""
			}, millisecondsToWait);
		}
	}
</script>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>

	<!--header -->
	<%@include file="commons/frontend_header.jsp"%>

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
	
	<!-- Start contact-page Area -->
	<section class="contact-page-area">
		 <!-- <div class="row"> -->
			<div class="framefriendly">
				<div class="content">
					<P id="msg" align="center"
						style="color: red; font-size: 20px; font-weight: bold; margin-top: 150px; background-color: white; opacity: 0.8; width: 500px; z-index: 999">${SUCCESS}</P>
					<br>
					<table border="1">
						<tr>
							<th>友善店家id</th>
							<th>城市</th>
							<th>店家名稱</th>
							<th>寵物種類</th>
							<th>環境類別</th>
							<th>電話</th>
							<th>地址</th>
							<th class="roleAdmin">更多資料</th>
							<th class="roleAdmin">刪除</th>
						</tr>
						<c:forEach items="${allEnvs}" begin="0" end="${allEnvs.size()}"
							var="env">
							<tr>
								<td>${env.envId}</td>
								<td>${env.city}</td>
								<td>${env.name}</td>
								<td>${env.animalTypes}</td>
								<td>${env.envTypes}</td>
								<td>${env.telephone}</td>
								<td>${env.address}</td>


								<td class="roleAdmin"><a
									href="<c:url value='/GetOrUpdateOneEnv?envId=${env.envId}' />"><button>詳細資料</button></a></td>

								<!-- You can't use a tag inside a tag -->
								<td class="roleAdmin"><c:url var="del_url"
										value="/DeleteFriendlyEnv/${env.envId}" /> <form:form
										action="${del_url}" method="POST">
										<input type="hidden" name="_method" value="DELETE">
										<button>刪除</button>
									</form:form></td>

							</tr>
						</c:forEach>
					</table>
					<br>
					<div>
						<div class="d-flex">
							<form class="roleAdmin"
								action="<c:url value='/FriendlyEnvSearch' />">
								<input type="submit" value="回寵物友善環境(b)">
							</form>
							<form class="roleGeneral"
								action="<c:url value='/FriendlyEnvSearchFR' />">
								<input type="submit" value="回寵物友善環境(f)">
							</form>
						</div>
						<br>
					</div>
				</div>

			</div>
		<!-- </div> -->
	</section>
	<!-- End contact-page Area -->
	
	
	<!--footer -->
	<%@include file="commons/frontend_footer.jsp"%>

</body>
</html>