<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>配對選擇</title>
<link rel=stylesheet href="../css/card.css">



</head>
<body>
<div class="btn-group" role="group" aria-label="...">
	請挑選搜尋之興趣: 
	<select id='hobby'></select>
</div>
	
<div id='showuser'></div>

	<script>
		var selectElement = document.getElementById('hobby');  // 取出select標籤
		var showuser = document.getElementById('showuser');     // 取出相同興趣使用者資料的div標籤
		var likearea=document.getElementById('likearea'); 
		var xhr = new XMLHttpRequest();        	// 讀取所有的興趣
		var xhr2 = new XMLHttpRequest();		// 讀取相同興趣的使用者資料
		var xhr3=new XMLHttpRequest();
		
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
			console.log(id);
			var love=document.getElementById('love_Btn').value = '1';
			var 
			xhr3.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					
					
			console.log("------love="+love+"&--------love_Btn="+id);
					
				}	
			}		
			xhr3.open("POST","<c:url value='/match/save' />",true);
			xhr3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr3.send("user_B=" + id+"&status="+love);
							
			
		}
		
					
		
		function displayUsers(responseText){
			var dataJson = JSON.parse(responseText);
			console.log(dataJson)
			 //取值 [{key:value},{key:value}] =mapData[0]["Users"],  json[2].key
		     for(var i=0; i < dataJson.users.length; i++){
		    	 		     			
				console.log(dataJson[i])
				var content="<input class='n"+i+" nav' name='nav' type='radio'>"+			
			                "<section class='s"+i+"'><table>"+
			                "<tr>"+
			                       "<td>姓名:</td>"+
			                       "<td>" + dataJson.users[i].name + "</td>" +               
				                   "<td rowspan='4'>照片:</td>"+
				                   "<td rowspan='4'><img  width='40' height='48' src='../img/profile.png'></td>"+
				            "</tr>" +
				            "<tr>"+
				                   "<td > 性別:</td>"+ 
				                   "<td >" + dataJson.users[i].gender + "</td>"+
				            "</tr>" +
				            "<tr>"+
				                   "<td>星座:</td>"+
				                   "<td>" + dataJson.users[i].constellation + "</td>"+
				            "</tr>"+
				            "<tr>"+
				                   "<td>自我介紹:</td>"+
				                   "<td>" + dataJson.users[i].selfintroduction + "</td>"+
				            "</tr>"+
				           "<tr>"+				                 				                  
				            "<td colspan='4'><button  type='button'  name='love_Btn'  id='love_Btn' onClick='loveSubmit("+dataJson.users[i].id+")'>"+
				                    "<img  src='../img/heart.png'></button>"+
				                     "<button  type='button'  name='hate_Btn'  id='hate_Btn' onClick='hateSubmit()'>"+
				                     "<img  src='../img/cross.png'></button></td>"+
				            "</tr>";
		     }
			content +="</table></section>";
			showuser.innerHTML = content; 	
			
		}	
		
// 		"+"\'"+dataJson.users[i].id+"\'"+"
	</script>

</body>
</html>