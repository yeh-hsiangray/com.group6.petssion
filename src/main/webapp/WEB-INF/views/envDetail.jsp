<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
名字: Gina
日期: 2021/05/01
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${envDetail.name}</title>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(document).ready(function(event) {
		//let intervalPlay;
		checkRole();

		$("#editBtn").click(function(e) {
			editNow(e);
		});

		function editNow() {
			console.log("Editing...");
			document.getElementById("readOnly").removeAttribute("disabled");
		}
		;

		document.getElementById('chosenFile').onchange = function(evt) {
			var tgt = evt.target || window.event.srcElement, files = tgt.files;

			// FileReader support
			if (FileReader && files && files.length) {
				var fr = new FileReader();
				fr.onload = function() {
					let myImage = document.getElementById("myimage");
					let newImgFig = document.getElementById("newImgFig");
					myImage.src = fr.result;
					myImage.style.width = "200px";
					myImage.style.height = "150px";
					newImgFig.hidden = false;
					newImgFig.style.marginLeft = "10px";
				}
				fr.readAsDataURL(files[0]);
			}
			// Not supported
			else {
				alert("The file uploaded is not supported");
			}
		}

		function checkRole() {
			let role = '${userRole}'
			if (role == "admin") {
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

	});
</script>
<link href="resources/friendlyStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<!-- Start contact-page Area -->
	<section class="contact-page-area">

		<div class="row">
			<div class="framefriendly black">
				<div class="content">
					<br>
					<form:form method="post" id="addNewEnv" class="black"
						modelAttribute="friendlyEnvU" enctype="multipart/form-data">
						<fieldset id="readOnly" disabled="disabled">
							<label>所在城市:</label>
							<form:select id="city" path="city">
								<option ${cityTP}>台北市</option>
								<option ${cityTC}>台中市</option>
								<option ${cityHZ}>新竹市</option>
							</form:select>
							<br> <label>名稱:</label>
							<form:input type="text" path="name" />
							<br> <label>請選擇寵物類別:</label>
							<form:checkbox path="animalTypesArr" value="狗" />
							狗
							<form:checkbox path="animalTypesArr" value="貓" />
							貓 <br> <label>環境類別:</label>
							<form:radiobutton path="envTypes" value="寵物住宿" />
							寵物住宿
							<form:radiobutton path="envTypes" value="寵物餐廳" />
							寵物餐廳
							<form:radiobutton path="envTypes" value="寵物美容" />
							寵物美容 <br> <label>電話:</label>
							<form:input type="text" path="telephone" />
							<br> <label>地址:</label>
							<form:input type="text" path="address" size="38" />
							<br>
							<form:input class="roleAdmin" id="chosenFile"
								path="friendlyEnvImage" type="file" />
							<form:errors path="friendlyEnvImage" cssClass="error" />
							<div class="d-flex">
								<figure>
									<img src="data:image/jpg;base64,${photo}" width="200"
										height="150" />
									<figcaption class="roleAdmin">原始圖檔</figcaption>
								</figure>
								<figure id="newImgFig" hidden="true">
									<img id="myimage">
									<figcaption>更新圖檔</figcaption>
								</figure>
							</div>
							<div class="roleAdmin">
								<input type="submit" value="確定修改" />
							</div>
						</fieldset>
					</form:form>
					<br>
					<div>
						<button id="editBtn" class="roleAdmin">編輯資料</button>
					</div>

					<br>
					<div class="d-flex">
						<form class="roleAdmin"
							action="<c:url value='/FriendlyEnvSearch' />">
							<input type="submit" value="回寵物友善環境(b)">
						</form>
						<form class="roleGeneral"
							action="<c:url value='/FriendlyEnvSearchFR' />">
							<input type="submit" value="回寵物友善環境(f)">
						</form>
					</div>


					<br>

				</div>

				<div>
					<iframe width="650" height="380"
						style="border: 2px solid teal; border-radius: 15px; margin: 15px 15px 0px 100px"
						src="https://www.google.com/maps/embed/v1/place?key=&q=${address}">
					</iframe>
				</div>
			</div>


		</div>
	</section>
	<!-- End contact-page Area -->

</body>
</html>