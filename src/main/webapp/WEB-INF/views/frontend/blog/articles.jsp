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
<link rel="shortcut icon" href="../../Sources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="DixonLiao">
<!-- Meta Description -->
<meta name="description" content="a blog about pets from Petssion.com">
<!-- Meta Keyword -->
<meta name="keywords" content="blog, pet, petssion">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>寵物專欄分頁${singleArticle.title}</title>

<!--imports-->
<%@include file="../../commons/frontend_imports.jsp"%>
</head>

<body>

	<!-- header -->
	<%@include file="../../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">寵物專欄</h1>
					<p class="text-white link-nav" style="font-size: 20px">
						<a href="index.html" style="font-size: 20px">分頁</a> <span
							class="lnr lnr-arrow-right"></span><a href="blog-home.html"
							style="font-size: 20px"> ${singleArticle.title} </a> <span
							class="lnr lnr-arrow-right"></span> <a href="blog-single.html"
							style="font-size: 20px"> ${singleArticle.author}</a>
					</p>
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
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid" src="${singleArticle.img1}" alt="">
							</div>
						</div>
						<div class="col-lg-3  col-md-3 meta-details">
							<ul class="tags">
								<li><a href="#">${tagList.tag1}</a></li>
								<li><a href="#">${tagList.tag2}</a></li>
								<li><a href="#">${tagList.tag3}</a></li>
								<li><a href="#">${tagList.tag4}</a></li>
							</ul>
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6">
									<a href="#">${singleArticle.author}</a> <span
										class="lnr lnr-user"></span>
								</p>
								<p class="date col-lg-12 col-md-12 col-6">
									<a href="#"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${singleArticle.createDate}" /></a> <span
										class="lnr lnr-calendar-full"></span>
								</p>
								<p class="view col-lg-12 col-md-12 col-6">
									<a href="#">觀看次數:&nbsp&nbsp${singleArticle.hitCount}</a> <span
										class="lnr lnr-eye"></span>
								</p>
								<p class="comments col-lg-12 col-md-12 col-6">
									<a href="#">留言回覆</a> <span class="lnr lnr-bubble"></span>
								</p>
								<ul class="social-links col-lg-12 col-md-12 col-6">
									<li><a href="https://www.facebook.com/sharer.php?u=#"><i
											class="fa fa-facebook"></i></a></li>
									<li><a
										href="http://twitter.com/intent/tweet?source=sharethiscom&text=分享貼文&url=google.com.tw"><i
											class="fa fa-twitter"></i></a></li>
									<li><a
										href="http://line.naver.jp/R/msg/text/?google.com.tw"><i
											class="fab fa-line"></i></a></li>
									<li><a
										href="http://instagram.com/sharer.php?u=google.com.tw&description=分享貼文"><i
											class="fab fa-instagram"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<h3 class="mt-20 mb-20">${singleArticle.title}</h3>
							<p class="excert">${singleArticle.contents}
						</div>
						<div class="col-lg-12">

							<div class="row mt-30 mb-30">
								<div class="col-6">
									<img class="img-fluid" src="${singleArticle.img2}g" alt="">
								</div>
								<div class="col-6">
									<img class="img-fluid" src="${singleArticle.img3}" alt="">
								</div>

							</div>
						</div>
					</div>
					<div
						class="col-lg-12 social-nav row no-gutters nav-right flex-row d-flex justify-content-end align-items-center">
						<div class="row mt-30 mb-30">
							<div class="focials" style="font-size: 30px; !important">
								<a href=" https://www.facebook.com/sharer.php?u=google.com.tw"><i
									class="fa fa-facebook"></i></a> <a
									href="http://twitter.com/intent/tweet?source=sharethiscom&text=分享貼文&url=google.com.tw"><i
									class="fa fa-twitter"></i></a> <a
									href="http://line.naver.jp/R/msg/text/?google.com.tw"><i
									class="fab fa-line"></i></a> <a
									href="http://instagram.com/sharer.php?u=google.com.tw&description=分享貼文"><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
					</div>
					<div class="navigation-area">
						<div class="row">
							<div
								class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">

								<div class="detials" style="font-size: 20px;">

									<a href="<c:url value='/frontend/blog/article/${preId}'/>"><p>
											<span class="fas fa-backward"></span> 前一篇文章
										</p> </a>
								</div>
							</div>
							<div
								class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials" style="font-size: 20px;">
									<c:set var="nextId" value="${singleArticle.id+1}" />
									<a href="<c:url value='/frontend/blog/article/${nextId}'/>"><p>
											下一篇文章 <span class="fas fa-forward"></span>
										</p></a>
								</div>

							</div>
						</div>
					</div>

					<!-- comments -->
					<div class="comments-area">
						<div class="form-group name">
							<div id="fb-root"></div>
							<script async defer crossorigin="anonymous"
								src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v11.0&appId=324247775053071&autoLogAppEvents=1"
								nonce="YkB2s0io"></script>

							<div class="fb-comments"
								data-href="https://www.facebook.com/Furpal-106941081537977"
								data-width="100%" data-numposts="10"></div>

							<!-- <h4>留言</h4>
						<form>
							<div class="form-group form-inline">
								<div class="form-group col-lg-6 col-md-12 name">
									<input type="text" class="form-control" id="name"
										placeholder="姓名/暱稱" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Name'">
								</div>
								<div class="form-group col-lg-6 col-md-12 email">
									<input type="email" class="form-control" id="email"
										placeholder="電子郵件" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email address'">
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="subject"
									placeholder="主題" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Subject'">
							</div>
							<div class="form-group">
								<textarea class="form-control mb-10" rows="5" name="message"
									placeholder="訊息" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Messege'" required=""></textarea>
							</div>
							<a href="#" class="primary-btn text-uppercase">發佈貼文</a>
						</form>
					</div> -->
						</div>
					</div>
				</div>



				<!-- comments -->


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
		
	</script>
</body>

</html>