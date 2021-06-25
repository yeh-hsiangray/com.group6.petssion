<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #fff281;
	font-family: verdana;
	font-size: 12pt;
}

.btn.btn-primary {
	background-color: #ed5e25;
	border: none;
}

.thumbnail {
	border-radius: 1em;
	border: none;
	margin-bottom: 25px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}
</style>

</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>寵物列表</h1>
			</div>
		</div>
	</section>
	<div align='center'>
		<a href="<c:url value='/' />">新增寵物</a> <a href="<c:url value='/' />">回首頁</a>
	</div>
	<hr
		style="width: 1400px; height: 3px; border: none; color: #ed5e25; background-color: #ed5e25;">

	<c:choose>
		<c:when test="${empty pet}">
	    <p align="center">沒有任何寵物資料<br>
		</c:when>
		<c:otherwise>

			<section class="container">
				<div class="row">
					<c:forEach var='pets' items='${pet}'>
						<div class="col-md-4">
							<div class="thumbnail" style="height: 400px">
								<div class="caption">
									<p>
										<b style='font-size: 20px; color: #ed5e25;'>${pets.name}</b>
									</p>
									<p>性別: ${pets.gender}</p>
									<p>年齡: ${pets.age}</p>
									<p>品種: ${pets.type.name}-${pets.kind.name}</p>
									<p>喜愛食物: ${pets.food.name}</p>
									<p>個性: ${pets.personality.name}</p>
									<br>
									<p>
										<a href="<spring:url value='product?id=${product.bookId}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>編輯
										</a> <a
											href="<spring:url value='/product?id=${product.bookId}' />"
											class="btn btn-primary"> <span
											class="glyphicon-info-sigh glyphicon"></span>刪除
										</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		</c:otherwise>
	</c:choose>
</body>
</html>