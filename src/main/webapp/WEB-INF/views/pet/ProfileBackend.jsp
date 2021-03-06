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
<title>ProfileBackend</title>

<!--imports-->
<%@include file="../commons/backend_imports.jsp"%>
<style type="text/css">
/* body { */
/* 	font-family: "Helvetica Neue", Helvetica, Arial; */
/* 	font-size: 14px; */
/* 	line-height: 20px; */
/* 	font-weight: 400; */
/* 	color: #3b3b3b; */
/* 	-webkit-font-smoothing: antialiased; */
/* 	font-smoothing: antialiased; */
/* 	background: #fff281; */
/* } */

/* @media screen and (max-width: 580px) { */
/* 	body { */
/* 		font-size: 16px; */
/* 		line-height: 22px; */
/* 	} */
/* } */

/* .wrapper { */
/* 	margin: 0 auto; */
/* 	padding: 40px; */
/* 	max-width: 1200px; */
/* } */
.table {
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
}

@media screen and (max-width: 580px) {
	.table {
		display: block;
	}
}

.row {
	display: table-row;
	background: #f6f6f6;
}

.row:nth-of-type(odd) {
	background: #e9e9e9;
}

.row.header {
	font-weight: 900;
	color: #ffffff;
	background: #ed5e25;
}

@media screen and (max-width: 580px) {
	.row {
		padding: 14px 0 7px;
		display: block;
	}
	.row.header {
		padding: 0;
		height: 6px;
	}
	.row.header .cell {
		display: none;
	}
	.row .cell {
		margin-bottom: 10px;
	}
	.row .cell:before {
		margin-bottom: 3px;
		content: attr(data-title);
		min-width: 98px;
		font-size: 10px;
		line-height: 10px;
		font-weight: bold;
		text-transform: uppercase;
		color: #969696;
		display: block;
	}
}

.cell {
	padding: 6px 10px;
	display: table-cell;
	text-align: center;
}

@media screen and (max-width: 580px) {
	.cell {
		padding: 2px 10px;
		display: block;
	}
}

.ti1 {
	font-size: 18px;
	text-align: center;
}
</style>
</head>
<body
	class="hold-transition sidebar-mini layout-fixed layout-footer-fixed">

	<!--header -->
	<%@include file="../commons/backend_header.jsp"%>

	<!-- sidebar start -->
	<%@include file="../commons/backend_sidebar.jsp"%>
	<!-- sidebar end -->

	<!-- Main content Start-->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6"></div>
				</div>
			</div>
			<!-- /.container-fluid -->

			<div class="card">
				<div class="card-header">
					<!-- /.card-header -->
					<div class="card-body">
						<br> <br>
						<form action="<c:url value='/' />pet/searchUsers">
							<div class="ti1">
								<label>????????????:</label> <select name="searchType"
									style="font-size: 20px;">
									<option value="?????????">?????????</option>
									<option value="??????">??????</option>
									<option value="??????">??????</option>
									<option value="??????">??????</option>
									<option value="??????">??????</option>
									<option value="????????????">????????????</option>
									<option value="email">email</option>
									<option value="????????????">????????????</option>
									<option value="????????????">????????????</option>
									<option value="??????">??????</option>
									<option value="??????">??????</option>
								</select> <input type="text" name="searchWord" autocomplete="off"
									style="font-size: 18px;" />
								<button type="submit"
									style="border: none; box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);">
									<img src="<c:url value='/' />img/search.png" width="16px;">
								</button>
							</div>
						</form>
						<br>
						<c:choose>
							<c:when test="${empty users}">
								<p align="center">
									??????????????????<br>
							</c:when>
							<c:otherwise>
								<div class="wrapper">

									<div class="table">

										<div class="row header">
											<div class="cell" style="width: 4.5%">??????</div>
											<div class="cell" style="width: 6%">??????</div>
											<div class="cell" style="width: 4.5%">??????</div>
											<div class="cell" style="width: 8%">??????</div>
											<div class="cell" style="width: 24%">??????</div>
											<div class="cell" style="width: 8%">????????????</div>
											<div class="cell" style="width: 10%">email</div>
											<div class="cell" style="width: 8%">????????????</div>
											<div class="cell" style="width: 7%">????????????</div>
											<div class="cell" style="width: 10%">??????/????????????</div>
										</div>


										<c:forEach var='user' items='${users}' varStatus="Status">
											<div class="row">
												<div class="cell" data-title="??????">${Status.count}</div>
												<div class="cell" data-title="??????">${user.name}</div>
												<div class="cell" data-title="??????">${user.gender}</div>
												<div class="cell" data-title="??????">${user.birthday}</div>
												<div class="cell" data-title="??????">${user.address}</div>
												<div class="cell" data-title="????????????">${user.mobilephone}</div>
												<div class="cell" data-title="email">${user.email}</div>
												<div class="cell" data-title="????????????">${user.regdate}</div>
												<div class="cell" data-title="????????????">${user.blockade}</div>
												<div class="cell" data-title="??????/????????????">
													<button
														style="border: none; box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.3);"
														onclick="window.open('<c:url value="/" />pet/memberProfile/${user.id}')">
														<img src="<c:url value='/' />img/user.png">
													</button>
													&nbsp&nbsp&nbsp&nbsp
													<button
														style="border: none; box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.3);"
														onclick="window.open('<c:url value="/" />pet/PetProfile/${user.id}')">
														<img src="<c:url value='/' />img/pet.png" width="24px">
													</button>
												</div>
											</div>
										</c:forEach>

									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
	</div>
	</div>
	</div>
	</section>


	<!-- content -->

	<!--footer -->
	<%@include file="../commons/backend_footer.jsp"%>
</body>

</html>