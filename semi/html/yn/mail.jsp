<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/mailsend" method="post">
    <table>
        <tr><td>보내는사람</td><td><input type="text" name="from_email"></td></tr>
        <tr><td>받는사람</td><td><input type="text" name="to_email"></td></tr>
        <tr><td>제목</td><td><input type="text" name="subtitle"></td></tr>
        <tr><td>내용</td><td><input type="text" name="content"></td></tr>
    </table>
    <input type="submit" value="보내기">
</form>
</body>
</html>