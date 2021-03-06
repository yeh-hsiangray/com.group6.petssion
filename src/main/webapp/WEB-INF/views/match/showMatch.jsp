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
<title>配對選擇</title>
<style>
.banner-area {
	background: url("<c:url value='/Sources/img/banner-bg-1.jpg' />") right
		!important;
	background-size: cover !important;
}

.selecthobby {
	font-size: 100px;
	color: red;
	font-weight: bold;
}

.cont {
	font-style: italic;
	color: blue;
}
.alertNotify {
	 align:right;
	 width:100px;
	 weight:100px;
}	
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel=stylesheet href="../css/card.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<%@include file="../commons/frontend_imports.jsp"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&family=ZCOOL+KuaiLe&display=swap')
	;

</style>
</head>
<body>
	<!--header -->
	<%@include file="../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">配對通知</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='${header.referer}' />">上一頁</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="<c:url value='/' />match/Notify">興趣交友配對</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- content-->
	<div class="packhole" style="height: 80vh; margin-top: -100px;">
		<!-- 		<div class="container" style="color: powderblue;"> -->
		<div class="row ">

			<!-- 			<div class="frameTop"> -->
			<!-- 			<div class="alert alert-warning alert-dismissible fade show" -->
			<!-- 				role="alert" data-dismiss="alert"> -->
			<!-- 				<strong>Holy guacamole!</strong> You should check in on some of -->
			<!-- 				those fields below. -->
			<!-- 				<button type="button" class="close" data-dismiss="alert" -->
			<!-- 					aria-label="Close"> -->
			<!-- 					<span aria-hidden="true">&times;</span> -->
			<!-- 				</button> -->
			<!-- 			</div> -->
			<div class="selecthobby" role="group" aria-label="...">
				請挑選搜尋之興趣: <select id='hobby' class="pretty-select"></select>
			</div>
			<div id="alertBox" class="alertNotify"></div>
		</div>
		<div id='showuser'></div>
	</div>



	<!-- 	</div> -->
	<!-- content -->


	<script>
	    var alertBox = document.getElementById('alertBox'); 
		var selectElement = document.getElementById('hobby');  // 取出select標籤
		var showuser = document.getElementById('showuser');     // 取出相同興趣使用者資料的div標籤
		var likearea=document.getElementById('likearea'); 
		var xhr = new XMLHttpRequest();        	// 讀取所有的興趣
		var xhr2 = new XMLHttpRequest();		// 讀取相同興趣的使用者資料
		var xhr3=new XMLHttpRequest();
		var xhr4=new XMLHttpRequest();
		var i=0;
		var dataJson;
		// 存放所有興趣與主鍵值，每一name與主鍵值放入一個陣列，將此陣列放入(push)陣列companyData中
		var companyData = [];						
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				var hobbyJson = JSON.parse(xhr.responseText);
				companyData.push(["請選擇",""]);
				for (var i = 0; i < hobbyJson.length; i++) {
					console.log(hobbyJson[i])
					// 每一個興趣與主鍵值放入一個陣列
					var hobby = [ hobbyJson[i].name, hobbyJson[i].id ];
					// 在將此陣列放入(push)陣列companyData中
					
					companyData.push(hobby);
					
				}
		        // 將companyData內的資料全部移植到select標籤中
				for (var i = 0; i < companyData.length; i++) {
					var option = new Option(companyData[i][0], "" + companyData[i][1]);
					//建立一個option物件,即在<select>標籤中建立一個或多個<option value=”值”>文字</option>
					//options是個陣列,裡面可以存放多個<option value=”值”>文字</option>這樣的標籤
					selectElement.options[selectElement.options.length] = option;
				}
			}
		}
		xhr.open("GET", "<c:url value='/match/_05/allHobbys'/>", true);
		xhr.send();
		
		
		
		// 定義select標籤的change事件處理函數
		selectElement.onchange = function(){
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
  					
                 console.log(xhr2.responseText);
 					displayUsers(xhr2.responseText);
				}
			}
			
// 			單個option的屬性 (obj.options[obj.selecedIndex]是指定的某個<option>標籤,是一個—)
			//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
			var id = selectElement.options[ selectElement.selectedIndex ].value;
			// 定義open方法
			xhr2.open("GET", "<c:url value='/match/selectHobby/getUsers' />" + "?id=" + id, true);
			// 送出請求
			xhr2.send();
		}
		

		function loveSubmit(id){
		
// 			console.log(id);
			var love=document.getElementById('love_Btn').value = '1'; //喜歡狀態
			xhr3.onreadystatechange = function() {
				if (xhr3.readyState == 4 && xhr3.status == 200) {
					alertLoveNotify();
					
					if(i>=dataJson.length){ 
		            	lastData() ;
		            	return 
		            	}
					
					var content="<input class='n"+i+" nav' name='nav' type='radio'>"+			
					 "<article  class='s"+i+" myfont'><table>"+
					 "<tr>"+
                     "<td >會員姓名:</td>"+
                     "<td class='cont'>" + dataJson[i].name + "</td>" +               
                     "<td>寵物姓名:</td>"+
                     "<td class='cont'>" + dataJson[i].pet[0].name + "</td>" +               
	                   
	            "</tr>" +
	            "<tr>"+
	                   "<td > 會員性別:</td>"+ 
	                   "<td class='cont'>" + dataJson[i].gender + "</td>"+
	                   "<td > 寵物種類:</td>"+ 
	                   "<td class='cont'>" + dataJson[i].pet[0].type.name + "</td>"+
	            "</tr>" +
	            "<tr>"+
	                   "<td>會員星座:</td>"+
	                   "<td class='cont'>" + dataJson[i].constellation + "</td>"+
	                   "<td>寵物性別:</td>"+
	                   "<td class='cont'>" + dataJson[i].pet[0].gender + "</td>"+
	            "</tr>"+
	            "<tr>"+
	                   "<td>自我介紹:</td>"+
	                   "<td class='cont'>" + dataJson[i].selfintroduction + "</td>"+
	                   "<td>寵物個性:</td>"+
	                   "<td class='cont'>" + dataJson[i].pet[0].personality.name + "</td>"+
	            "</tr>"+
	            "<tr>"+
	                    "<td>會員照片:</td>"+
                      "<td><img class='mugshot' src='data:image/jpeg;base64," + dataJson[i].base64UserImg + "'></td>"+
	                    "<td >寵物照片:</td>"+
                      "<td ><img class='mugshot' src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg + "'></td>"+
             "</tr>"+
	                "<tr>"+				                 				                  
		            "<td colspan='4' style='text-align:center;'><button  type='button'  name='love_Btn'  id='love_Btn' onClick='loveSubmit("+dataJson[i].id+")'>"+
		                    "<img  src='../img/heart.png'></button>"+
		                     "<button  type='button'  name='hate_Btn'  id='hate_Btn' onClick='hateSubmit("+dataJson[i].id+")'>"+
		                     "<img  src='../img/cross.png'></button></td>"+
		            "</tr>";
     
	                 content +="</table></article>";
	                 showuser.innerHTML = content; 	
	                  i++;		
	              	console.log("------hate="+hate+"&--------hate_Btn="+id);
				}	
			}		
			
			xhr3.open("POST","<c:url value='/match/save' />",true);
			xhr3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr3.send("userB=" + id+"&status="+love);
		}
		
		
		function hateSubmit(id){
// 			console.log(id);
			var hate=document.getElementById('hate_Btn').value = '2'; //不喜歡狀態					
			xhr4.onreadystatechange = function() {
				if (xhr4.readyState == 4 && xhr4.status == 200) {
					alertHateNotify();
	            if(i>=dataJson.length){ 
	            	lastData();
	            	return 
	            	}
					var content="<input class='n"+i+" nav' name='nav' type='radio'>"+			
					 "<article  class='s"+i+" myfont'><table>"+
					 "<tr>"+
                     "<td >會員姓名:</td>"+
                     "<td class='cont'>" + dataJson[i].name + "</td>" +               
                     "<td>寵物姓名:</td>"+
                     "<td class='cont'>" + dataJson[i].pet[0].name + "</td>" +               
	                   
	            "</tr>" +
	            "<tr>"+
	                   "<td > 會員性別:</td>"+ 
	                   "<td class='cont'>" + dataJson[i].gender + "</td>"+
	                   "<td > 寵物種類:</td>"+ 
	                   "<td class='cont'>" + dataJson[i].pet[0].type.name + "</td>"+
	            "</tr>" +
	            "<tr>"+
	                   "<td>會員星座:</td>"+
	                   "<td class='cont'>" + dataJson[i].constellation + "</td>"+
	                   "<td>寵物性別:</td>"+
	                   "<td class='cont'>" + dataJson[i].pet[0].gender + "</td>"+
	            "</tr>"+
	            "<tr>"+
	                   "<td>自我介紹:</td>"+
	                   "<td class='cont'>" + dataJson[i].selfintroduction + "</td>"+
	                   "<td>寵物個性:</td>"+
	                   "<td class='cont'>" + dataJson[i].pet[0].personality.name + "</td>"+
	            "</tr>"+
	            "<tr>"+
	                    "<td>會員照片:</td>"+
                      "<td><img class='mugshot' src='data:image/jpeg;base64," + dataJson[i].base64UserImg + "'></td>"+
	                    "<td >寵物照片:</td>"+
                      "<td ><img class='mugshot' src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg + "'></td>"+
             "</tr>"+
		           "<tr>";		
		        	content +="<td colspan='4' style='text-align:center;'><button  type='button'  name='love_Btn'  id='love_Btn' onClick='loveSubmit("+dataJson[i].id+")'>"+
		                    "<img  src='../img/heart.png'></button>"+
		                     "<button  type='button'  name='hate_Btn'  id='hate_Btn' onClick='hateSubmit("+dataJson[i].id+")'>"+
		                     "<img  src='../img/cross.png'></button></td>"+
		            "</tr>";
		          
			
	                 content +="</table></article>";
	                 showuser.innerHTML = content; 	
					 i+=1;
							
			console.log("------hate="+hate+"&--------hate_Btn="+id);
					
				}	
			}		
 			xhr4.open("POST","<c:url value='/match/save' />",true);
			xhr4.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr4.send("userB=" + id+"&status="+hate);
									
		}
		
		
		
		function alertLoveNotify(){
			
			content="<div class='alert alert-primary alert-dismissible fade show ' role='alert' >"+
		    "成功!加入好友邀請<br>"+		   
		    "<button class='close' data-dismiss='alert'>&times;</button>"+
		  "</div>";
			alertBox.innerHTML = content;
			
		}	
		
	    
		
      function alertHateNotify(){
			
			content="<div class='alert alert-danger alert-dismissible fade show ' role='alert' >"+
		    "取消好友邀請機會<br>"+		   
		    "<button class='close' data-dismiss='alert'>&times;</button>"+
		  "</div>";
			alertBox.innerHTML = content;
		}	
		
		
	function lastData(){
		 if(i>=dataJson.length){
      	   content = "<div class='alertMode'>已無配對相同興趣者</div>"
      	   alert("已無配對相同興趣者");
      	showuser.innerHTML = content;
}
	}
		
		function displayUsers(responseText){
			 dataJson = JSON.parse(responseText);
			 if(dataJson.length==0){
				 content = "<div class='alertMode'>目前無此相同興趣者</div>"
			      	   alert("目前無此相同興趣者,請挑選另一興趣");
			      	showuser.innerHTML = content;
				return
			}
				
//			}
// 			console.log(dataJson)
			 //取值 [{key:value},{key:value}] =mapData[0]["Users"],  json[2].key
// 		     for(var i=0; i < dataJson.length; i++){
		    	 i=0;		     			
// 				console.log("-----------"+dataJson[i].base64UserImg)
              	var content="<input class='n"+i+" nav ' name='nav' type='radio'>"+			
	                "<article  class='s"+i+" myfont'><table>"+
	                "<tr>"+
	                       "<td >會員姓名:</td>"+
	                       "<td class='cont'>" + dataJson[i].name + "</td>" +               
	                       "<td>寵物姓名:</td>"+
	                       "<td class='cont'>" + dataJson[i].pet[0].name + "</td>" +               
		                   
		            "</tr>" +
		            "<tr>"+
		                   "<td > 會員性別:</td>"+ 
		                   "<td class='cont'>" + dataJson[i].gender + "</td>"+
		                   "<td > 寵物種類:</td>"+ 
		                   "<td class='cont'>" + dataJson[i].pet[0].type.name + "</td>"+
		            "</tr>" +
		            "<tr>"+
		                   "<td>會員星座:</td>"+
		                   "<td class='cont'>" + dataJson[i].constellation + "</td>"+
		                   "<td>寵物性別:</td>"+
		                   "<td class='cont'>" + dataJson[i].pet[0].gender + "</td>"+
		            "</tr>"+
		            "<tr>"+
		                   "<td>自我介紹:</td>"+
		                   "<td class='cont'>" + dataJson[i].selfintroduction + "</td>"+
		                   "<td>寵物個性:</td>"+
		                   "<td class='cont'>" + dataJson[i].pet[0].personality.name + "</td>"+
		            "</tr>"+
		            "<tr>"+
		                    "<td>會員照片:</td>"+
	                        "<td><img class='mugshot' src='data:image/jpeg;base64," + dataJson[i].base64UserImg + "'></td>"+
		                    "<td >寵物照片:</td>"+
	                        "<td ><img class='mugshot' src='data:image/jpeg;base64," + dataJson[i].pet[0].base64PetImg + "'></td>"+
	               "</tr>"+
	                "<tr>"+				                 				                  
		            "<td colspan='4' style='text-align:center;'><button type='button' name='love_Btn' id='love_Btn' onClick='loveSubmit("+dataJson[i].id+")'>"+
		                    "<img  src='../img/heart.png'></button>"+
		                     "<button  type='button'  name='hate_Btn'  id='hate_Btn' onClick='hateSubmit("+dataJson[i].id+")'>"+
		                     "<img  src='../img/cross.png'></button></td>"+
		            "</tr>";
     
	                 content +="</table></article >";
			showuser.innerHTML = content; 	
			i++;
		}	
		
// 		"+"\'"+dataJson.users[i].id+"\'"+"

	</script>
	<!--footer -->
	<%@include file="../commons/frontend_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>