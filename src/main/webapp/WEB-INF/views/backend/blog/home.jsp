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
<!-- Author Meta -->
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>後台：寵物專欄首頁</title>

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

	<!-- content -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">寵物專欄首頁</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item active">寵物專欄首頁</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">

					<!-- small box1 -->
					<div class="col-lg-3 col-6">
						<div class="small-box bg-warning">
							<div class="inner">
								<h3>${articleCount}</h3>
								<p>文章數量</p>
							</div>
							<div class="icon">
								<i class="fas fa-file-alt"></i>
							</div>
							<a href="<c:url value='/backend/blog/index' />"
								class="small-box-footer">查看文章列表<i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->

					<!-- small box 2 -->
					<div class="col-lg-3 col-6">

						<div class="small-box bg-danger">
							<div class="inner">
								<h3>${binCount}</h3>

								<p>回收桶文章數量</p>
							</div>
							<div class="icon">
								<i class="fas fa-layer-plus"></i>
							</div>
							<a href="<c:url value='/backend/blog/recycleBin' />"
								class="small-box-footer">更多資訊 <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->

					<!-- small box 3 -->
					<div class="col-lg-3 col-6">
						<div class="small-box bg-info">
							<div class="inner">
								<h3>${totolHitCount}</h3>
								<p>總瀏覽人數</p>
							</div>
							<div class="icon">
								<i class="fas fa-user-edit"></i></i>
							</div>
							<a href="<c:url value='/backend/blog/index' />"
								class="small-box-footer">更多資訊 <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->

					<!-- small box 4 -->
					<div class="col-lg-3 col-6">
						<div class="small-box bg-success">
							<div class="inner">
								<h3>
									0<sup style="font-size: 20px">%</sup>
								</h3>

								<p>平均瀏覽比例</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="<c:url value='/backend/blog/index' />"
								class="small-box-footer">更多資訊 <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->


				</div>
				<!-- /.row -->
				<section class="content">
					<div class="container-fluid">
						<!-- Info boxes -->
						<div class="row">
							<div class="col-12 col-sm-6 col-md-3">
								<div class="info-box mb-3"
									onclick='location.href="<c:url value='/backend/blog/editor' />"'>
									<span class="info-box-icon bg-info elevation-1"><i
										class="fas fa-folder-plus"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">新增文章</span>
									</div>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->

							<!-- /.col -->
							<div class="col-12 col-sm-6 col-md-3">
								<div class="info-box mb-3"
									onclick='location.href="<c:url value='/backend/blog/index' />"'>
									<span class="info-box-icon bg-danger elevation-1"><i
										class="fas fa-search"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查詢文章</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->

							<!-- fix for small devices only -->
							<div class="clearfix hidden-md-up"></div>

							<div class="col-12 col-sm-6 col-md-3">
								<div class="info-box mb-3">
									<span class="info-box-icon bg-success elevation-1"><i
										class="fas fa-folder-minus"></i></span>

									<div class="info-box-content">
										<span class="info-box-text">刪除文章</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
							<div class="col-12 col-sm-6 col-md-3">
								<div class="info-box mb-3">
									<span class="info-box-icon bg-warning elevation-1"><i
										class="fas fa-trash-alt"></i></span>

									<div class="info-box-content">
										<span class="info-box-text">文章資源回收桶</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- content -->
				</section>

				<!--footer -->
				<%@include file="../../commons/backend_footer.jsp"%>
</body>

</html>