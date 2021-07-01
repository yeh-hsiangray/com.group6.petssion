<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>會員資訊</title>
<script type="text/JavaScript">
	window.onload = function() {
		let AutoFill = document.getElementById("AutoFill");
		AutoFill.onclick = function() {
			document.getElementById("username").value = "張偉士";
			document.getElementById("gender").checked = true;
			document.getElementById("birthday").value = "Hello World!";
			document.getElementById("address").value = "新北市中和區中板路25巷4號";
			document.getElementById("constellation").value = "牡羊座";
			document.getElementById("height").value = "172";
			document.getElementById("weight").value = "66";
			document.getElementById("mobilephone").value = "0922333510";
			document.getElementById("selfintroduction").value = "我最近改名叫張偉士，請多多指教";
			document.getElementById("email").value = "a42365@gmail.com";
		}

		document.getElementById('chosenFile').onchange = function(evt) {
			var tgt = evt.target || window.event.srcElement, files = tgt.files;

			// FileReader support
			if (FileReader && files && files.length) {
				var fr = new FileReader();
				fr.onload = function() {
					document.getElementById("myimage").src = fr.result;
				}
				fr.readAsDataURL(files[0]);
			}
			// Not supported
			else {
				alert("The file uploaded is not supported");
			}
		}
	};
</script>
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
						<a href="<c:url value='/frontend/blog/index'/>">會員中心</a> <span
							class="lnr lnr-arrow-right"></span><a
							href="<c:url value='/frontend/member/ViewMember'/>">會員資訊</a> <span
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

						<div class="container" style="max-width: 600px; margin-top: 50px">
							<h3 class="page-header">會員資訊</h3>
							<div class="well">
								<form action="#" method="post">
									<div class="form-group">
										<label for="usernameId">姓名</label> <input type="text"
											name="name" id="username" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="usernameId">姓別</label> <input type="text"
											name="name" id="gender" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="usernameId">生日</label> <input type="text"
											name="name" id="birthday" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="usernameId">住址</label> <input type="text"
											name="name" id="address" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="usernameId">星座</label> <input type="text"
											name="name" id="constellation" class="form-control">
									</div>
									
									
									
									<div class="form-group">
										<label for="usernameId">身高</label> <input type="text"
											name="name" id="height" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="usernameId">體重</label> <input type="text"
											name="name" id="weight" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="phoneId">手機號碼</label> <input type="text"
											name="mobilephone" id="mobilephone" class="form-control">
									</div>
									
									<div class="form-group">
										<label for="usernameId">自我介紹</label> <input type="text"
											name="name" id="selfintroduction" class="form-control">
									</div>
									
									
									<div class="form-group">
										<label for="emailId">電子郵件</label> <input type="text"
											name="email" id="email" class="form-control">
									</div>
									
									<p class="text-center">
										<button type="submit" class="btn btn-primary">提交</button>
										<button class="btn btn-primary" id="oneKeyFillIn">一鍵輸入</button>
									</p>
								</form>
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