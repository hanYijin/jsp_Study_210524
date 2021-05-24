<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="forwardTest.jsp">
		id:<input type="text" name="id"><br>
		hobby:
		<select name="hobby">
			<option value="watch tv">watch tv</option>
			<option value="swimming">swimming</option>
			<option value="read a book">read a book</option>
		</select><br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>