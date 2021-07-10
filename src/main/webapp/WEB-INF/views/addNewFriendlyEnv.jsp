<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增友善餐廳</title>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/JavaScript">
	window.onload = function() {
		var cityInput = document.getElementById("city");
		var nameInput = document.getElementById("name");
		var animalTypes = document.getElementsByName("animalTypes")
		var radioBtns = document.querySelectorAll("[id*='envTypes'][type='radio']");
		var dogTypeCB = document.getElementById("dogType");
		var envTypes1 = document.getElementById("envTypes1");
		var phoneInput = document.getElementById("phone");
		var addInput = document.getElementById("add");
		/* var catTypeCB = document.getElementById("catType"); */
		dogTypeCB.checked=true;
		envTypes1.checked=true;
		
		let oneKeyFillIn = document.getElementById("oneKeyFillIn");
		oneKeyFillIn.onclick = function() {
			document.getElementById("dogType").checked = true;
			document.getElementById("city").value = "台中市       ";
			document.getElementById("name").value = "Hello World!";
			document.getElementById("envTypes2").checked = true;
			document.getElementById("phone").value = "04-23208339";
			document.getElementById("add").value = "台中市南屯區大墩十一街648號";
			document.getElementById("cityError").innerHTML = "";
			document.getElementById("nameError").innerHTML = "" ;
			document.getElementById("phoneError").innerHTML = "" ;	
			document.getElementById("addressError").innerHTML = "" ;				
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
		
		cityInput.onchange = function(){
			if(document.getElementById("cityError")!=null){
				if(cityInput.value!="-1"){
					document.getElementById("cityError").innerHTML = "";
				} else{
					document.getElementById("cityError").innerHTML = "必須選擇城市";
				}
			}else{
				if(cityInput.value!="-1"){
					document.getElementById("cityErrorFT").innerHTML = "";
				} else{
					document.getElementById("cityErrorFT").innerHTML = "必須選擇城市";
				}
			}
		}
		
		nameInput.onblur = function(){
			if(document.getElementById("nameError")!=null){
				if(nameInput.value.length<2 || nameInput.value.length>30){
					document.getElementById("nameError").innerHTML = "姓名欄位需2個字元以上，30字元以下";
				}else{
					document.getElementById("nameError").innerHTML = "" ;
				}
			}else{				
				if(nameInput.value.length<2 || nameInput.value.length>30){
					document.getElementById("nameErrorFT").innerHTML = "姓名欄位需2個字元以上，30字元以下";
				}else{
					document.getElementById("nameErrorFT").innerHTML = "" ;
				}
			}
		}
		
		for(var i = 0; i < animalTypes.length; i++){
			if(document.getElementById("animalTypesError")!=null){
				animalTypes[i].onchange = function(){
					if(dogTypeCB.checked || catTypeCB.checked){
						document.getElementById("animalTypesError").innerHTML = "" ;
					}
				}	
			}
		}
			

		for(var i = 0; i < radioBtns.length; i++){
			radioBtns[i].onchange = function(){
				if(this.checked){
					alert(this.value+" is selected:"+this.checked);
					document.getElementById("envTypesError").innerHTML = "" ;					
				}				
			}
		}
		
		phoneInput.onblur = function(){
			if(document.getElementById("phoneError")!=null){
				var phoneRegex = /^\d{2,4}-(\d{6,8}|-*\d{3,4}-\d{3,4})$/;
				if(phoneInput.value.match(phoneRegex)){
					document.getElementById("phoneError").innerHTML = "" ;	
				}else{
					document.getElementById("phoneError").innerHTML = "電話欄位不正確" ;
				}
			}else{
				if(phoneInput.value.match(phoneRegex)){
					alert("right")
					document.getElementById("phoneErrorFT").innerHTML = "" ;	
				}else{
					alert("wrong")
					document.getElementById("phoneErrorFT").innerHTML = "電話欄位不正確" ;
				}
			}
		}
		
		addInput.onblur = function(){
			if(document.getElementById("addressError")!=null){
				if(document.getElementById("add").value.length>=6 && document.getElementById("phone").value.length<=30){
					document.getElementById("addressError").innerHTML = "" ;	
				}else{
					document.getElementById("addressError").innerHTML = "地址欄位不正確" ;
				}
			}else{
				if(document.getElementById("add").value.length>=6 && document.getElementById("phone").value.length<=30 ){
					document.getElementById("addressErrorFT").innerHTML = "" ;	
				}else{
					document.getElementById("addressErrorFT").innerHTML = "地址欄位不正確" ;
				}
			}
		}
	};
</script>
</head>
<body>
	<section class="contact-page-area">

		<div class="row">
			<div class="framefriendly">
				<div class="content" style="width: 600px">
					<br>
					<div>
						<form:form method="post" id="addNewEnv" class="black"
							modelAttribute="friendlyEnv" enctype="multipart/form-data">
							<input id="PageContext" type="hidden"
								value='${pageContext.request.contextPath}' />
							<div>
								<strong><label>新增友善餐廳</label></strong>
							</div>

							<label>所在城市:</label>
							<form:select id="city" path="city">
								<form:option label="請挑選" value="-1" />
								<form:options items="${citylist}" />
							</form:select>
							<form:errors id="cityError" path="city" cssClass="error"/>
							<span id="cityErrorFT" style="color:red;font-size: 12px;"></span>
							
							
							<br>					
							<label>名稱:</label>
							<form:input type="text" path="name" />
							<form:errors id="nameError" path="name" cssClass="error" />
							<span id="nameErrorFT" style="color:red;font-size: 12px;"></span>
							
							
							<br>							
							<label>請選擇寵物類別:</label>
							<form:checkbox id="dogType" path="animalTypes" value="狗" />狗 
							<form:checkbox id="catType" path="animalTypes" value="貓" />貓 
							<form:errors path="animalTypes" cssClass="error" id="animalTypesError"/>
							<span id="animalTypesFT" style="color:red;font-size: 12px;"></span>
							
							<br>
							<label>環境類別:</label>
							<form:radiobutton path="envTypes" value="寵物住宿" />寵物住宿 
							<form:radiobutton path="envTypes" value="寵物餐廳" />寵物餐廳 
							<form:radiobutton path="envTypes" value="寵物美容" />寵物美容 
							<form:errors path="envTypes" cssClass="error" id="envTypesError"/>
							<span id="envTypesErrorFT" style="color:red;font-size: 12px;"></span>
							
							<br>
							<label>電話:</label>
							<form:input id="phone" type="text" path="telephone" />
							<form:errors id="phoneError" path="telephone" cssClass="error" />
							<span id="phoneErrorFT" style="color:red;font-size: 12px;"></span>
							<br>

							<label>地址:</label>
							<form:input id="add" type="text" path="address" size="38" />
							<form:errors id="addressError" path="address" cssClass="error" />
							<span id="addressErrorFT" style="color:red;font-size: 12px;"></span>
							<br>

							<form:input id="chosenFile" path="friendlyEnvImage" type="file" />
							<form:errors path="friendlyEnvImage" cssClass="error" />
							
							<div>
								<img id="myimage">
							</div>
							<div>
								<input type="submit" value="建立資料" />
							</div>
						</form:form>
						<br>
						<button id="oneKeyFillIn">一鍵輸入</button>

					</div>

					<br>

					<form action="<c:url value='/FriendlyEnvSearch' />">
						<input type="submit" value="回寵物友善搜尋">
					</form>
					<br>
				</div>
			</div>
		</div>
	</section>

</body>
</html>