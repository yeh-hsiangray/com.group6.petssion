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
</head>
<body>
	<div id="showuser" class="showuser"></div>
	<div id="OneSideLove" class="showuser"></div>
	<div id="EachLike" class="showuser"></div>
	<div id="ou"></div>
	<script>		
		var showuser = document.getElementById('showuser'); // 取出相同興趣使用者資料的div標籤		
		var xhr = new XMLHttpRequest();  // 讀取所有的興趣
		var xhr1 = new XMLHttpRequest();
		var xhr2 = new XMLHttpRequest();
		var xhr3 = new XMLHttpRequest();
		var xhr4 = new XMLHttpRequest();
		var i = 0;
		var dataJson;	
		
	ajaxRefresh();
	ajaxRefresh1();
	ajaxRefresh2();
	
    function ajaxRefresh(){
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
// 				console.log(xhr.responseText);	
                
				displayUsers(xhr.responseText);	
				ou.innerHTML="現在="+new Date();
				}							
		}
		xhr.open("GET", "<c:url value='/match/signInNotifyOneSideLove'/>", true);
		xhr.send();
		}
	
    function ajaxRefresh1(){
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
// 					
                ou.innerHTML="現在="+new Date();
//                 displayUsers(xhr1.responseText);	
				 OneSideLove(xhr1.responseText);	
				}							
		}
		xhr1.open("GET", "<c:url value='/match/signInNotifyEachLike'/>", true);
		xhr1.send();
		}
	
    function ajaxRefresh2(){
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
// 				console.log(xhr.responseText);	           				
				EachLike(xhr2.responseText);	
				}							
		}
		xhr2.open("GET", "<c:url value='/match/signInNotifyOneSideLove'/>", true);
		xhr2.send();
		}
	
// 		window.setInterval(ajaxRefresh,2000);
 
// 		window.setInterval(ajaxRefresh,2000);
 
	
		function loveSubmit(id){			
// 			console.log(id);
			var matchstatus = {
					userA: id,
					status:'3' //喜歡狀態
				}				
			xhr3.onreadystatechange = function() {
				if (xhr3.readyState == 4 && xhr3.status == 200) {							
			
				}	
			}							
			xhr3.open("POST","<c:url value='/match/updateMatchStatus' />",true);
			xhr3.setRequestHeader('Content-type','application/json');
			var data = JSON.stringify(matchstatus); // 傳送文字資料
			xhr3.send(data);
			
		}
		
		
		
		function hateSubmit(id){
//              var e = document.getElementById(id);
//              console.log(e);
// 			console.log(id);		
             var matchstatus = {
					userA: id,
					status:'4' //不喜歡狀態
				}				
			xhr4.onreadystatechange = function() {
				if (xhr4.readyState == 4 && xhr4.status == 200) {	            
//              document.getElementById("head").remove(e);
	            	}					
				}						
            xhr4.open("POST","<c:url value='/match/updateMatchStatus' />",true);
 			xhr4.setRequestHeader('Content-type','application/json');
 			var data = JSON.stringify(matchstatus); // 傳送文字資料
 			xhr4.send(data);
 											
		}
		
		
		/*signInNotifyConfirm*/
		function displayUsers(responseText){
			 dataJson = JSON.parse(responseText);
			 var content= "<div class='card mb-3 card hole' style='max-width: 540px;'>";
			 for(var i=0; i < dataJson.length; i++){			 
			 content+= "<div id='head'>"+
				         "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href='#home' data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board' data-toggle='tab'>寵物檔案</a></li>"+			
		                   "</ul>"+
		                "<div class='tab-content' style='padding: 10px;'>"+
			                    "<div class='tab-pane active' id='home'>"+
				                "<div class='row no-gutters'>"+
					              "<div class='col-md-4'>";   
					              
					              if(dataJson[i].base64UserImg==null){
					            	  dataJson = JSON.parse(responseText);
					         content+= "<img class='card-img' src='../img/images.png' width='180' height='210' class='card-img' alt='...'>";
					              }else{
					         content+= "<img class='card-img' width='180' height='210' src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>";					            	  
					              }				              
			     content+= "</div>"+
					               "<div class='col-md-8 '>"+
					      	"<div class='card-body'>"+
					      	"<p>會員姓名:"+ dataJson[i].name + "</p>"+
							"<p class='card-text'>"+
							   
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							"</p>"+
// 							"<p class='card-text'>"+
// 								 "<small class='text-muted'>Last updated 3 mins ago</small>"+
// 							"</p>"+
							"<div class='card-body bottom'>"+
								"<button type='button' id='love_Btn' class='btn btn-success agree' onClick='loveSubmit("+dataJson[i].id+")'>加入</button>"+
								"<button type='button' id='hate_Btn' class='btn btn-danger refuse' onClick='hateSubmit("+dataJson[i].id+")'>拒絕</button>"+
								<!-- 								<a href="#" class="card-link">Card link</a>  -->
								<!-- 								<a href="#"class="card-link">Another link</a> -->
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
			"<div class='tab-pane row' id='board'>"+
				"<div class='row no-gutters'>"+
					"<div class='col-md-4'>";
					 if(dataJson[i].pet[0].base64PetImg==null){
		            	  dataJson = JSON.parse(responseText);
		            content+= "<img src='../img/animal.png' width='180' height='210' class='card-img' alt='...'>";
					 }else{
					content+= "<img src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg +"' class='card-img' alt='...'>";						
					}
	 	 content+="</div>"+
					"<div class='col-md-8'>"+
						"<div class='card-body'>"+
							"<p>寵物姓名:" + dataJson[i].pet[0].name + "</p>"+
							"<p class='card-text'>"+
							
							"<p>寵物種類:" + dataJson[i].pet[0].type.name+ "</p>"+
							"<p>寵物性別:" + dataJson[i].pet[0].gender + "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
						    "</p>"+
// 							"<p class='card-text'>"+
// 								"<small class='text-muted'>Last updated 3 mins ago</small>"+
// 							"</p>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>"+
		"</div>";
			 }
			 content+="</div>";
     showuser.innerHTML = content; 				 
		}
		
		
		/*signInNotifyOneSideLove*/
		function OneSideLove(responseText){
			dataJson = JSON.parse(responseText);
			 var content= "<div class='card mb-3 card hole' style='max-width: 540px;'>";
			 for(var i=0; i < dataJson.length; i++){			 
			 content+= "<div id='head'>"+
				         "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href='#home' data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board' data-toggle='tab'>寵物檔案</a></li>"+			
		                   "</ul>"+
		                "<div class='tab-content' style='padding: 10px;'>"+
			                    "<div class='tab-pane active' id='home'>"+
				                "<div class='row no-gutters'>"+
					              "<div class='col-md-4'>";   
					              
					              if(dataJson[i].base64UserImg==null){
					            	  dataJson = JSON.parse(responseText);
					         content+= "<img class='card-img' src='../img/images.png' width='180' height='210' class='card-img' alt='...'>";
					              }else{
					         content+= "<img class='card-img' width='180' height='210' src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>";					            	  
					              }				              
			     content+= "</div>"+
					               "<div class='col-md-8 '>"+
					      	"<div class='card-body'>"+
					      	"<p>會員姓名:"+ dataJson[i].name + "</p>"+
							"<p class='card-text'>"+
							   
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							"</p>"+
// 							"<p class='card-text'>"+
// 								 "<small class='text-muted'>Last updated 3 mins ago</small>"+
// 							"</p>"+
							"<div class='card-body bottom'>"+
								"<button type='button' id='love_Btn' class='btn btn-success agree' onClick='Confirm("+dataJson[i].id+")'>確定</button>"+
								"<button type='button' id='love_Btn' class='btn btn-success agree' onClick='Confirm("+dataJson[i].id+")'>觀看資料</button>"+
								<!-- 								<a href="#" class="card-link">Card link</a>  -->
								<!-- 								<a href="#"class="card-link">Another link</a> -->
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
			"<div class='tab-pane row' id='board'>"+
				"<div class='row no-gutters'>"+
					"<div class='col-md-4'>";
					 if(dataJson[i].pet[0].base64PetImg==null){
		            	  dataJson = JSON.parse(responseText);
		            content+= "<img src='../img/animal.png' width='180' height='210' class='card-img' alt='...'>";
					 }else{
					content+= "<img src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg +"' class='card-img' alt='...'>";						
					}
	 	 content+="</div>"+
					"<div class='col-md-8'>"+
						"<div class='card-body'>"+
							"<p>寵物姓名:" + dataJson[i].pet[0].name + "</p>"+
							"<p class='card-text'>"+
							
							"<p>寵物種類:" + dataJson[i].pet[0].type.name+ "</p>"+
							"<p>寵物性別:" + dataJson[i].pet[0].gender + "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
						    "</p>"+
// 							"<p class='card-text'>"+
// 								"<small class='text-muted'>Last updated 3 mins ago</small>"+
// 							"</p>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>"+
		"</div>";
			 }
			 content+="</div>";
			 OneSideLove.innerHTML = content; 	
		}
		
		/*signInNotifyEachLike*/
		function EachLike(responseText){
			 dataJson = JSON.parse(responseText);
			 var content= "<div class='card mb-3 card hole' style='max-width: 540px;'>";
			 for(var i=0; i < dataJson.length; i++){
			 content+= "<div id='head'>"+
				         "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href='#home' data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board' data-toggle='tab'>寵物檔案</a></li>"+			
		                   "</ul>"+
		                "<div class='tab-content' style='padding: 10px;'>"+
			                    "<div class='tab-pane active' id='home'>"+
				                "<div class='row no-gutters'>"+
					              "<div class='col-md-4'>";   
					              
					              if(dataJson[i].base64UserImg==null){
					            	  dataJson = JSON.parse(responseText);
					         content+= "<img class='card-img' src='../img/images.png' width='180' height='210' class='card-img' alt='...'>";
					              }else{
					         content+= "<img class='card-img' width='180' height='210' src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>";					            	  
					              }				              
			     content+= "</div>"+
					               "<div class='col-md-8 '>"+
					      	"<div class='card-body'>"+
					      	"<p>會員姓名:"+ dataJson[i].name + "</p>"+
							"<p class='card-text'>"+
							   
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							"</p>"+
// 							"<p class='card-text'>"+
// 								 "<small class='text-muted'>Last updated 3 mins ago</small>"+
// 							"</p>"+
							"<div class='card-body bottom'>"+
								"<button type='button' id='love_Btn' class='btn btn-success agree' onClick='Comfirm("+dataJson[i].id+")'>確定</button>"+
								"<button type='button' id='love_Btn' class='btn btn-success agree' onClick='Check("+dataJson[i].id+")'>觀看資料</button>"+
								<!-- 								<a href="#" class="card-link">Card link</a>  -->
								<!-- 								<a href="#"class="card-link">Another link</a> -->
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
			"<div class='tab-pane row' id='board'>"+
				"<div class='row no-gutters'>"+
					"<div class='col-md-4'>";
					 if(dataJson[i].pet[0].base64PetImg==null){
		            	  dataJson = JSON.parse(responseText);
		            content+= "<img src='../img/animal.png' width='180' height='210' class='card-img' alt='...'>";
					 }else{
					content+= "<img src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg +"' class='card-img' alt='...'>";						
					}
	 	 content+="</div>"+
					"<div class='col-md-8'>"+
						"<div class='card-body'>"+
							"<p>寵物姓名:" + dataJson[i].pet[0].name + "</p>"+
							"<p class='card-text'>"+
							
							"<p>寵物種類:" + dataJson[i].pet[0].type.name+ "</p>"+
							"<p>寵物性別:" + dataJson[i].pet[0].gender + "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
						    "</p>"+
// 							"<p class='card-text'>"+
// 								"<small class='text-muted'>Last updated 3 mins ago</small>"+
// 							"</p>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>"+
		"</div>";
			 }
			
			 content+="</div>";
			 EachLike.innerHTML = content; 	
		}
	</script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>