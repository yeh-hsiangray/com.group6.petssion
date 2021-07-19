<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
ul {
	font-size: 20px !important;
}

.fsh {
	font-size: 20px !important;
} *
</style> 

<!-- #header -->
<header id="header" id="home">
	<div class="container main-menu">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="<c:url value='/frontend/main/index' />"><img src="<c:url value='/Sources/img/logo.png' />"
					style="height: 50px;"></a>
			</div>
			<nav id="nav-menu-container" style="font-size:20px;">
				<ul class="nav-menu">
					<!-- index -->
					<li><a href="<c:url value='/frontend/main/index' />" class="fsh">首頁</a></li>

					<!-- about us -->
					<li class="menu-has-children"><a href="<c:url value='#' />"
						class="fsh">關於我們</a>
						<ul>
							<li><a href="<c:url value='/frontend/main/aboutUs' />">關於我們</a></li>
							<li><a href="<c:url value='/frontend/main/news' />">最新消息</a></li>
							<li><a href="<c:url value='/frontend/main/contact' />">聯絡我們</a></li>
						</ul></li>
					
					<!-- 	登入前隱藏會員中心和興趣交友，登入後顯示	 -->
					<c:if test="${userId!=null}">
					<!-- membership -->
					<li class="menu-has-children"><a href="#"
						class="fsh">會員中心</a>
						<ul>
							<li><a href="<c:url value='/user/memberCenter' />" class="fsh">會員資料</a></li>
							<li><a href="<c:url value='/pet/showUserPets' />" class="fsh">寵物列表</a></li>
							<c:if test="${userManager>1}">
							<li><a href="<c:url value='/backend/blog/home' />" class="fsh">後台管理</a></li>
							</c:if>
<!-- 							<li><a href="#"></a>寵物檔案</li> -->
<!-- 							<li><a href="#"></a>購買VIP</li> -->
						</ul></li>

						<!-- make friends via map -->
<!-- 					<li><a href="#" class="fsh">地圖交友</a></li>
 -->
					<!-- make friends via interests -->
					<li class="menu-has-children"><a href="#"
						class="fsh">興趣交友</a>
						<ul>
							<li><a href="<c:url value='/match/Notify' />" class="fsh">交友通知</a></li>
							<li><a href="<c:url value='/match/showMatch' />" class="fsh">搜尋交友配對</a></li>
							</ul></li>
</c:if>
					<!-- friendly environment-->
					<li><a href="<c:url value='/FriendlyEnvSearchFR' />" class="fsh">友善環境</a></li>

					<!-- Blog-->
					<li><a href="<c:url value='/frontend/blog/index' />"
						class="fsh">寵物專欄</a> <!-- support & service-->
					<li class="menu-has-children"><a href="" class="fsh">支援服務</a>
						<ul>
							<li><a href="#"></a>客戶服務</li>
							<li><a href="#"></a>會員制度說明</li>
							<li><a href="<c:url value='/frontend/main/contact' />"></a>隱私權聲明</li>
							<li><a href="<c:url value='/frontend/main/legal' />"></a>法律聲明</li>
							<li><a href="<c:url value='/frontend/main/cookie' />"></a>COOKIE政策</li>
						</ul></li>

					<!--  sign up(登入後隱藏註冊、登入，顯示登出選項 -->
						<c:if test="${userId==null}">
					<li><a href="<c:url value='/registered' />" class="fsh"><i
							class="fas fa-user-plus"></i> 註冊</a></li>

					<!--  login -->
					<li><a href="<c:url value='/signIn' />" class="fsh"><i
							class="fas fa-user-alt"></i> 登入</a></li>
							</c:if>
							
					<!--  logout	-->
					<c:if test="${userId!=null}">
							<li class="fsh" style="color: seashell;">你好,${userName}</li>
							<li><a href="<c:url value='/signIn/logout' />" class="fsh"><i
							class="fas fa-user-alt"></i> 登出</a></li>
							</c:if>
							
							
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>
<!-- #header -->