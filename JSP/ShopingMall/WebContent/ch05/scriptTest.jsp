<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!//선언문: 전역변수 선언 
		String str = "전역 변수입니다.";
	%>
	<%!//선언문: 메소드 선언
		String getStr(){
		return str;
	}
	%>
	<%String str2="지역변수 입니다."; %>
	스크립트릿에서 선언한 변수 str2는 <%=str2 %><br>
	선언문에서 선언한 변수 str1는 <%=getStr() %><br>
	str는 <%=str %>
</body>
</html>