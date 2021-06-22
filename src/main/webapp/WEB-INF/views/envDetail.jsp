<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
名字: Gina
日期: 2021/05/01
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${envDetail.name}</title>
<link href="resources/friendlyStyle.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(document).ready(function(event) {
		//let intervalPlay;
		checkRole();

		$("#editBtn").click(function(e) {
			editNow(e);
		});

		function editNow() {
			console.log("Editing...");
			document.getElementById("readOnly").removeAttribute("disabled");
		}
		;

		document.getElementById('chosenFile').onchange = function(evt) {
			var tgt = evt.target || window.event.srcElement, files = tgt.files;

			// FileReader support
			if (FileReader && files && files.length) {
				var fr = new FileReader();
				fr.onload = function() {
					let myImage = document.getElementById("myimage");
					let newImgFig = document.getElementById("newImgFig");
					myImage.src = fr.result;
					myImage.style.width = "200px";
					myImage.style.height = "150px";
					newImgFig.hidden = false;
					newImgFig.style.marginLeft = "10px";
				}
				fr.readAsDataURL(files[0]);
			}
			// Not supported
			else {
				alert("The file uploaded is not supported");
			}
		}

		function checkRole() {
			let role = '${userRole}'
			if (role == "admin") {
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

	});
</script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
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
					<h1 class="text-white">友善環境資料</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span><a
							href="blog-home.html">友善環境資料</a> <span
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
			<div class="framefriendly black">
				<div class="content">
					<br>
					<form:form method="post" id="addNewEnv" class="black"
						modelAttribute="friendlyEnvU" enctype="multipart/form-data">
						<fieldset id="readOnly" disabled="disabled">
							<label>所在城市:</label>
							<form:select id="city" path="city">
								<option ${cityTP}>台北市</option>
								<option ${cityTC}>台中市</option>
								<option ${cityHZ}>新竹市</option>
							</form:select>
							<br> <label>名稱:</label>
							<form:input type="text" path="name" />
							<br> <label>請選擇寵物類別:</label>
							<form:checkbox path="animalTypesArr" value="狗" />
							狗
							<form:checkbox path="animalTypesArr" value="貓" />
							貓 <br> <label>環境類別:</label>
							<form:radiobutton path="envTypes" value="寵物住宿" />
							寵物住宿
							<form:radiobutton path="envTypes" value="寵物餐廳" />
							寵物餐廳
							<form:radiobutton path="envTypes" value="寵物美容" />
							寵物美容 <br> <label>電話:</label>
							<form:input type="text" path="telephone" />
							<br> <label>地址:</label>
							<form:input type="text" path="address" size="38" />
							<br>
							<form:input class="roleAdmin" id="chosenFile"
								path="friendlyEnvImage" type="file" />
							<form:errors path="friendlyEnvImage" cssClass="error" />
							<div class="d-flex">
								<figure>
									<img src="data:image/jpg;base64,${photo}" width="200"
										height="150" />
									<figcaption class="roleAdmin">原始圖檔</figcaption>
								</figure>
								<figure id="newImgFig" hidden="true">
									<img id="myimage">
									<figcaption>更新圖檔</figcaption>
								</figure>
							</div>
							<div class="roleAdmin">
								<input type="submit" value="確定修改" />
							</div>
						</fieldset>
					</form:form>
					<br>
					<div>
						<button id="editBtn" class="roleAdmin">編輯資料</button>
					</div>

					<br>
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

				<div>
					<iframe width="650" height="380"
						style="border: 2px solid teal; border-radius: 15px; margin: 15px 15px 0px 100px"
						src="https://www.google.com/maps/embed/v1/place?key=AIzaSyD4kryss150V0AlcYltoIxQ251pM5Q6Cao&q=${envDetail.address}">
					</iframe>
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


	<script src="js/vendor/jquery-2.2.4.min.js"></script>
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