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
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- 1 -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user-cog"></i>
						<p>登入管理</p> <i class="right fas fa-angle-left"></i>
				</a>
					<ul class="nav nav-treeview" id="tv1">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-ban"></i>
								<p>黑名單</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-key nav-icon"></i>
								<p>權限設定</p>
						</a></li>
						<li class="nav-item"><a href="＃" class="nav-link"> <i
								class="fas fa-file-alt nav-icon"></i>
								<p>圖表分析</p>
						</a></li>
					</ul></li>
				<!-- 2 -->
				<li class="nav-item"><a href="<c:url value='/pet/showAll' />" class="nav-link"> <i
						class="nav-icon fas fa-address-book"></i>
						<p>
							交友檔案管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="<c:url value='/pet/showAll' />" class="nav-link"> <i
								class="fas fa-address-card nav-icon"></i>
								<p>會員檔案</p>
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
						<li class="nav-item"><a
							href="<c:url value='/FriendlyEnvSearch' />" class="nav-link">
								<i class="fas fa-thumbtack nav-icon"></i>
								<p>友善環境管理</p>
						</a></li>
					</ul></li>

				<!-- 6 -->
				<li class="nav-item"><a
					href="<c:url value='/backend/blog/home'/>" class="nav-link"> <i
						class="nav-icon fas fa-blog"></i>
						<p>
							寵物專欄管理 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="<c:url value='/backend/blog/main'/>" class="nav-link">
								<i class="fas fa-edit nav-icon"></i>
								<p>寵物專欄管理</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value='/backend/blog/index'/>" class="nav-link">
								<i class="fas fa-edit nav-icon"></i>
								<p>文章列表</p>
						</a></li>
						<li class="nav-item"><a
							href="<c:url value='/backend/blog/recycleBin'/>" class="nav-link">
								<i class="fas fa-trash-alt nav-icon"></i>
								<p>資源回收桶</p>
						</a></li>
					</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>