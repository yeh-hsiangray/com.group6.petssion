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
<script>
	window.onload = function() {
		let role = '${userRole}'

		checkRole()

		function checkRole() {
			let role = '${userRole}'
			if (role == "admin") {
				alert("it's role admin")
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
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--CSS============================================= -->
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
	<header id="header" id="home">
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="img/logo.png" height="40px"
						alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.html">首頁</a></li>
						<li><a href="about.html">會員中心</a></li>
						<li><a href="courses.html">地圖交友</a></li>
						<li><a href="events.html">興趣交友</a></li>
						<li><a href="gallery.html">友善環境</a></li>
						<li class="menu-has-children"><a href="">部落格</a>
							<ul>
								<li><a href="blog-home.html">部落格主頁</a></li>
								<li><a href="blog-single.html">部落格分頁</a></li>
							</ul></li>
						<li class="menu-has-children"><a href="">會員制度</a>
							<ul>
								<li><a href="course-details.html">普通會員</a></li>
								<li><a href="event-details.html">付費會員</a></li>
							</ul></li>
						<li><a href="contact.html">聯絡我們</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- #header -->
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">友善環境列表</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span><a
							href="blog-home.html">友善環境列表</a> <span
							class="lnr lnr-arrow-right"></span> <a href="blog-single.html">查詢首頁</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start contact-page Area -->
	<section class="contact-page-area">
		<div class="row">
			<div class="framefriendly">
				<div class="content">
					<P id="msg" align="center"
						style="color: red; font-size: 20px; font-weight: bold; margin-top: 10px">${SUCCESS}</P>
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
		</div>
	</section>
	<!-- End contact-page Area -->

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>快速連結</h4>
						<ul>
							<li><a href="#">註冊登錄</a></li>
							<li><a href="#">交友配對</a></li>
							<li><a href="#">地圖交友</a></li>
							<li><a href="#">會員制度</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>購物車</h4>
						<ul>
							<li><a href="#">寵物食品</a></li>
							<li><a href="#">寵物用品</a></li>
							<li><a href="#">寵物寢具</a></li>
							<li><a href="#">外出用具</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>相關資訊</h4>
						<ul>
							<li><a href="#">友善餐廳</a></li>
							<li><a href="#">友善環境</a></li>
							<li><a href="#">寵物專欄</a></li>
							<li><a href="#">寵物新知</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>與我們聯絡</h4>
						<ul>
							<li><a href="#">求職登錄</a></li>
							<li><a href="#">廠商聯絡</a></li>
							<li><a href="#">問題反應</a></li>
							<li><a href="#">申訴購物</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>最新消息</h4>
						<p>敬請隨時關注</p>
						<div class="" id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get">
								<div class="input-group">
									<input type="text" class="form-control" name="EMAIL"
										placeholder="請輸入你的電子郵件" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Email Address '" 
										type="email">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<span class="lnr lnr-arrow-right"></span>
										</button>
									</div>
									<div class="info"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div
				class="footer-bottom row align-items-center justify-content-between">
				<p class="footer-text m-0 col-lg-6 col-md-12">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | Made with <i class="fa fa-heart-o"
						aria-hidden="true"></i> by <a href="#" target="_blank">Dixon
						Liao</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-6 col-sm-12 footer-social">
					<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-dribbble"></i></a> <a href="#"><i
						class="fa fa-behance"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->


	<!-- <script src="js/vendor/jquery-2.2.4.min.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.tabs.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>





	<div class="banner">
		<img src="resources/images/logo.png" class="mylogo" alt="Petssion"
			title="logo" />
	</div>

	<br>


</body>
</html>