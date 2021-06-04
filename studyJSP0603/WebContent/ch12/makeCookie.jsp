<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String cookieName="id";
	Cookie cookie = new Cookie(cookieName,"hanyj");
	cookie.setMaxAge(60*2);
	response.addCookie(cookie);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	"<%=cookieName %>" 쿠키가 생성 되었습니다.<br>
	<form method="post" action="useCookie.jsp">
		<input type="submit" value="쿠키 확인">
	</form>
</body>
</html>