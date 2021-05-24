<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="ifTestPro.jsp">
		name: <input type="text" name="name">
		phone: 
		<select name="local">
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="강원">강원</option>
		</select>
		-<input type="text" name="tel"><br>
		<input type="submit" value="입력완료">
	</form>

</body>
</html>