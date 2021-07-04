<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>UpdatePet</title>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

body {
	background: #fff281;
	color: #666666;
	font-family: "RobotoDraft", "Roboto", sans-serif;
	font-size: 14px;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

/* Container */
.container {
	position: relative;
	max-width: 900px;
	width: 100%;
	margin: 0 auto 100px;
}

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
	position: relative;
	background: #ffffff;
	border-radius: 5px;
	padding: 60px 0 40px 0;
	box-sizing: border-box;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: 0.3s ease;
}

.card:first-child {
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

 .t1 img{ 
/*      opacity:0 */
 } 
.a1{
top: 0;
	left: 0;
	color: #757575;
	font-size: 16px;
	font-weight: 300;
	line-height: 60px;
	margin: 0 60px 0;
}
.t1 td{
border: 2px solid #ccc;
width: 200px;
height: 200px;
padding: o;

}
.t1{
margin: auto;
}
.b1{
display: none;
}
#x1{
float: right;
}
</style>
</head>
<body>
	<div style="text-align: center">
				<h1>寵物更新</h1>
			</div>
	<div align='center' style="font-size: 20px">
		<a href="<c:url value='${header.referer}' />">上一頁</a>&nbsp;&nbsp;<a href="<c:url value='/' />pet/showUserPets">寵物列表</a>&nbsp;&nbsp;<a href="<c:url value='/' />">回首頁</a>
	</div>
	<br>
	<hr
		style="width: 1400px; height: 3px; border: none; color: #ed5e25; background-color: #ed5e25;">
	<br>

	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">寵物檔案:${pet.name}</h1>
			<form:form method="POST" modelAttribute="pet"
				enctype="multipart/form-data" onSubmit="return CheckForm();" name="form1">
				<div class="a1">
					<label for="#{label}">圖片上傳:</label>
					</div>
				<table class="t1">
				<tr>
				<c:forEach var='petImg' items='${petImgIdMap[pet.id]}' varStatus="loop">
				
					<td>
						<c:if test="${empty petImg}" >
							<label>
							<form:input type="file" path="img" targetID="preview_petImage${loop.count}" accept="image/gif, image/jpeg, image/png" onchange="readURL(this)"/>
							<img id="preview_petImage${loop.count}" src="<c:url value='/' />img/plus.png" width="200px"/>
							</label>
						</c:if>
						
						<c:if test="${not empty petImg}">
							
							<a href="<c:url value='/' />pet/delPicture/${petImg}-${pet.id}">
											<img  src="<c:url value='/' />img/x.png" width="23px" id="x1">
										</a>
							
							<label>
							<form:input id="fileInput" type="file" path="img" targetID="preview_petImage${loop.count}" 
							targetID1="del${loop.count}" accept="image/gif, image/jpeg, image/png" onchange="readURL(this)"/>
							<img id="preview_petImage${loop.count}" src="<c:url value='/' />pet/picture/${petImg}" width="200px"/>
							</label>
							
							<input id="del${loop.count}" name="delImgId" type="hidden"  value='${petImg}' />
						</c:if>
					</td>
<!-- 					在4格後新增tr換列 -->
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
				      if(confirm("確認更新寵物資料嗎？")==true)   
				        return true;
				      else  
				        return false;
				    }
				</script>
<!-- 			=========================================================== -->

				<div class="input-container">
					<form:input path='name' type="#{type}" id="#{label}"
						required="required" autocomplete="off" />
					<form:errors path="name" cssClass="error" />
					<label for="#{label}">名字:</label>
					<div class="bar"></div>
				</div>
				<div class="ra1">
					<label for="#{label}">性別:</label>
					<form:radiobuttons path="gender" items="${genderMap}" />
					<form:errors path="gender" cssClass="error" />
					<!-- 					<div class="bar"></div> -->
				</div>

				<div class="input-container">
					<form:input path='age' type="#{type}" id="#{label}"
						autocomplete="off" required="required" />
					<form:errors path="age" cssClass="error" />
					<label for="#{label}">年齡:</label>
					<div class="bar"></div>
				</div>
				<div class="ra1">
					<label for="#{label}">種類:</label>
					<form:select path="type.id" name="s1"
						OnChange="Buildkey(this.selectedIndex);">
						<form:option label="請挑選" value="-1" />
						<form:options items="${typeList}" itemLabel='name' itemValue='id' />
					</form:select>
					<form:select path="kind.id" name="s2">
						<form:option label="請挑選" value="-1" />
						<form:options items="${kindList}" itemLabel="name" itemValue="id" />
					</form:select>
					<form:errors path="type" cssClass="error" />
					<form:errors path="kind" cssClass="error" />
				</div>

				<div class="ra1">
					<label for="#{label}">喜愛食物:</label>
					<form:radiobuttons path="food.id" items="${foodList}"
						itemLabel="name" itemValue="id" />
					<form:errors path="food" cssClass="error" />
					<!-- 					<div class="bar"></div> -->
				</div>

				<div class="ra1">
					<label for="#{label}">個性:</label>
					<form:radiobuttons path="personality.id" items="${personalityList}"
						itemLabel="name" itemValue="id" />
					<form:errors path="personality" cssClass="error" />
					<!-- 					<div class="bar"></div> -->
				</div>

				<div class="button-container">
					<button type="submit">
						<span>確認</span>
					</button>
					<!-- 					<input type='submit'> -->
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>