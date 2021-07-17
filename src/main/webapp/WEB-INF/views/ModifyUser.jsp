<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Favicon-->
<link rel="shortcut icon" href="../images/favicon1.ico">
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Author Meta -->
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="Petssion會員編輯">
<!-- Meta Keyword -->
<meta name="keywords" content="Pets, Dating">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>編輯個人資訊</title>

<!--imports-->
<%@include file="commons/frontend_imports.jsp"%>
<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

body {
	background: #fff281;
	color: #666666;
	/* 	font-family: "RobotoDraft", "Roboto", sans-serif; */
	font-size: 16px;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}

/* Container */
/* .container { */
/* 	position: relative; */
/* 	max-width: 900px; */
/* 	width: 100%; */
/* 	margin: 0 auto 100px; */
/* } */

.container.active .card:first-child {
	background: #f2f2f2;
	margin: 0 15px;
}

.container.active .card:nth-child(2) {
	background: #fafafa;
	margin: 0 10px;
}

/* Card */
.card {
	width:900px;
	position: relative;
	background: #ffffff;
	border-radius: 5px;
	padding: 60px 0 40px 0;
	box-sizing: border-box;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: 0.3s ease;
}

.card:first-child {
	width:880px;
	background: #fafafa;
	height: 10px;
	border-radius: 5px 5px 0 0;
	margin: 0 10px;
	padding: 0;
}

.card .title {
	position: relative;
	z-index: 1;
	border-left: 5px solid #ed5e25;
	margin: 0 0 35px;
	padding: 10px 0 10px 50px;
	color: #ed5e25;
	font-size: 32px;
	font-weight: 600;
	text-transform: uppercase;
}

.card .input-container, .card .ra1 {
	position: relative;
	margin: 0 60px 50px;
}

.card .input-container input {
	outline: none;
	z-index: 1;
	position: relative;
	background: none;
	width: 100%;
	height: 60px;
	border: 0;
	color: #212121;
	font-size: 24px;
	font-weight: 400;
}

.card .input-container input:focus ~ label {
	color: #9d9d9d;
	transform: translate(-12%, -50%) scale(0.9);
}

.card .input-container input:focus ~ .bar:before, .card .input-container input:focus 
	 ~ .bar:after {
	width: 50%;
}

.card .input-container input:valid ~ label {
	color: #9d9d9d;
	transform: translate(-12%, -50%) scale(0.75);
}

.card .input-container label {
	position: absolute;
	top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
	transition: 0.2s ease;
}

.card .ra1 label {
	/*  	position: absolute; */
	top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
}

.card .input-container .bar, .card .ra1 .bar {
	position: absolute;
	left: 0;
	bottom: 0;
	background: #757575;
	width: 100%;
	height: 1px;
}

.card .input-container .bar:before, .card .input-container .bar:after {
	content: "";
	position: absolute;
	background: #ed5e25;
	width: 0;
	height: 2px;
	transition: 0.2s ease;
}

.card .input-container .bar:before {
 	left: 50%;
}

.card .input-container .bar:after {
 	right: 50%;
}

.card .button-container {
	margin: 0 60px;
	text-align: center;
}

.card .button-container button {
	outline: 0;
	cursor: pointer;
	position: relative;
	display: inline-block;
	background: 0;
	width: 140px;
	border: 2px solid #e3e3e3;
	padding: 20px 0;
	font-size: 20px;
	font-weight: 600;
	line-height: 0.5;
	text-transform: uppercase;
	overflow: hidden;
	transition: 0.3s ease;
}

.card .button-container button span {
	position: relative;
	z-index: 1;
	color: #ddd;
	transition: 0.3s ease;
}

.card .button-container button:before {
	content: "";
	position: absolute;
	top: 50%;
	left: 50%;
	display: block;
	background: #ed5e25;
	width: 30px;
	height: 30px;
	border-radius: 100%;
	margin: -15px 0 0 -15px;
	opacity: 0;
	transition: 0.3s ease;
}

.card .button-container button:hover, .card .button-container button:active,
	.card .button-container button:focus {
	border-color: #ed5e25;
}

.card .button-container button:hover span, .card .button-container button:active span,
	.card .button-container button:focus span {
	color: #ed5e25;
}

.card .button-container button:active span, .card .button-container button:focus span
	{
	color: #ffffff;
}

.card .button-container button:active:before, .card .button-container button:focus:before
	{
	opacity: 1;
	transform: scale(10);
}

input[type="file"] {
	display: none;
}


.inlin {
display: flex;
justify-content:left;
align-items:center;
}

.sl1{
margin-bottom:8px;
}

.radio111 {
	margin-left: 8px;
}

.t1 img {
	/*      opacity:0 */
	
}

.a1 {
	top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
	margin: 0 60px 0;
}

.t1 td {
	border: 2px solid #ccc;
	width: 200px;
	height: 200px;
	padding: o;
}

.t1 {
	margin: auto;
}

.b1 {
	display: none;
}

.ffood_1 {
	width: auto;
	white-space: nowrap;
	display: inline;
	font-size: 20pxpx
}
#x1 {
	float: right;
}
</style>
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
					<h1 class="text-white">個人資料編輯</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='${header.referer}' />">上一頁</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="<c:url value='/' />user/memberCenter">個人資料</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- content -->
	<section class="post-content-area single-post-area"
		style="background-color: #fff281;">
		<div class="container" style="width:900px;">

			<div class="row">
				<!-- 				<div class="col-lg-8 posts-list"> -->
				<!-- 					<div class="single-post row"> -->
				<!-- 					<div class="col-lg-12"> -->
				<!-- 						======================================= -->
				<!--內容輸入在這-->
	<br>
<!-- 	<hr -->
<!-- 		style="width: 1400px; height: 3px; border: none; color: #ed5e25; background-color: #ed5e25;"> -->
	<br>

	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">個人檔案</h1>
			<form:form method="POST" modelAttribute="user"
				enctype="multipart/form-data" onSubmit="return CheckForm();" name="form1">
				<div class="a1">
					<label for="#{label}">圖片上傳:</label>
					</div>
				<table class="t1">
				<tr>
				
				<c:forEach var='userImg' items='${userImgIdMap[user.id]}' varStatus="loop">
					
					<td>
						<c:if test="${empty userImg}" >
							<label>
							<form:input type="file" path="img" targetID="preview_userImage${loop.count}" accept="image/gif, image/jpeg, image/png" onchange="readURL(this)"/>
							<img id="preview_userImage${loop.count}" src="<c:url value='/' />img/plus.png" width="200px"/>
							</label>
						</c:if>
						
						<c:if test="${not empty userImg}">
							
							<a href="<c:url value='/' />user/delPicture/${userImg}-${user.id}">
											<img  src="<c:url value='/' />img/x.png" width="23px" id="x1">
										</a>
							
							<label>
							<form:input id="fileInput" type="file" path="img" targetID="preview_userImage${loop.count}" targetID1="del${loop.count}" accept="image/gif, image/jpeg, image/png" onchange="readURL(this)"/>
							<img id="preview_userImage${loop.count}" src="<c:url value='/' />user/picture/${userImg}" width="200px"/>
							</label>
							
							<input id="del${loop.count}" name="delImgId" type="hidden"  value='${userImg}' />
						</c:if>
					</td>
					
					<c:if test="${loop.count % 4 == 0}" >
					<tr></tr>
					</c:if>
					
				</c:forEach>
				</tr>
				</table>
				<br>
				<br>
				<br>
				<br>
				<br>
<!-- 				=========================================================== -->
				<script type="text/javascript">
				function readURL(input){
					
					if(input.files && input.files[0]){
					    var imageTagID = input.getAttribute("targetID");
					    var imageTagID1 = input.getAttribute("targetID1");

					    var reader = new FileReader();

					    reader.onload = function (e) {

					       var img = document.getElementById(imageTagID);

					       img.setAttribute("src", e.target.result)
					       img.style.opacity=1

					    }

					    reader.readAsDataURL(input.files[0]);
					    
						var delId=document.getElementById(imageTagID1);
					    let str ="d";
					    let str1=delId.value;
					    console.log(str)
					    console.log(str1);
						delId.value=str+str1;
					    console.log(delId.value);
					  }
				}
				function CheckForm(){
				      if(confirm("確認更新個人資料嗎？")==true)   
				        return true;
				      else  
				        return false;
				    }
				
				$(function() {
					$("#datepicker").datepicker({
						dateFormat: "yy-mm-dd",
						showOtherMonths: true,
						maxDate: 0,
						monthNamesShort: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
						dayNamesMin: ['日','一','二','三','四','五','六'],
						changeMonth: true,
					      changeYear: true
					      
					    });
				});
				
				
				
				</script>
<!-- 			=========================================================== -->
				
<!-- 				<div class="input-container"> -->
<%-- 					<form:input path='email' type="#{type}" id="#{label}" /> --%>
<%-- 					<form:errors path="email" cssClass="error" /> --%>
<%-- 					<label for="#{label}">電子信箱:</label> --%>
<!-- 					<div class="bar"></div> -->
<!-- 				</div> -->
				
				<div class="input-container">
					<form:input path='name' type="#{type}" id="#{label}"
						required="required" autocomplete="off" />
					<form:errors path="name" cssClass="error" />
					<label for="#{label}">名字:</label>
					<div class="bar"></div>
				</div>
				<div class="ra1">
					<label for="#{label}">性別:</label>
					<form:radiobuttons path="gender" items="${genderMap}" class="radio111"/>
					<form:errors path="gender" cssClass="error" />
					<!-- 					<div class="bar"></div> -->
				</div>

				<div class="input-container">
					<form:input path='birthday' type="#{type}" name="birthday"
					id="datepicker"
						autocomplete="off" required="required" />
					<form:errors path="birthday" cssClass="error" />
					<label for="#{label}">生日:</label>
					<div class="bar"></div>
				</div>
				
				<div class="input-container" >
					<form:input path='address' type="#{type}" id="akacodedog"
						autocomplete="off" required="required" />
					<form:errors path="address" cssClass="error" />
 					<label for="#{label}">住址:</label>
					<div class="bar"></div>
				</div>
				
				<div class="input-container">
					<form:input path='constellation' type="#{type}" id="#{label}"
						autocomplete="off" required="required" />
					<form:errors path="constellation" cssClass="error" />
 					<label for="#{label}">星座:</label>
					<div class="bar"></div>
				</div>
				
				<div class="input-container">
					<form:input path='height' type="#{type}" id="#{label}"
						autocomplete="off" required="required" />
					<form:errors path="height" cssClass="error" />
					<label for="#{label}">身高:</label>
					<div class="bar"></div>
				</div>
				
				<div class="input-container">
					<form:input path='weight' type="#{type}" id="#{label}"
						autocomplete="off" required="required" />
					<form:errors path="weight" cssClass="error" />
					<label for="#{label}">體重:</label>
					<div class="bar"></div>
				</div>
				
				<div class="input-container">
					<form:input path='mobilephone' type="#{type}" id="#{label}"
						autocomplete="off" required="required" />
					<form:errors path="mobilephone" cssClass="error" />
					<label for="#{label}">行動電話:</label>
					<div class="bar"></div>
				</div>
				
				<div class="ra1">
					<label for="#{label}">工作:</label>
					<form:select path="job" name="s1"
						OnChange="Buildkey(this.selectedIndex);">
						<form:option label="請挑選" value="-1" />
						<form:options items="${jobList}" itemLabel='name' itemValue='id' />
					</form:select>
					<form:errors path="job" cssClass="error" />
				</div>
				
   				<div class="ra1">
    					<label for="#{label}">興趣:</label>
  					<form:checkboxes path="hobby" items="${hobbyList}" itemLabel="name" itemValue="id" class="radio111"/>
 				<form:errors path="hobby" cssClass="error" />
 									<div class="bar"></div>
 				</div>
				
				<div class="ra1">
				<label for="#{label}">自我介紹(小提示:內容愈有趣愈能增加配對機率唷!!):</label>
				<br>
					<form:textarea style="resize:none;width:360px;height:150px;" path='selfintroduction' type="#{textarea}" id="#{label}"
						autocomplete="off" />
					<form:errors path="selfintroduction" cssClass="error" />
					
<!-- 					<div class="bar"></div> -->
				</div>
				<div class="button-container">
					<button type="submit">
						<span>確認</span>
					</button>
				</div>
			</form:form>
		</div>
	</div>
				<!-- 					============================================================= -->
			</div>
		</div>
	</section>
	<!-- content -->

	<!--footer -->
	<%@include file="commons/frontend_footer.jsp"%>
</body>

</html>