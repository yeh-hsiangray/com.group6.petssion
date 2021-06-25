<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
名字: Gina
日期: 2021/05/01
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>友善搜尋</title>
<script>
	window.onload=function(){
		let role = '${userRole}'
		
		checkRole()
		
		function checkRole() {
			let role = '${userRole}'
			if (role == "admin") {
				// alert("it's role admin")
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
	}

</script>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>

	<!-- Start contact-page Area -->
	<section class="contact-page-area">

		<div class="row">
			<div class="framefriendly">
				<div class="content">
					<br>
					<div>
						<form id="idSearchForm" action="<c:url value='/GetOrUpdateOneEnv' />" class="black">
							查詢指定環境ID: <input type="text" name="envId"><input
								type="submit">
						</form>
					</div>
					<br>
					
					<hr>				
					<div>
						<form action="<c:url value='/GetAllEnvs' />" class="black">
							所有友善環境 <input type="submit" value="我想看" />
						</form>
					</div>
					<br>
					
					<hr class="roleAdmin">

					<div class="roleAdmin">
						<form action="<c:url value='/AddNewFriendlyEnv' />" method="get" class="black">
							新增友善餐廳 <input type="submit" value="我要新增" />
						</form>
					</div>
					<br class="roleAdmin"> 
					<hr>

					<div>
						<form action="<c:url value='/GetFilteredEnvs' />" method="get" class="black">
							<div>
								<strong><label>依條件查詢</label></strong>
							</div>
							<label>請選擇您想查詢的城市:</label> <select id="citySearch"
								name="citySearch">
								<option>請選擇查詢城市</option>
								<option>台北市</option>
								<option>台中市</option>
								<option>新竹市</option>
							</select> <br> <label>請選擇寵物類別:</label> <input type="checkbox"
								name="animalTypes" value="狗" />狗 <input type="checkbox"
								name="animalTypes" value="貓" />貓

							<div>
								<input type="submit" value="提交查詢" />
							</div>

						</form>
					</div>
					<br>
					<hr>

				</div>
			</div>


		</div>
	</section>
	<!-- End contact-page Area -->


</body>
</html>
