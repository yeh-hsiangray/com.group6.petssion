<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>交友通知</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css">
<link rel=stylesheet href="../css/notify.css">
<script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js"></script>
<script src="https://unpkg.com/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<body>
	<div id="showuser"></div>
	<script>
		
		var showuser = document.getElementById('showuser'); // 取出相同興趣使用者資料的div標籤
		var likearea = document.getElementById('likearea');
		var xhr = new XMLHttpRequest(); // 讀取所有的興趣
		var xhr2 = new XMLHttpRequest(); // 讀取相同興趣的使用者資料
		var xhr3 = new XMLHttpRequest();
		var xhr4 = new XMLHttpRequest();
		var i = 0;
		var dataJson;
		// 存放所有興趣與主鍵值，每一name與主鍵值放入一個陣列，將此陣列放入(push)陣列companyData中
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);				
				displayUsers(xhr.responseText);
					
				}
				// 將companyData內的資料全部移植到select標籤中
				for (var i = 0; i < companyData.length; i++) {
					var option = new Option(companyData[i][0], ""
							+ companyData[i][1]);
					//建立一個option物件,即在<select>標籤中建立一個或多個<option value=”值”>文字</option>
					//options是個陣列,裡面可以存放多個<option value=”值”>文字</option>這樣的標籤
					selectElement.options[selectElement.options.length] = option;
				}
			}
		}
		xhr.open("GET", "<c:url value='/match/_05/allHobbys'/>", true);
		xhr.send();
	
		function displayUsers(responseText){
			 dataJson = JSON.parse(responseText);
			 var content="<div class='card mb-3 card hole' style='max-width: 540px;'>"+
		                      "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href=''#home' data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board' data-toggle='tab'>寵物檔案</a></li>"+			
		                       "</ul>"+"
		                    "<div class='tab-content' style='padding: 10px;'>"+
			                    "<div class='tab-pane active' id='home'>"+
				                "<div class='row no-gutters'>"+
					              "<div class='col-md-4'>"+
						          "<img src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>"+
					        "</div>"+
					               "<div class='col-md-8 '>"+
					      	"<div class='card-body'>"+
							"<h5 class='card-title'>Card title</h5>"+
							"<p class='card-text'>"+
							   "<p>會員姓名:"+ dataJson[i].name + "</p>"+
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							"</p>"+
							"<p class='card-text'>"+
								 "<small class='text-muted'>Last updated 3 mins ago</small>"+
							"</p>"+
							"<div class='card-body'>"+
								"<button type='button' class='btn btn-success agree'>加入</button>"+
								"<button type='button' class='btn btn-danger refuse'>拒絕</button>"+
								<!-- 								<a href="#" class="card-link">Card link</a>  -->
								<!-- 								<a href="#"class="card-link">Another link</a> -->
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"+"
			"</div>"+
			"<div class='tab-pane row ' id='board'>"+
				"<div class='row no-gutters'>"+
					"<div class='col-md-4'>"+
						"<img src='...' class='card-img' alt='...'>"+
					"</div>"+
					"<div class='col-md-8'>"+
						"<div class='card-body'>"+
							"<h5 class=""card-title'>Card title</h5>"+
							"<p class='card-text'>IIIii</p>"+
							"<p class='card-text'>"+
								"<small class='text-muted'>Last updated 3 mins ago</small>"+
							"</p>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>"+
	"</div>";


	</script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>