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
<title>登入</title>

<!--imports-->
<%@include file="commons/frontend_imports.jsp"%>
<style type="text/css">
.t1 {
	text-align: center;
}
.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}
.d1{
margin-left: 395px;
}
</style>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
					<a href="<c:url value='/signIn'/>"><h1 class="text-white">登入</h1></a>
<!-- 					<p class="text-white link-nav"> -->
<!-- 					</p> -->
					<a href="<c:url value='/'/>" id="index"></a>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- content -->
	<section class="post-content-area single-post-area" style="background-color: #fff281;">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12"></div>

						<div class="d1" style="border: 2px solid #FFB630;border-radius: 10px; padding: 20px;background-color:#FFFAF2;
						box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); height: 350px;">
							<table style="border-collapse:separate; border-spacing:0px 10px;font-size: 18px;">
								<tr>
									<td>帳號:</td>
									<td><input type="text" name="account" id="act"></td>
								</tr>
								<tr>
									<td>密碼:</td>
									<td><input type="password" name="password" id="pwd"></td>
								</tr>
								<tr>
									<td colspan=2 class="t1">
										<div class="g-recaptcha"
											data-sitekey="6LcvlogbAAAAAKC52gmYL6PG_gdRnM2KbtXOOeaQ"
											data-theme="light" data-size="normal"
											data-callback="verifyCallback"
											data-expired-callback="expired"
											data-error-callback="checkerror"></div>
									</td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align: left;"><input type="checkbox"
										id="remember">記住我</td>
									<td style="text-align: right;"><a
										href="<c:url value='/signIn/forgotPassword'/>">忘記密碼</a></td>
								</tr>
								<tr>
									<td colspan=2 class="t1"><button type="button" id="submit">登入</button><button type="button" id="fast">快速完成</button></td>
									<td></td>
								</tr>
								<tr>
									<td colspan=2 class="t1" id="signInMsg"></td>
									<td></td>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- content -->
	<script>
            let submit = document.getElementById("submit");
                let act = document.getElementById("act");
                let pwd = document.getElementById("pwd");
                let signInMsg = document.getElementById("signInMsg");
                let remember= document.getElementById("remember");
                let check = true;
                submit.onclick = submitCheck;
                function verifyCallback(token){
                    check=false;
                }
                function checkerror(){
                    check=true;
                    signInMsg.innerHTML="機器人驗證失敗 請重新嘗試"
                }
                function expired(){
                    check=true;
                    signInMsg.innerHTML="機器人驗證超時 請重新嘗試"
                }
            submit.onclick = submitCheck;
            function submitCheck() {
            	 if(check){
                     signInMsg.innerHTML="請完成我不是機器人驗證"
                     return
                 }
                let data = { account: act.value ,
                             password:pwd.value,
                             remember:remember.checked}
                fetch("signIn", { method: "POST", body: JSON.stringify(data), headers: { "Content-Type": "application/json" } }).
                    then(res => res.json()).then
                    (function (data) {
                        if (data == 0) {
                            signInMsg.innerHTML = "帳號或密碼錯誤"
                        }else if(data == 2) {
                            signInMsg.innerHTML = "此帳號被停權"
                        }else if(data == 1){
                        	window.location.href=document.getElementById("index").href;
                        }else if(data == 3){
                        	signInMsg.innerHTML = "請先驗證信箱"
                        }else{
                        	signInMsg.innerHTML = "非預期錯誤 請聯絡管理人員"
                        }
                    })
            }
            document.getElementById("fast").onclick = function () {
                act.value = "test1234"
                pwd.value = "mbxx1234"
              
            }
    </script>

	<!--footer -->
	<%@include file="commons/frontend_footer.jsp"%>
</body>

</html>