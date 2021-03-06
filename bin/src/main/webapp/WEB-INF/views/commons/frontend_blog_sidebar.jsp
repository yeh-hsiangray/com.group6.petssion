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
				<div class="dropdown" id="opSelected">
					<button class="dropbtn">進階搜尋</button>
					<div class="dropdown-content">
						<a href="#" value="1"> 文章編號 </a> 
						<a href="#" value="2"> 文章作者 </a>
						<a href="#" value="3"> 文章標題 </a> 
						<a href="#" value="4"> 分類標籤 </a>
					</div>
				</div>
				<form class="search-form" action="" id="searchForm">
					<input placeholder="" name="Article_Id" type="text"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '搜尋文章標題'">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
				<script>
				$(#opSelected).click(fucntion(){
					var val=$(this).val();
					var
				})
				
				$(#searchForm).submit(fucntion(event){
					console.log("submit!")
				})
				</script>
			
			</div>
		</div>

		<!-- LASTEST -->
		<div class="single-sidebar-widget popular-post-widget">
			<h4 class="popular-title">最新貼文</h4>
			<div class="popular-post-list">
				<c:forEach items="${latestArticles}" begin="0" end="2" var="item">
					<div class="single-post-list d-flex flex-row align-items-center">
						<div class="thumb">
							<img class="img-fluid" src="先不要放" alt="">
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
				<c:forEach items="${latestArticles}" begin="0" end="2" var="item">
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