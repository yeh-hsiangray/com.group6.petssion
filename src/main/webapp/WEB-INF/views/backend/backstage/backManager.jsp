<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Author Meta -->
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Insert title here</title>

	
<script>
        document.addEventListener("DOMContentLoaded", function () {
        	 let namev = document.getElementById("namev");
             let select = document.getElementById("select");
             let result = document.getElementById("result");
             let index = 0;
             let name = "";
            select.onclick = selectReady;
            function selectReady() {
                index = 0;
                name = namev.value
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
        	   if(window.confirm("你確定要修改嗎？")){}else{ selecton(); return;}
               data={
                        id:this.name,
                        manager:document.getElementById(`manager\${this.name}`).value
                    }
                    fetch("updateManager", { method: "POST", body: JSON.stringify(data), headers: { "Content-Type": "application/json" } }).
                        then(res => res.json()).then(function(data){
                        	selecton()
                        })
            }

            function selectFor(data) {
                fetch("select", { method: "POST", body: JSON.stringify(data), headers: { "Content-Type": "application/json" } }).
                    then(res => res.json()).then
                    (function (data) {
                        if(data!=null){
                        con = `<table class='table table-striped'><thead><tr><th scope='col'>帳號</th> <th scope='col'>姓名</th><th scope='col'>生日</th><th scope='col'>信箱</th><th scope='col'>性別</th><th scope='col'>職業</th><th scope='col'>權限</th><th scope='col'> </th></tr></thead><tbody>`
                        	counter=0;
                        	for(i=0;i<data.content.length;i++){
                            con+=`<tr><td>\${data.content[i].account}</td><td>\${data.content[i].name}</td><td>\${data.content[i].birthday!=null?data.content[i].birthday:"無資料"}</td><td>\${data.content[i].email}</td><td>\${data.content[i].gender!=null?data.content[i].gender:"無資料"}</td><td>\${data.content[i].jobName!=null?data.content[i].jobName:"無資料"}</td><td><select class="form-select" id='manager\${data.content[i].id}'>`
                            con+=`<option value="0"`
							if(data.content[i].manager==0){con+=` selected`}
                            con+=`>一般會員</option>`
                            con+=`<option value="1"`
							if(data.content[i].manager==1){con+=` selected`}
                            con+=`>付費會員</option>`
                            con+=`<option value="2"`
							if(data.content[i].manager==2){con+=` selected`}
                            con+=`>專欄作家</option> </select></td><td><button type="button" class="btn btn-primary" name="\${data.content[i].id}" id="upButton\${i}">送出</button></td></tr>`
                            counter++;
                            }
                            con+=`</tbody></table><nav aria-label="Page navigation example"> <ul class="pagination justify-content-center" ><li class="page-item \${data.first?"disabled":""}"><a class="page-link" id="last">上一頁</a></li>`
                   
                            dataIndex=0
                            dataEnd=5
                            if(data.number>2&&data.number<data.totalPages-2){
                            	dataIndex=data.number-2
                            }else if(data.totalPages<5){
                            	dataEnd-=dataEnd-data.totalPages
                            }else if(data.number>=data.totalPages-5&&data.totalPages>4&&data.number>3){
                            	dataIndex=data.totalPages-5
                            }
                            counter2=0
                            for(i=data.number>2?dataIndex:0;i<dataIndex+dataEnd;i++){
                               con+=`<li class="page-item \${data.number==i?"active":""}"><a class="page-link" name="\${i}" id="pageNumber\${i}">\${i+1}</a></li>`
                            	   counter2++;
                               }
                            con+=`<li class="page-item \${data.last?"disabled":""}"><a class="page-link" id="next">下一頁</a></li></ul></nav>`
                            result.innerHTML=con
                            document.getElementById(`last`).onclick=last;
                            document.getElementById(`next`).onclick=next;
							for(i=0;i<counter;i++){
                            document.getElementById(`upButton\${i}`).onclick=upDate;}
							for(i=dataIndex;i<counter2;i++){
                            document.getElementById(`pageNumber\${i}`).onclick=pageNumber;}
                    }else{
                        result.innerHTML="<h1 style='color: red;'>查無資料</h1>"
                    }
                    })
            }


        })
    </script>
 <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <%@include file="../../commons/backend_imports.jsp"%>
</head>

<body>
<!--header -->
	<%@include file="../../commons/backend_header.jsp"%>

	<!-- sidebar start -->
	<%@include file="../../commons/backend_sidebar.jsp"%>
	<!-- sidebar end -->
	<!-- content -->
	<div style="text-align: center;">
		<table style="margin:auto;">
			<tr>
				<td>請輸入要搜索的使用者姓名:</td>
				<td><input type="text" id="namev"></td>
				<td><button type="button" id="select">搜尋</button></td>
			</tr>
		</table>
	</div>
	<div id="result" style="text-align: center;"></div>
	
	<!--footer -->
	<%@include file="../../commons/backend_footer.jsp"%>
	
</body>
</html>
