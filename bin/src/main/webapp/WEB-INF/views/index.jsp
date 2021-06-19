<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="webjars/jquery/3.5.1/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'  />">
<meta charset="UTF-8">
<title>Spring Boot 範例</title>
</head>
<body>
<div align='center'>
    <h2>Spring Boot 範例 03-29</h2>
    <h2>${pageContext.request.contextPath}</h2>
    <h2><c:url value="/" /></h2>
    <hr>
    <a href="<c:url value='/hello' />?name=Lisa"> Hello </a><br> 
    <a href="<c:url value='/ch02/getWebImages' />">Penelope_Cruz </a><br> 
 </div>   
</body>
</body>
</html>
