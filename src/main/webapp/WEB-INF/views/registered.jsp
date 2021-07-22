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
            	document.getElementById("sub").disabled = true;
                t1 = /^[A-Za-z0-9]{6,12}$/;
                let actv = act.value;
                let actMsg = document.getElementById("actMsg");
                if (t1.test(actv)) {
                    actMsg.innerHTML = "正確"
                    checked[0] = true
                } else {
                    actMsg.innerHTML = "請輸入6~12位英文及數字"
                    checked[0] = false
                }
                check();
                if(checked[0]){
                	checked[0] = false
                	check();
                	let data={account:act.value}
                    fetch("registered/act",{method:"POST",body:JSON.stringify(data),headers:{"Content-Type":"application/json"}}).
                    then(res => res.json()).then
                    (function(data){
                		 if(data==1){
                			actMsg.innerHTML = "此帳號已被使用"
                				check();
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
            	document.getElementById("sub").disabled = true;
            	psdcCheck();
                t1 = /^[A-Za-z0-9]{6,12}$/;
                let psdv = psd.value;
                let psdMsg = document.getElementById("psdMsg");
                if (t1.test(psdv)) {
                    psdMsg.innerHTML = "正確"
                    checked[1] = true
                } else {
                    psdMsg.innerHTML = "請輸入6~12位英文及數字"
                    checked[1] = false
                }
                check();
            }

            let psdc = document.getElementById("psdc");
            psdc.onkeyup = psdcCheck;
            function psdcCheck() {
            	document.getElementById("sub").disabled = true;
                let psdv = psd.value;
                let psdcv = psdc.value;
                let psdcMsg = document.getElementById("psdcMsg");
                if (psdv == psdcv) {
                	if(psdv!=""){
                    psdcMsg.innerHTML = "正確"}
                    checked[2] = true
                } else {
                	if(psdv!=""){
                    psdcMsg.innerHTML = "請輸入正確密碼"}
                    checked[2] = false
                }
                check();
            }
            let name = document.getElementById("name");
            name.onkeyup = nameCheck;
            function nameCheck() {
            	document.getElementById("sub").disabled = true;
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
            	document.getElementById("sub").disabled = true;
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
            	document.getElementById("sub").disabled = true;
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
                act.value = "test12345"
                actCheck()
                psd.value = "mbxx1234"
                psdCheck()
                psdc.value = "mbxx1234"
                psdcCheck()
                name.value = "王小明"
                nameCheck()
                email.value = "gojeso5001@ovooovo.com"
                emailCheck()
                mobilephone.value = "0988456456"
                mobilephoneCheck()
            }

            function check() {
                let checkint = 0
                for (i = 0; i < 6; i++) {
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
margin-left: 155px;
}
.dv1{
padding: 10px;
padding-left: 210px;
font-size: 18px;
}
span{
font-size: 16px;
color: red;
margin-left:340px;
/* position: absolute; */
float: right;
margin-top: -30px;
text-align: left;
}
.dv1 input{
float: right;
margin-right: 205px;
}
.dv2{
float: left;
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
					<a href="<c:url value='/registered' />"><h1 class="text-white">註冊</h1></a>
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
							<form action="registered" method="POST" class="d1" >
									<div style="border: 3px solid 	#FFB630;border-radius: 10px;background-color:#FFFAF2;
						box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); height: 500px;width: 800px;padding: 20px;">
									<br>
									<br>
									<div class="dv1">
										<label>帳號:</label>
										<input type="text" name="account" id="act">
										<div class="dv2"><span id="actMsg"></span></div>
									</div>
									<div class="dv1">
										<label>密碼:</label>
										<input type="password" name="password" id="psd">
										<div class="dv2"><span id="psdMsg"></span></div>
									</div>
									<div class="dv1">
										<label>確認密碼:</label>
										<input type="password" name="passwordcheck" id="psdc">
										<div class="dv2"><span id="psdcMsg"></span></div>
									</div>
									<div class="dv1">
										<label>姓名:</label>
										<input type="text" name="name" id="name">
										<div class="dv2"><span id="nameMsg"></span></div>
									</div>
									<div class="dv1">
										<label>e-mail:</label>
										<input type="text" name="email" id="email">
										<div class="dv2"><span id="emailMsg"></span></div>
									</div>
									<div class="dv1">
										<label>手機:</label>
										<input type="text" name="mobilephone"
											id="mobilephone">
											<div class="dv2"><span id="mobilephoneMsg"></span></div>
									</div>
									<div  class="dv1" style="padding-left: 305px;">
										<button type="submit" id="sub" disabled="true">送出</button>
										<button type="button" id="fast">快速完成</button>
									</div>
									</div>
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