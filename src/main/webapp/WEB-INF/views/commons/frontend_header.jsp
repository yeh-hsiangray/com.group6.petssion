<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- #header -->
<header id="header" id="home">
	<div class="container main-menu">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="#"><img src="<c:url value='/Sources/img/logo.png' />"
					style="height: 40px;">
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="index.html">首頁</a></li>
						<li class="menu-has-children"><a href="<c:url value='/frontend/blog/index' />">關於我們</a>
						<ul> 
							<li><a href="<c:url value='/frontend/blog/index' />">關於我們</a></li>
							<li><a href="<c:url value='/frontend/blog/index' />">最新消息</a></li>
							<li><a href="<c:url value='/frontend/blog/index' />">聯絡我們</a></li>
						</ul>
					</li>
					<li><a href="#">會員登錄</a></li>
					<li><a href="#">會員中心</a></li>
					<li><a href="#">地圖交友</a></li>
					<li><a href="#">興趣交友</a></li>
					<li><a href="#">友善環境</a></li>
					<li class="menu-has-children"><a href="<c:url value='/frontend/blog/index' />">寵物專欄</a>
						<ul> 
							<li><a href="<c:url value='/frontend/blog/index' />">主頁</a></li>
							<li><a href="<c:url value='/frontend/blog/index' />">文章查詢</a></li>
						</ul>
					</li>
					<li class="menu-has-children"><a href="">支援服務</a>
						<ul>
							<li><a href="#">客戶服務</a></li>
							<li><a href="#"></a>會員制度說明</li>
							<li><a href="#"></a>隱私權聲明</li>
							<li><a href="#"></a>法律聲明</li>
							<li><a href="#"></a>COOKIE政策</li>
						</ul>
					</li>
					<li><a href="contact.html"><i class="fas fa-user-plus" style="font-size:15px"></i> 註冊</a></li>
					<li><a href="contact.html"><i class="fas fa-user-alt" style="font-size:15px"></i> 登入</a></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>
<!-- #header -->