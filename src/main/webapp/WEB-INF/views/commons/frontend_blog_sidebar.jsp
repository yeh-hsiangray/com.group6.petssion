<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<div class="col-lg-4 sidebar-widgets">
	<div class="widget-wrap">

		<!-- SEARCH -->
		<div class="single-sidebar-widget popular-post-widget">
			<h4 class="popular-title">搜尋</h4>
			<div class="single-sidebar-widget search-widget">
				<form class="search-form"
					action="<c:url value='/frontend/blog/list/search'/>"
					id="searchForm">
					<select name="type" class="selOpt" id="searchOption">
						<option value="id">文章編號</option>
						<option value="title" selected="selected">文章標題</option>
						<option value="author">文章作者</option>
						<option value="tag">分類標籤</option>
						<option value="createDate">發文日期</option>
					</select> <input placeholder="" name="search" type="text"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '搜尋文章標題'">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>

			</div>
		</div>
		<!-- AD -->
		<div class="single-sidebar-widget popular-post-widget">
			<h4 class="popular-title">廣告位</h4>
			<div class="carousel-inner" style="width: 90%">
				<div class="carousel-item active">
					<img src="<c:url value='/Sources/img/blog/ads-banner.jpeg' />"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/Sources/img/blog/ads-banner.jpeg' />"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/Sources/img/blog/ads-banner.jpeg' />"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<%-- <a href="#">
			<img class="img-fluid" src="<c:url value='/Sources/img/blog/ads-banner.jpeg' />" alt=""></a>
		</div> --%>
		<!-- LASTEST -->
		<div class="single-sidebar-widget popular-post-widget">
			<h4 class="popular-title">最新貼文</h4>
			<div class="popular-post-list">
				<c:forEach items="${latestArticles}" begin="0" end="5" var="item">
					<div class="single-post-list d-flex flex-row align-items-center">
						<div class="thumb">
							<!-- 							<img class="img-fluid" src="#" alt="">
 -->
						</div>
						<div class="details">
							<a href="<c:url value='/frontend/blog/article/${item.id}'/>">
								<h6>${item.title}</h6>
							</a>
							<p>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${item.createDate}" />
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- HOT  -->
		<div class="single-sidebar-widget popular-post-widget">
			<h4 class="popular-title">熱門貼文</h4>
			<div class="popular-post-list">
				<c:forEach items="${hotArticle}" begin="0" end="3" var="item">
					<div class="single-post-list d-flex flex-row align-items-center">
						<div class="details">
							<a href="<c:url value='/frontend/blog/article/${item.id}'/>">
								<h6>${item.title}</h6>
							</a>
							<p>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${item.createDate}" />
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- TAGVO -->
		<div class="single-sidebar-widget post-category-widget">
			<h4 class="category-title">貼文分類</h4>
			<ul class="cat-list">
				<c:forEach items="${tagGroup}" var="tagVo">
					<li><a
						href="<c:url value='/frontend/blog/list/tag?tag=${tagVo.tag}'/>"
						<%-- 		<li><a href="/frontend/blog/list/tag/${tagVo.tag}" --%>
					
						class="d-flex justify-content-between">
							<p>${tagVo.tag}</p>
							<p>${tagVo.count}</p>
					</a></li>
				</c:forEach>
			</ul>
		</div>

		<!--RSS-->
		<div class="single-sidebar-widget newsletter-widget">
			<h4 class="newsletter-title">最新消息</h4>
			<p>這裡將推廣有關寵物相關的最新消息，不要錯過囉。</p>
			<div class="form-group d-flex flex-row">
				<div class="col-autos">
					<div class="input-group">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
						</div>
						<input type="text" class="form-control" id="inlineFormInputGroup"
							placeholder="輸入電子信箱" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '輸入電子信箱'"> <a href="#"
							class="bbtns">訂閱</a>
					</div>
				</div>
			</div>
			<!-- AD -->
			<div class="single-sidebar-widget ads-widget">
				<a href="#"><img class="img-fluid"
					src="<c:url value='/Sources/img/blog/ads-banner.jpg' />" alt=""></a>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/Sources/js/vendor/bootstrap.min.js'/>"></script>