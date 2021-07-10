<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="../source/../source/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="DixonLiao">
<!-- Meta Description -->
<meta name="description" content="a blog about pets from Petssion.com">
<!-- Meta Keyword -->
<meta name="keywords" content="blog, pet, petssion">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>後台：寵物專欄-主頁</title>

<!--imports-->
<%@include file="../../commons/backend_imports.jsp"%>
</head>
<body
	class="hold-transition sidebar-mini layout-fixed layout-footer-fixed">

	<!--header -->
	<%@include file="../../commons/backend_header.jsp"%>

	<!-- sidebar start -->
	<%@include file="../../commons/backend_sidebar.jsp"%>
	<!-- sidebar end -->

	<!-- Main content Start-->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>寵物專欄</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right" style="font-size: 26px;">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item active">文章列表</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->

		<!-- Search -->
		<section class="content">
			<div class="container-fluid">
				<h2 class="text-center ">文章列表</h2>
				<h3 class="text-center ">進階搜尋</h3>
				<br>
				<div class="row">
					<div class="col-md-10 offset-md-1">
						<div class="row">
							<div class="col-6">
								<div class="form-group" style="font-size: 26px;">
									<label>檢索條件</label> <select class="select2"
										data-placeholder="檢索條件" id="searchOption" name="type"
										style="width: 100%; height: 47px; border-radius: 5px; border-color: grey;">
										<option value="id">文章編號</option>
										<option value="author">文章作者</option>
										<option value="title" selected="selected">文章標題</option>
										<option value="tag">分類標籤</option>
										<option value="createDate">文章日期</option>

									</select>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group" style="font-size: 26px;">
									<label>日期升降序排列:</label> <select class="select2"
										id="seachOption2" name="sortOrder"
										style="width: 100%; height: 47px; border-radius: 5px; border-color: grey;">
										<option value="ASC" selected>升序</option>
										<option value="DESC">降序</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group" style="font-size: 26px">
							<div class="input-group input-group-lg">
								<label>輸入檢索內容</label>
								<div class="input-group">
									<input type="text" name="search" class="form-control"
										placeholder="請輸入欲檢索內容" style="height: 47px">
									<div class="input-group-append">
										<button class="btn btn-default" id="searchButton"
											style="width: 47px; height: 47px;">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<br>
		<!-- Search -->

		<!-- Table List-->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<!-- /.card-header -->
								<div class="card-body">
									<a class="btn btn-danger btn-sm" id="deleteArticle"
										style="font-size: 26px;"> <i class="fas fa-trash"> </i>
										刪除選取
									</a> &nbsp&nbsp<a class="btn btn-info btn-sm" href="<c:url value='/backend/blog/article/edit' />"
										style="background-color: #218838; font-size: 26px;"> <i
										class="fas fa-file-plus"> </i> 新增文章
									</a>&nbsp&nbsp <a class="btn btn-primary btn-sm" id="showAll"
										style="background-color: #FF7300; font-size: 26px;"
										id="viewAll"> <i class="fas fa-file"> </i> 顯示本頁文章
									</a> <br> <br>
									<table id="tbd" class="table table-bordered table-striped"
										style="font-size: 24px;">

										<thead>
											<!-- <tr>
												<th colspan="6"><a class="btn btn-danger btn-sm"
													href="#"> <i class="fas fa-trash"> </i> 刪除選取
												</a> <a class="btn btn-info btn-sm" href="#"> <i
														class="fas fa-file-plus"> </i> 新增文章
												</a></th>
											</tr> -->
											<tr>
												<th width="7%;"><label><input type="checkbox"
														name="color1" value=""></label>&nbsp&nbsp全選</th>
												<th width="10%;">作者</th>
												<th width="32%;">標題</th>
												<th width="16%;">標籤</th>
												<th width="9%;">發文日期</th>
												<th width="16%;">檢視&nbsp/&nbsp修改</th>
											</tr>
										</thead>
										<tbody>
											<!-- <tr>
											</tr>-->
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<nav class="blog-pagination justify-content-center d-flex">
									<ul class="pagination">
										<li class="page-item"><a href="#" class="page-link"
											aria-label="Previous"> <span aria-hidden="true"> <span
													class="lnr lnr-chevron-left"> </span></span></a></li>
										<li class="page-item"><a href="#" class="page-link"
											aria-label="Next"> <span aria-hidden="true"> <span
													class="lnr lnr-chevron-right"></span>
											</span></a></li>
									</ul>
								</nav>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
		</section>
		<!-- Table List -->
	</div>
	<!-- Main content End-->



	<!--footer -->
	<%@include file="../../commons/backend_footer.jsp"%>
	<!--ajax-->
	<script>
		const pageSize = 10;
		var nowIsSearch=false
		function getPageData(page,isSearch) {
			nowIsSearch=isSearch;
			var search=$("input[name=search]").val();
			var type=$("select[name=type]").val();
			var sortOrder=$("select[name=sortOrder]").val();
			console.log("go page:"+page);
			$("#tbd tbody").empty();
		$("ul.pagination").empty();
		var searchUrl="<c:url value='/backend/blog/api/latestArticle'/>"+ "?page=" + page + "&size=" + pageSize;
		if(isSearch){
			searchUrl="<c:url value='/backend/blog/api/searchArticle'/>"+ "?page=" + page + "&size=" + pageSize+
			"&search="+search+"&type="+type+"&sortOrder="+sortOrder;
			
		}
		
 		$.ajax({
				//url : "<c:url value='/backend/blog/api/searchArticle'/>"
				//		+ "?page=" + page + "&size=" + pageSize+"&search=${search}&type=${type}",
				url : searchUrl,
						method : 'GET',
				// data: JSON.stringify(data),
				contentType : "application/json",
				dataType : 'JSON',
				success : function(result) {
					if (result != null && !result.empty) {
						console.log(result);
						var contents=result.content;
						//主文
						contents.forEach(function(item){
							let innerHtml=`
										<tr>
											<td><label><input type="checkbox" name="Checkbox[]"
													value="\${item.id}" id="checkGroup\${item.id}'/">&nbsp&nbsp\${item.id}</label></td>
											<td>\${item.author}</td>
											<td>\${item.title}</td>
											<td>\${item.tag1}, \${item.tag2},<br> \${item.tag3}, \${item.tag4}</td>
											<td>\${item.createDate.substring(0,10)}</td>
											<td>
											<a class="btn btn-primary btn-sm" href="<c:url value='/frontend/blog/article/\${item.id}'/>" style="font-size: 26px;">
											<i class="fas fa-folder"> </i> 檢視
											</a>&nbsp&nbsp
											<a class="btn btn-info btn-sm" href="<c:url value='/backend/blog/article/edit?id=\${item.id}'/>" style="font-size: 26px;">
											<i	class="fas fa-pencil-alt"> </i> 修改
											</a> 
											</td>
										</tr>
									`;
							$("#tbd tbody").append(innerHtml);
						});
						//分頁
						var pagination="";
						if(!result.first){
							pagination=`<li class="page-item"><a href="javascript:getPageData(\${result.number},\${nowIsSearch})" class="page-link"
								aria-label="Previous"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-left"></span>
								</span>
							</a></li>`;
						}
						for(var i=result.number-2;i<=result.number+3;i++){
							if(i>0 && i<= result.totalPages){
								if(i==result.number+1){
									pagination+=`<li class="page-item active"><a href="javascript:getPageData(\${i},\${nowIsSearch})" class="page-link">\${i}</a></li>`;
								}else{
									pagination+=`<li class="page-item"><a href="javascript:getPageData(\${i},\${nowIsSearch})" class="page-link">\${i}</a></li>`;
									
								}
								
							}
							
						} 
						if(!result.last){
							pagination+=`<li class="page-item"><a href="javascript:getPageData(\${result.number+2},\${nowIsSearch})" class="page-link"
								aria-label="Next"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-right"></span>
								</span>
							</a></li>`;
						}
						
						$("ul.pagination").append(pagination);
					}
				},
				error : function(data) {
				}
			});
		}
		$(function() {
			getPageData(1,false);
		}); 
		var nowPage=1;
	</script>
	<script>
 $(document).ready(function(){
  $("#tbd thead input[type=checkbox]").click(function(){
   if($(this).prop("checked")){//如果全選按鈕有被選擇的話（被選擇是true）
    $("#tbd tbody input[type=checkbox]").each(function(){
     $(this).prop("checked",true);//把所有的核取方框的property都變成勾選
    })
   }else{
    $("#tbd tbody input[type=checkbox]").each(function(){
     $(this).prop("checked",false);//把所有的核方框的property都取消勾選
    })
   }
  })
  $('#searchButton').click(function(event){
	  event.preventDefault();
	  getPageData(1,true);
  });
  $('#showAll').click(function(event){
	  event.preventDefault();
	  getPageData(1,false);
  });
  $('#deleteArticle').click(function(event){
	  event.preventDefault();
	  var delIds = new Array();
	console.log('click')
	$("#tbd tbody input[type=checkbox]:checked").each(function(i){delIds[i]=this.value});
	if(delIds.length==0){
		alert("請選擇要刪除的文章");
		return false;
	}
	/* 刪除(0,-1) 復原（0,1) 移到垃圾桶（1,0) */
	var data={
			ids:delIds,
			s1:1,
			s2:0
	};
	$.ajax({
		url : "<c:url value='/backend/blog/api/updateArticleStatus'/>",
		method : 'POST',
	    data: JSON.stringify(data),
	    contentType: 'application/json; charset=utf-8',
		dataType : 'JSON',
		success : function(result) {
			console.log(result);
			if(result.msg!="OK"){
				alert("ERROR:"+result);
			}else{
				getPageData(nowPage,nowIsSearch);
			}
		},
		error(xhr,status,error)	{
			console.log(xhr+":"+status+":"+error);
		}
	});
	
	
})
 })
</script>
</body>

</html>