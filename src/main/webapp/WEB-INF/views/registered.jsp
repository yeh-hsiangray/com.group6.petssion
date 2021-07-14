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
<title>註冊</title>

<!--imports-->
<%@include file="commons/frontend_imports.jsp"%>
<script>
        document.addEventListener("DOMContentLoaded", function () {
            let act = document.getElementById("act");
            let checked = [false, false, false, false, false, false]
            act.onkeyup = actCheck;
            function actCheck() {
                t1 = /^[A-Za-z0-9]{6,8}$/;
                let actv = act.value;
                let actMsg = document.getElementById("actMsg");
                if (t1.test(actv)) {
                    actMsg.innerHTML = "正確"
                    checked[0] = true
                } else {
                    actMsg.innerHTML = "請輸入6~8位英文及數字"
                    checked[0] = false
                }
                if(checked[0]){
                	checked[0] = false
                	let data={account:act.value}
                    fetch("registered/act",{method:"POST",body:JSON.stringify(data),headers:{"Content-Type":"application/json"}}).
                    then(res => res.json()).then
                    (function(data){
                    	console.log("yes")
                		 if(data==1){
                			actMsg.innerHTML = "此帳號已被使用"
                		 }else{
                			 checked[0] = true
				             check();
                		 }
                    })
                }
            }
            let psd = document.getElementById("psd");
            psd.onkeyup = psdCheck;
            function psdCheck() {
                t1 = /^[A-Za-z0-9]{6,8}$/;
                let psdv = psd.value;
                let psdMsg = document.getElementById("psdMsg");
                if (t1.test(psdv)) {
                    psdMsg.innerHTML = "正確"
                    checked[1] = true
                } else {
                    psdMsg.innerHTML = "請輸入6~8位英文及數字"
                    checked[1] = false
                }
                check();
            }

            let psdc = document.getElementById("psdc");
            psdc.onkeyup = psdcCheck;
            function psdcCheck() {
                let psdv = psd.value;
                let psdcv = psdc.value;
                let psdcMsg = document.getElementById("psdcMsg");
                if (psdv == psdcv) {
                    psdcMsg.innerHTML = "正確"
                    checked[2] = true
                } else {
                    psdcMsg.innerHTML = "請輸入正確密碼"
                    checked[2] = false
                }
                check();
            }
            let name = document.getElementById("name");
            name.onkeyup = nameCheck;
            function nameCheck() {
                let namev = name.value;
                t1 = /^[A-Za-z0-9\u4e00-\u9fa5]{2,10}$/;
                let nameMsg = document.getElementById("nameMsg");
                if (t1.test(namev)) {
                    nameMsg.innerHTML = "正確"
                    checked[3] = true
                } else {
                    nameMsg.innerHTML = "請輸入2位以上英文數字或中文"
                    checked[3] = false
                }
                check();
            }
            let email = document.getElementById("email");
            email.onkeyup = emailCheck;
            function emailCheck() {
                let emailv = email.value;
                emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                let psdcMsg = document.getElementById("psdcMsg");
                if (emailRule.test(emailv)) {
                    emailMsg.innerHTML = "正確"
                    checked[4] = true
                } else {
                    emailMsg.innerHTML = "請輸入正確email格式"
                    checked[4] = false
                };
 				if(checked[4]){
 					checked[4] = false
                	let data={email:email.value};
                    fetch("registered/email",{method:"POST",body:JSON.stringify(data),headers:{"Content-Type":"application/json"}}).
                    then(res => res.json()).then
                    (function(data){
                		 if(data==1){
                			emailMsg.innerHTML = "此信箱已被使用";
                		 }else{checked[4] = true;
				                check();
                		 };
                    })
                }
            }

            let mobilephone = document.getElementById("mobilephone");
            mobilephone.onkeyup = mobilephoneCheck;
            function mobilephoneCheck() {
                let mobilephonev = mobilephone.value;
                phoneRule = /^09[0-9]{8}$/;
                let mobilephoneMsg = document.getElementById("mobilephoneMsg");
                if (phoneRule.test(mobilephonev)) {
                    mobilephoneMsg.innerHTML = "正確"
                    checked[5] = true
                } else {
                    mobilephoneMsg.innerHTML = "請輸入正確手機號碼"
                    checked[5] = false
                }
                check();
            }
            document.getElementById("fast").onclick = function () {
                act.value = "testqq1"
                actCheck()
                psd.value = "mbxx1234"
                psdCheck()
                psdc.value = "mbxx1234"
                psdcCheck()
                name.value = "王小明"
                nameCheck()
                email.value = "test@gmail.com"
                emailCheck()
                mobilephone.value = "0988456456"
                mobilephoneCheck()
            }

            function check() {
                let checkint = 0
                for (i = 0; i < 6; i++) {
                	 console.log(checked[i])
                	 console.log("--------")
                    if (checked[i]) {
                        checkint++;
                    }
                }
                console.log(checkint)
                if (checkint == 6) {
                    document.getElementById("sub").disabled = false;
                } else {
                    document.getElementById("sub").disabled = true;
                }
            }
        })
    </script>
<style type="text/css">
.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}
.d1{
margin-left: 365px;
}
</style>
<body>

	<!--header -->
	<%@include file="commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">

				<div class="about-content col-lg-12">
					<a href="<c:url value='/signIn'/>"><h1 class="text-white">註冊</h1></a>
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
						<div class="col-lg-12">
							<form action="registered" method="POST" class="d1" style="border: 1px solid rgba(0, 0, 0, 0.2);border-radius: 10px; padding: 20px;background-color:white;
						box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); height: 400px;width: 400px;">
								<table style="border-collapse:separate; border-spacing:0px 10px;margin: auto;font-size: 18px;">
									<tr>
										<td>帳號:</td>
										<td><input type="text" name="account" id="act"></td>
										<td id="actMsg"></td>
									</tr>
									<tr>
										<td>密碼:</td>
										<td><input type="password" name="password" id="psd"></td>
										<td id="psdMsg"></td>
									</tr>
									<tr>
										<td>確認密碼:&nbsp;&nbsp;&nbsp;</td>
										<td><input type="password" name="passwordcheck" id="psdc"></td>
										<td id="psdcMsg"></td>
									</tr>
									<tr>
										<td>姓名:</td>
										<td><input type="text" name="name" id="name"></td>
										<td id="nameMsg"></td>
									</tr>
									<tr>
										<td>e-mail:</td>
										<td><input type="text" name="email" id="email"></td>
										<td id="emailMsg"></td>
									</tr>
									<tr>
										<td>手機:</td>
										<td><input type="text" name="mobilephone"
											id="mobilephone"></td>
										<td id="mobilephoneMsg"></td>
									</tr>
									<tr style="text-align: center;">
										<td><button type="submit" id="sub" disabled="true">送出</button></td>
										<td><button type="button" id="fast">快速完成</button></td>
									</tr>
								</table>
							</form>

						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- content -->


	<!--footer -->
	<%@include file="commons/frontend_footer.jsp"%>
</body>

</html>