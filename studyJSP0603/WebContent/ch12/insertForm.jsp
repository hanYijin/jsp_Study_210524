<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert DataBase</title>
</head>
<body>
	<form method="post" action="insertMemberPro.jsp">
		ID <input type="text" name="id" maxlength="50"><br>
		PassWord <input type="password" name="pw" maxlength="16"><br>
		Name <input type="text" name="name" maxlength="10"><br>
		<input type="submit" value="화원가입">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>