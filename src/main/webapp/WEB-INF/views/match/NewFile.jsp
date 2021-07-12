<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
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
</head>
  <body>
    <div class="card mb-3 card hole" style="max-width: 540px;">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class='active'><a href="#home" data-toggle="tab">個人資訊</a></li>
			<li><a href="#board" data-toggle="tab">寵物檔案</a></li>
<!-- 			<li><a href="#download" data-toggle="tab">下載區</a></li> -->
		</ul>
		<div class="tab-content" style="padding: 10px;">
			<div class="tab-pane active" id="home">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="..." class="card-img" alt="...">
					</div>
					<div class="col-md-8 ">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<h1>姓名</h1>
							<h1>姓名</h1>
							<h1>姓名</h1>
							</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
							<div class="card-body">
							<button type="button" class="btn btn-success agree">成功按钮</button>
							<button type="button" class="btn btn-danger refuse">危险按钮</button>
<!-- 								<a href="#" class="card-link">Card link</a>  -->
<!-- 								<a href="#"class="card-link">Another link</a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane row " id="board">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="..." class="card-img" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">IIIii</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
			</div>

<!-- 			<div class="tab-pane " id="download"> -->
<!-- 				<div class="row no-gutters"> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<img src="..." class="card-img" alt="..."> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-8"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h5 class="card-title">Card title</h5> -->
<!-- 							<p class="card-text">22222</p> -->
<!-- 							<p class="card-text"> -->
<!-- 								<small class="text-muted">Last updated 3 mins ago</small> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
  </body>
</html>