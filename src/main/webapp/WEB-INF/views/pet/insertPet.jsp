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
<title>Insert title here</title>
<style type="text/css">

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
	max-width: 600px;
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
	/* Title */
	/* Inputs */
	/* Button */
	/* Footer */
	/* Alt Card */
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

.card .input-container input:focus ~ label{
	color: #9d9d9d;
	transform: translate(-12%, -50%) scale(0.9);
}

.card .input-container input:focus ~ .bar:before, .card .input-container input:focus 
	 ~ .bar:after{
	width: 50%;
}

.card .input-container input:valid ~ label {
	color: #9d9d9d;
	transform: translate(-12%, -50%) scale(0.75);
}

.card .input-container label{
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

.card .input-container .bar:before, .card .input-container .bar:after{
	content: "";
	position: absolute;
	background: #ed5e25;
	width: 0;
	height: 2px;
	transition: 0.2s ease;
}

.card .input-container .bar:before{
	left: 50%;
}

.card .input-container .bar:after{
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
</style>
</head>
<body>
	<!-- <div class="pen-title">
		<h1>寵物資料</h1>
	</div> -->
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">寵物檔案</h1>
			<form:form method="POST" modelAttribute="pet"
				enctype="multipart/form-data">
				<div class="input-container">
					<form:input path='name' type="#{type}" id="#{label}"
						required="required" autocomplete="off" />
					<form:errors path='name' cssClass="error" />
					<label for="#{label}">名字</label>
					<div class="bar"></div>
				</div>
				<div class="ra1">
					<label for="#{label}">性別:</label>
					<form:radiobuttons path="gender" items="${genderMap}"/>
					<form:errors path='gender' cssClass="error" />
					<div class="bar"></div>
				</div>
			
                <div class="input-container">
					<form:input path='age' type="#{type}" id="#{label}" autocomplete="off" required="required"/>
					<form:errors path='age' cssClass="error" />
					<label for="#{label}">年齡</label>
					<div class="bar"></div>
				</div>

				<div class="ra1">
					<label for="#{label}">種類:</label>
					<form:select path="type.id">
						<form:option label="請挑選" value="-1" />
						<form:options items="${typeList}" itemLabel='name' itemValue='id' />
					</form:select>
					<form:select path="kind.id">
						<form:option label="請挑選" value="-1" />
						<form:options items="${kindList}" itemLabel="name" itemValue="id"/>
					</form:select>
					<form:errors path="kind" cssClass="error" />
					<div class="bar"></div>
				</div>

				<div class="ra1">
					<label for="#{label}">喜愛食物:</label><br>
						<form:radiobuttons path="food.id" items="${foodList}"
						itemLabel="name" itemValue="id"/>
					<form:errors path="food" cssClass="error" />
					<div class="bar"></div>
				</div>

				<div class="ra1">
					<label for="#{label}">個性:</label><br>
					<form:radiobuttons path="personality.id" items="${personalityList}"
						itemLabel="name" itemValue="id"/>
					<form:errors path="food" cssClass="error" />
					<div class="bar"></div>
				</div>

				<div class="button-container">
					<button>
						<span>確認</span>
					</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>