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
<title>寵物專欄主頁</title>

<!--imports-->
<%@include file="../../commons/frontend_imports.jsp"%>
<style>
@media ( max-width : 767px) {
	.box {
		width: 450px !important;
	}
}

.box {
	overflow: hidden;
	width: 550px;
	height: 65px;
	/* padding: 10px;
border: #4caf50 2px solid; */
}

.ellipsis {
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>

<body>

	<!-- header -->
	<%@include file="../../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="blog-home-banner banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content blog-header-content col-lg-12">
					<h2 class="text-white" style="font-size:36px">想了解更多關於寵物的知識和新聞嗎？</h2>
					<p class="text-white" style="font-size:26px">更多寵物相關時事新知等待著你來挖掘唷</p>
					<a href=<c:url value='/frontend/blog/index' />
						 class="primary-btn" style="font-size:20px">寵物專欄首頁</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<!-- post -->
					<div id="aritcleList"></div>
					<!-- end post-->

					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Previous"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-left"></span>
								</span></a></li>
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Next"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-right"></span>
								</span></a></li>
						</ul>
					</nav>
				</div>

				<!-- sidebar start -->
				<%@include file="../../commons/frontend_blog_sidebar.jsp"%>
				<!-- sidebar end -->

			</div>
		</div>
	</section>
	<!-- End post-content Area -->

	<!--footer-->
	<%@include file="../../commons/frontend_footer.jsp"%>

	<!--ajax-->
	<script>
		const pageSize = 5;
		function getPageData(page) {
			$("#aritcleList").empty();
			$("ul.pagination").empty();
			$.ajax({
				url : "<c:url value='/frontend/blog/api/latestArticle'/>"
						+ "?page=" + page + "&size=" + pageSize,
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
							let innerHtml=`<div class="single-post row">
								<div class="col-lg-3  col-md-3 meta-details">
									<ul class="tags">
										<li><a href="/frontend/blog/list/tag/\${item.tag1}">\${item.tag1}</a></li>
										<li><a href="/frontend/blog/list/tag/\${item.tag2}">\${item.tag2}</a></li>
										<li><a href="/frontend/blog/list/tag/\${item.tag3}">\${item.tag3}</a></li>
										<li><a href="/frontend/blog/list/tag/\${item.tag4}">\${item.tag4}</a></li>
									</ul><div class="user-details row">
										<p class="user-name col-lg-12 col-md-12 col-6">
											<a href="/frontend/blog/index/\${item.author}">\${item.author}</a>
											<span class="lnr lnr-user"></span>
										</p>
										<p class="date col-lg-12 col-md-12 col-6">
											<a href="/frontend/blog/index/\${item.createDate}">\${item.createDate.substring(0,10)}</a>
											<span class="lnr lnr-calendar-full"></span>
										</p>
										<p class="view col-lg-12 col-md-12 col-6">
											<a href="#">觀看次數:&nbsp&nbsp\${item.hitCount}</a> <span class="lnr lnr-eye"></span>
										</p>
										<p class="comments col-lg-12 col-md-12 col-6">
											<a href="#">留言回覆</a> <span class="lnr lnr-bubble"></span>
										</p>
									</div>
								</div>
								<div class="col-lg-9 col-md-9 ">
									<div class="feature-img">
										<img class="img-fluid" src="\${item.img1}" alt="">
									</div>
									<a class="posts-title" href="blog-single.html">
										<h3>\${item.title}</h3>
									</a>
									<div class="box">
										<p class="ellipsis">
											\${item.contents}
										</p>
									</div>
									<a href="<c:url value='/frontend/blog/article/\${item.id}'/>"
										class="primary-btn">閱讀更多</a>
								</div>
							</div>`;
							$("#aritcleList").append(innerHtml);
							//console.log(innerHtml);
						});
						//分頁
						var pagination="";
						if(!result.first){
							pagination=`<li class="page-item"><a href="javascript:getPageData(\${result.number})" class="page-link"
								aria-label="Previous"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-left"></span>
								</span>
							</a></li>`;
						}
						for(var i=result.number-2;i<=result.number+3;i++){
							if(i>0 && i<= result.totalPages){
								if(i==result.number+1){
									pagination+=`<li class="page-item active"><a href="javascript:getPageData(\${i})" class="page-link">\${i}</a></li>`;
								}else{
									pagination+=`<li class="page-item"><a href="javascript:getPageData(\${i})" class="page-link">\${i}</a></li>`;
									
								}
								
							}
							
						} 
						if(!result.last){
							pagination+=`<li class="page-item"><a href="javascript:getPageData(\${result.number+2})" class="page-link"
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
			getPageData(1);
		});
	</script>
</body>

</html>