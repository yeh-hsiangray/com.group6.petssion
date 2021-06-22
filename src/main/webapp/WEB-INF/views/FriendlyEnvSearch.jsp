<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
名字: Gina
日期: 2021/05/01
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>友善搜尋</title>
<script>
	window.onload=function(){
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
					<h1 class="text-white">友善環境查詢</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span><a
							href="blog-home.html">友善環境查詢</a> <span
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
					<br>
					<div>
						<form id="idSearchForm" action="<c:url value='/GetOrUpdateOneEnv' />" class="black">
							查詢指定環境ID: <input type="text" name="envId"><input
								type="submit">
						</form>
					</div>
					<br>
					
					<hr>				
					<div>
						<form action="<c:url value='/GetAllEnvs' />" class="black">
							所有友善環境 <input type="submit" value="我想看" />
						</form>
					</div>
					<br>
					
					<hr class="roleAdmin">

					<div class="roleAdmin">
						<form action="<c:url value='/AddNewFriendlyEnv' />" method="get" class="black">
							新增友善餐廳 <input type="submit" value="我要新增" />
						</form>
					</div>
					<br class="roleAdmin"> 
					<hr>

					<div>
						<form action="<c:url value='/GetFilteredEnvs' />" method="get" class="black">
							<div>
								<strong><label>依條件查詢</label></strong>
							</div>
							<label>請選擇您想查詢的城市:</label> <select id="citySearch"
								name="citySearch">
								<option>請選擇查詢城市</option>
								<option>台北市</option>
								<option>台中市</option>
								<option>新竹市</option>
							</select> <br> <label>請選擇寵物類別:</label> <input type="checkbox"
								name="animalTypes" value="狗" />狗 <input type="checkbox"
								name="animalTypes" value="貓" />貓

							<div>
								<input type="submit" value="提交查詢" />
							</div>

						</form>
					</div>
					<br>
					<hr>

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
										onblur="this.placeholder = 'Enter Email Address '" required
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


	<!--  <script src="js/vendor/jquery-2.2.4.min.js"></script>-->
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

</body>
</html>
