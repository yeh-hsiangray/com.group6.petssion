<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script>
        document.addEventListener("DOMContentLoaded", function () {
        	 let namev = document.getElementById("namev");
             let select = document.getElementById("select");
             let selectAll = document.getElementById("selectAll");
             let result = document.getElementById("result");
             let index = 0;
             let name = "";
            select.onclick = selectReady;
            selectAll.onclick=selectAllReady;
            function selectReady() {
                index = 0;
                name = namev.value
                selecton()
            }
            function selectAllReady() {
                index = 0;
                name = "";
                selecton()
            }
            function last() {
                index--;
                selecton()
            }
            function next() {
                index++;
                selecton()
            }
            function pageNumber() {
                index = this.name;
                selecton()
            }
            function selecton() {
                data = {
                    name,
                    index
                }
                selectFor(data)
            }
            function upDate(){
                console.log(this.name)
            }

            function selectFor(data) {
                fetch("BasckSelect/1", { method: "POST", body: JSON.stringify(data), headers: { "Content-Type": "application/json" } }).
                    then(res => res.json()).then
                    (function (data) {
                        if(data!=null){
                        con = `<table class='table table-striped'><thead><tr> <th scope='col'>姓名</th><th scope='col'>生日</th><th scope='col'>信箱</th><th scope='col'>性別</th><th scope='col'>職業</th><th scope='col'>權限</th><th scope='col'> </th></tr></thead><tbody>`
                        	counter=0;
                        	for(i=0;i<data.content.length;i++){
                            con+=`<tr><td>\${data.content[i].name}</td><td>\${data.content[i].birthday}</td><td>\${data.content[i].email}</td><td>\${data.content[i].gender}</td><td>\${data.content[i].job!=null?data.content[i].job.name:"無資料"}</td><td><select id='manager\${data.content[i].id}'>`
                            con+=`<option value="0"`
							if(data.content[i].manager==0){con+=` selected`}
                            con+=`>一般會員</option>`
                            con+=`<option value="1"`
							if(data.content[i].manager==1){con+=` selected`}
                            con+=`>付費會員</option>`
                            con+=`<option value="2"`
							if(data.content[i].manager==2){con+=` selected`}
                            con+=`>專欄作家</option> </select></td><td><button type="button" name="\${data.content[i].id}" id="upButton\${i}">送出</button></td></tr>`
                            counter++;
                            }
                            con+=`</tbody></table> <ul class="pagination"><li class="page-item \${data.first?"disabled":""}"><a href="#" class="page-link" id="last">上一頁</a></li>`
                            counter2=0
                            for(i=0;i<data.totalPages;i++){
                               con+=`<li class="page-item \${data.number==i?"active":""}"><a href="#" class="page-link" name="\${i}" id="pageNumber\${i}">\${i+1}</a></li>`
                            	  counter2++
                               }
                            con+=`</tbody></table> <ul class="pagination"><li class="page-item \${data.last?"disabled":""}"><a href="#" class="page-link" id="next">下一頁</a></li>`
                            result.innerHTML=con
                            document.getElementById(`last`).onclick=last;
                            document.getElementById(`next`).onclick=next;
							for(i=0;i<counter;i++){
                            document.getElementById(`upButton\${i}`).onclick=upDate;}
							for(i=0;i<counter2;i++){
                            document.getElementById(`pageNumber\${i}`).onclick=pageNumber;}
                    }else{
                        result.innerHTML="<h1 style='color: red;'>查無資料</h1>"
                    }
                    })
            }


        })
    </script>
</head>

<body>
	<div>
		<table>
			<tr>
				<td>請輸入要搜索的使用者姓名:</td>
				<td><input type="text" id="namev"></td>
				<td><button type="button" id="select">搜尋</button></td>
				<td><button type="button" id="selectAll">全部搜尋</button></td>
			</tr>
		</table>
	</div>
	<div id="result"></div>

</body>
</html>