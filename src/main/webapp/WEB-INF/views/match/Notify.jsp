<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../images/favicon1.ico">
<title>交友通知</title>

<style type="text/css">

/* #DIV2{ */
/* float:left; */
/* } */

.head {
	border: solid red 5px;
	border-radius:20px; 
	float:left;
}

.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}
body{
background-color: yellow;
}
</style>
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



<script src="https://unpkg.com/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<!--imports-->
<%@include file="../commons/frontend_imports.jsp"%>
</head>
<body>

	<!--header -->
	<%@include file="../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">配對通知</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='${header.referer}' />">上一頁</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="<c:url value='/' />match/showMatch">興趣交友配對</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="<c:url value='/pet/memberProfile'/>" id="finduser"></a> 
					</p>
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
						<div class="col-lg-12"></div>

						<div class="btn-group" role="group" aria-label="...">
							配對狀態: <select id='selectMode'>
								<option value="">請選擇</option>
								<option value="1">交友邀請</option>
								<option value="2">配對成功</option>
								<option value="3">配對失敗</option>
							</select>
						</div>
<!-- 						<div style="display: block;"> -->
                            <div id="alertBox" class="alertNotify"></div>
<!-- 							<div> -->
								<div id="showuser" class="showuser"></div>
<!-- 							</div> -->
							
							
<!-- 						</div> -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- content -->



	<script>		
	    var alertBox = document.getElementById('alertBox');
		var showuser = document.getElementById('showuser'); // 取出相同興趣使用者資料的div標籤		
		var OneSideLove1 = document.getElementById('OneSideLove'); // 取出相同興趣使用者資料的div標籤		
		var EachLike1 = document.getElementById('EachLike'); // 取出相同興趣使用者資料的div標籤		
		var xhr = new XMLHttpRequest();  // 讀取所有的興趣
		var xhr1 = new XMLHttpRequest();
		var xhr2 = new XMLHttpRequest();
		var xhr3 = new XMLHttpRequest();
		var xhr4 = new XMLHttpRequest();	
		var xhr5 = new XMLHttpRequest();	
		var i = 0;
		var dataJson;	
		
		let select = document.querySelector("#selectMode");
		select.addEventListener("change", selectFun);

function selectFun() {
  const switchValue = select.options[select.selectedIndex].value;
  if(switchValue==1){
	  ajaxRefresh();
  }else if(switchValue==2){
	  ajaxRefresh1();
  }else if(switchValue==3){
	  ajaxRefresh2();
  }
}

	
    function ajaxRefresh(){
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
// 				console.log(xhr.responseText);	
                
				displayUsers(xhr.responseText);	
				
				}							
		}
		xhr.open("GET", "<c:url value='/match/signInNotifyConfirm'/>", true);
        xhr.send();
		}
	
    function ajaxRefresh1(){
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
// 					
               
//                 displayUsers(xhr1.responseText);	
                EachLike(xhr1.responseText);	
				}							
		}
		xhr1.open("GET", "<c:url value='/match/signInNotifyEachLike'/>", true);
		xhr1.send();
		}
	
    function ajaxRefresh2(){
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
// 				console.log(xhr.responseText);
            OneSideLove(xhr2.responseText);
					
				}							
		}
		xhr2.open("GET", "<c:url value='/match/signInNotifyOneSideLove'/>", true);
		xhr2.send();
		}
	
    
  $(document).on('click', '.remove', function() {
    $(this).parents(".head").remove();
});

    
// 		window.setInterval(ajaxRefresh,2000);
 
         function alertLoveNotify(){		
			content="<div class='alert alert-primary alert-dismissible fade show ' role='alert' >"+
		    "確認成為好友<br>"+		   
		    "<button class='close' data-dismiss='alert'>&times;</button>"+
		  "</div>";
			alertBox.innerHTML = content;			
		}	
	
         
         function alertHateNotify(){		
			content="<div class='alert alert-danger alert-dismissible fade show ' role='alert' >"+
		    "取消成為好友機會<br>"+		   
		    "<button class='close' data-dismiss='alert'>&times;</button>"+
		  "</div>";
			alertBox.innerHTML = content;			
		}	
	
         
		function loveSubmit(id){			
// 			console.log(id);
			var matchstatus = {
					userA: id,
					status:'3' //喜歡狀態
				}				
			xhr3.onreadystatechange = function() {
				if (xhr3.readyState == 4 && xhr3.status == 200) {							
					alertLoveNotify();
				}	
			}							
			xhr3.open("POST","<c:url value='/match/updateMatchStatus' />",true);
			xhr3.setRequestHeader('Content-type','application/json');
			var data = JSON.stringify(matchstatus); // 傳送文字資料
			xhr3.send(data);
			
		}
		
		
		
		function hateSubmit(id){	
             var matchstatus = {
					userA: id,
					status:'4' //不喜歡狀態
				}				
			xhr4.onreadystatechange = function() {
				if (xhr4.readyState == 4 && xhr4.status == 200) {	            
//              document.getElementById("head").remove(e);
                   alertHateNotify();
	            	}					
				}						
            xhr4.open("POST","<c:url value='/match/updateMatchStatus' />",true);
 			xhr4.setRequestHeader('Content-type','application/json');
 			var data = JSON.stringify(matchstatus); // 傳送文字資料
 			xhr4.send(data);
 											
		}
		
		function changePage(id){
			
		   var finduser=document.getElementById("finduser");
			window.location.href=finduser.href+"/"+id;
				
		}
   	
		/*signInNotifyConfirm*/
		function displayUsers(responseText){
			 dataJson = JSON.parse(responseText);
			 if(dataJson.length==0){
				 content = "<div class='alertMode'>目前無通知訊息</div>"
			      	  
			      	showuser.innerHTML = content;
				return
			}
			 var content= "<div class=' mb-3 box ' style='max-width: 540px;'>";
			 for(var i=0; i < dataJson.length; i++){	
				
			 content+= "<div class='head'>"+
				         "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href='#home"+i+3+"'" +"data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board"+i+3+"'"+" data-toggle='tab'>寵物檔案</a></li>"+			
		                   "</ul>"+
		                "<div class='tab-content' style='padding: 0px;'>"+
			                    "<div class='tab-pane active' id='home"+i+3+"'"+">"+
				                "<div class='row no-gutters' >"+
					              "<div class='col' >";   
					              
					              if(dataJson[i].base64UserImg==null){
					            	  dataJson = JSON.parse(responseText);
					         content+= "<img class='card-img' src='../img/images.png'  class='card-img' alt='...'>";
					              }else{
					         content+= "<img class='card-img' src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>";					            	  
					              }				              
			     content+= "</div>"+
					        "<div class='col '>"+
					      	"<p>會員姓名:"+ dataJson[i].name + "</p>"+							   
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							   
							"<div class='card-body bottom row'>"+
								"<button type='button' id='love_Btn' class='col btn btn-success agree remove' onClick='loveSubmit("+dataJson[i].id+")'>加入</button>"+
								"<button type='button' id='hate_Btn' class='col btn btn-danger refuse remove' onClick='hateSubmit("+dataJson[i].id+")'>拒絕</button>"+
								"<button type='button' id='love_Btn' class='col btn btn-info agree remove' onClick='changePage("+dataJson[i].id+")'>觀看資料</button>"+
							"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
			"<div class='tab-pane row' id='board"+i+3+"'"+">"+
				"<div class='row no-gutters'>"+
					"<div class='col'>";
					 if(dataJson[i].pet[0].base64PetImg==null){
		            	  dataJson = JSON.parse(responseText);
		            content+= "<img src='../img/animal.png'  class='card-img' alt='...'>";
					 }else{
					content+= "<img src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg +"' class='card-img' alt='...'>";						
					}
	 	 content+="</div>"+
					"<div class='col'>"+
						"<div class='card-body'>"+
							"<p>寵物姓名:" + dataJson[i].pet[0].name + "</p>"+
							"<p class='card-text'>"+
							
							"<p>寵物種類:" + dataJson[i].pet[0].type.name+ "</p>"+
							"<p>寵物性別:" + dataJson[i].pet[0].gender + "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
						    "</p>"+
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
			 if(dataJson.length==0){
				 content = "<div class='alertMode'>目前無通知訊息</div>"
			      	  
			      	showuser.innerHTML = content;
				return
			}
			 var content= "<div class=' mb-3 box' style='max-width: 540px;'>";
			 for(var i=0; i < dataJson.length; i++){			 
			 content+= "<div class='head'>"+
				         "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href='#home"+i+2+"'" +"data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board"+i+2+"'" +" data-toggle='tab'>寵物檔案</a></li>"+			
		                   "</ul>"+
		                "<div class='tab-content' style='padding: 0px;'>"+
			                    "<div class='tab-pane active' id='home"+i+2+"'"+">"+
				                "<div class='row no-gutters'>"+
					              "<div class='col'>";   
					              
					              if(dataJson[i].base64UserImg==null){
					            	  dataJson = JSON.parse(responseText);
					         content+= "<img class='card-img' src='../img/images.png' class='card-img' alt='...'>";
					              }else{
					         content+= "<img class='card-img' src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>";					            	  
					              }				              
			     content+= "</div>"+
					               "<div class='col'>"+
					      	"<p>會員姓名:"+ dataJson[i].name + "</p>"+
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							"<div class='card-body bottom'>"+
								"<button  id='love_Btn' class='remove btn btn-success agree' >確定</button>"+							
							"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
			"<div class='tab-pane row' id='board"+i+2+"'"+">"+
				"<div class='row no-gutters'>"+
					"<div class='col'>";
					 if(dataJson[i].pet[0].base64PetImg==null){
		            	  dataJson = JSON.parse(responseText);
		            content+= "<img src='../img/animal.png'  class='card-img' alt='...'>";
					 }else{
					content+= "<img src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg +"' class='card-img' alt='...'>";						
					}
	 	 content+="</div>"+
					"<div class='col'>"+
						"<div class='card-body'>"+
							"<p>寵物姓名:" + dataJson[i].pet[0].name + "</p>"+
							"<p class='card-text'>"+
							
							"<p>寵物種類:" + dataJson[i].pet[0].type.name+ "</p>"+
							"<p>寵物性別:" + dataJson[i].pet[0].gender + "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
						    "</p>"+
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
		
		/*signInNotifyEachLike*/
		function EachLike(responseText){
			 dataJson = JSON.parse(responseText);
			 if(dataJson.length==0){
				 content = "<div class='alertMode'>目前無通知訊息</div>"
			      	  
			      	showuser.innerHTML = content;
				return
			 }
			 var content= "<div class='mb-3 box '>";
			 for(var i=0; i < dataJson.length; i++){
			 content+= "<div class='head'>"+
				         "<ul class='nav nav-tabs' id='myTab' role='tablist'>"+
			                     "<li><a href='#home"+i+"'" +"data-toggle='tab'>個人資訊</a></li>"+
			                     "<li><a href='#board"+i+"'" +"data-toggle='tab'>寵物檔案</a></li>"+			
		                   "</ul>"+
		                "<div class='tab-content' style='padding: 10px;'>"+
			                    "<div class='tab-pane active' id='home"+i+"'"+">"+
				                "<div class='row no-gutters'>"+
					              "<div class='col'>";   
					              
					              if(dataJson[i].base64UserImg==null){
					            	  dataJson = JSON.parse(responseText);
					         content+= "<img   class='card-img' src='../img/images.png' class='card-img' alt='...'>";
					              }else{
					         content+= "<img class='card-img'  src='data:image/jpeg;base64," + dataJson[i].base64UserImg +"' class='card-img' alt='...'>";					            	  
					              }				              
			     content+= "</div>"+
					               "<div class='col' >"+
					      	"<p>會員姓名:"+ dataJson[i].name + "</p>"+
							   "<p>會員性別:"+ dataJson[i].gender +"</p>"+
							   "<p>會員星座:" + dataJson[i].constellation + "</p>"+
							   "<p>自我介紹:" + dataJson[i].selfintroduction + "</p>"+
							"<div class='card-body bottom'>"+
								"<button type='button' id='love_Btn' class='btn btn-info agree'  onClick='changePage("+dataJson[i].id+")'>觀看資料</button>"+
							"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
			"<div class='tab-pane row' id='board"+i+"'"+">"+
				"<div class='row no-gutters'>"+
					"<div class='col'>";
					 if(dataJson[i].pet[0].base64PetImg==null){
		            	  dataJson = JSON.parse(responseText);
		            content+= "<img src='../img/animal.png'  class='card-img' alt='...'>";
					 }else{
					content+= "<img  src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg +"' class='card-img' alt='...'>";						
					}
	 	 content+="</div>"+
					"<div class='col'>"+
						"<div class='card-body'>"+
							"<p>寵物姓名:" + dataJson[i].pet[0].name + "</p>"+
							"<p class='card-text'>"+							
							"<p>寵物種類:" + dataJson[i].pet[0].type.name+ "</p>"+
							"<p>寵物性別:" + dataJson[i].pet[0].gender + "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
							"<p>寵物個性:" + dataJson[i].pet[0].personality.name +  "</p>"+
						    "</p>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>"+
		"</div>";
			 }
			
			 content+="</div>";
			 if(i>=dataJson.length){ 
				 showuser.innerHTML = "無資料";
	            	}
			 showuser.innerHTML = content; 	
		}
		
	</script>
	<script src="../js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!--footer -->
	<%@include file="../commons/frontend_footer.jsp"%>
</body>
</html>