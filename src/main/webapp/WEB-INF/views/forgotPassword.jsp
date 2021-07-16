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
<title>>登入</title>

<!--imports-->
<%@include file="commons/frontend_imports.jsp"%>
<style type="text/css">
.t1 {
	text-align: center;
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
					<h1 class="text-white">${tag}</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='/signIn/forgotPassword'/>">忘記密碼</a>
					</p>
					<a href="<c:url value='/'/>" id="index"></a>
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
						<div class="col-lg-12">
						<c:choose>
	<c:when test="${account!=null}">
	<form action='<c:url value="/signIn/password"></c:url>' method="POST">
	<input type="hidden" name="account" value="${account}">
    <table>
        <tr>
            <td>密碼:</td>
            <td><input type="password" name="password" id="psd"></td>
            <td id="psdMsg"></td>
        </tr>
        <tr>
            <td>確認密碼:</td>
            <td><input type="password" name="passwordcheck" id="psdc"></td>
            <td id="psdcMsg"></td>
        </tr>
        <tr>
            <td><button type="submit" id="sub" disabled="true">送出</button></td>
            <td><button type="button" id="fast">快速完成</button></td>
        </tr>
    </table>
    </form>
    <script>
            let checked = [false, false]
            let psd = document.getElementById("psd");
            psd.onkeyup = psdCheck;
            function psdCheck() {
            	psdcCheck()
                t1 = /^[A-Za-z0-9]{6,12}$/;
                let psdv = psd.value;
                let psdMsg = document.getElementById("psdMsg");
                if (t1.test(psdv)) {
                    psdMsg.innerHTML = "正確"
                    console.log("hi")
                    checked[0] = true
                } else {
                    psdMsg.innerHTML = "請輸入6~12位英文及數字"
                    checked[0] = false
                }
                check();
            }
            console.log("hi")
            let psdc = document.getElementById("psdc");
            psdc.onkeyup = psdcCheck;
            function psdcCheck() {
                let psdv = psd.value;
                let psdcv = psdc.value;
                let psdcMsg = document.getElementById("psdcMsg");
                if (psdv == psdcv) {
                    psdcMsg.innerHTML = "正確"
                    checked[1] = true
                } else {
                    psdcMsg.innerHTML = "請輸入正確密碼"
                    checked[1] = false
                }
                check();
            }
            document.getElementById("fast").onclick = function () {
                psd.value = "mb121234"
                psdCheck()
                psdc.value = "mb121234"
                psdcCheck()
            }
            function check() {
                let checkint = 0
                for (i = 0; i < checked.length; i++) {
                    if (checked[i]) {
                    	
                        checkint++;
                    	console.log(checkint)
                    	console.log(checked[i])
                    }
                }
                if (checkint == checked.length) {
                    document.getElementById("sub").disabled = false;
                } else {
                    document.getElementById("sub").disabled = true;
                }
            }
    </script>
  
    </c:when>
    <c:otherwise>
      <table>
        <tr>
            <td>帳號:</td>
            <td><input type="text" id="account" /></td>
        </tr>
        <tr>
            <td>信箱:</td>
            <td><input type="text" id="email" /></td>
            <td id="emailMsg"></td>
        </tr>
        <tr>
            <td colspan=2 style="text-align: center;"><button type="button" id="fast">快速完成</button><button type="button" id="submit">送出</button></td>
            <td></td>
        </tr>
        <tr>
            <td colspan=2 style="text-align: center;" id="msg"></td>
            <td></td>
        </tr>
    </table>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let submit = document.getElementById("submit");
            submit.onclick = Check;
            act=document.getElementById("account");
            msg=document.getElementById("msg");
            function Check() {
                	let data={account:act.value,
                			forgoteEmail:email.value}
                    fetch("forgotPassword",{method:"POST",body:JSON.stringify(data),headers:{"Content-Type":"application/json"}}).
                    then(res => res.json()).then
                    (function(data){
                		 if(data==1){
                			msg.innerHTML = "請確認帳號與信箱正確"
                		 }else if(data==0){
                            msg.innerHTML = "信件已送出 請至E-Mail收件"
                		 }else{
                            msg.innerHTML = "預期外錯誤 請聯絡管理員"
                         }
                    })
                
            }
            let email = document.getElementById("email");
            email.onkeyup = emailCheck;
            function emailCheck() {
                let emailv = email.value;
                emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                let emailMsg = document.getElementById("emailMsg");
                if (emailRule.test(emailv)) {
                } else {
                    emailMsg.innerHTML = "請輸入正確email格式" 
                };
 
                
            }

            document.getElementById("fast").onclick = function () {
                act.value = "testqq1"
                email.value = "nolof35544@nhmty.com"
                emailCheck()
            }
            })
    </script>
    </c:otherwise>
   </c:choose>
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