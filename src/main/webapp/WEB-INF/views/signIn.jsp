<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form action="signIn" method="post">
				<div >
					<label class="t1" for="account">帳號:</label> <input type="text"
						name="account">
				</div>
				<div >
					<label class="t1" for="password">密碼:</label> <input type="password"
						name="password">
				</div>
				<div >
					<input type="submit" value="送出">
				</div>
				<p>
					<input type="checkbox" name="remember">記住我
				</p>
			</form>

</body>
</html>