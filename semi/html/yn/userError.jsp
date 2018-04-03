<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("message");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 서비스 에러</title>
</head>
<body>
<h2>에러 발생 : <%= message %></h2>
<a href="/semi/index.html">첫페이지로 이동</a>
</body>
</html>