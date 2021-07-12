<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index.html" class="brand-link"> <img
		src="<c:url value='/Sources/dist/img/PetssionLogo.png' />"
		style="width: 200px; text-align: center;">
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="<c:url value='/Sources/dist/img/user-128x128.jpg' />"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">Admin</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<!-- 1 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user-cog"></i>
						<p>登入管理</p> <i class="right fas fa-angle-left"></i>
				</a>
					<ul class="nav nav-treeview" id="tv1">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-user-friends"></i>
								<p>使用者列表</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-ban"></i>
								<p>黑名單</p>
						</a></li>
					</ul></li>
				<!-- 2 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-address-book"></i>
						<p>
							交友檔案管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-address-card nav-icon"></i>
								<p>交友檔案</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-ban nav-icon"></i>
								<p>黑名單</p>
						</a></li>
					</ul></li>
				<!-- 3 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-paw"></i>
						<p>
							寵物檔案管理<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-dog nav-icon"></i>
								<p>寵物檔案</p>
						</a></li>
					</ul></li>
				<!-- 4 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-restroom""></i>
						<p>
							配對管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-biking nav-icon"></i>
								<p>興趣管理</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-coffee nav-icon"></i>
								<p>興趣管理2</p>
						</a></li>
					</ul></li>
				<!-- 5 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-map-marker-alt"></i>
						<p>
							友善環境管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-thumbtack nav-icon"></i>
								<p>增刪改查</p>
						</a></li>
					</ul></li>

				<!-- 6 -->
				<li class="nav-item"><a href="<c:url value='/backend/blog/home'/>" class="nav-link"> <i
						class="nav-icon fas fa-blog"></i>
						<p>
							寵物專欄管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-edit nav-icon"></i>
								<p>文章列表</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-trash-alt nav-icon"></i>
								<p>資源回收桶</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-edit nav-icon"></i>
								<p>文章備份</p>
						</a></li>
					</ul></li>
				<!-- 7 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-tools"></i>
						<p>
							後台設定 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-key nav-icon"></i>
								<p>權限設定</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-shield-alt nav-icon"></i>
								<p>防護設定</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-ban nav-icon"></i>
								<p>黑名單</p>
						</a></li>
					</ul></li>
				<!-- 8 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-globe"></i>
						<p>
							行銷管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-file-alt nav-icon"></i>
								<p>圖表分析</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-map fas  nav-icon"></i>
								<p>關鍵字設定</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-bookmark nav-icon"></i>
								<p>SEO自然排名</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-balance-scale-left nav-icon"></i>
								<p>相似網站比較</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-info-circle nav-icon"></i>
								<p>Google Analytics</p>
						</a></li>
					</ul></li>
					</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
