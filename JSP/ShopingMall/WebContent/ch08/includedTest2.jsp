<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
 	String name= request.getParameter("name");
	String pageName= request.getParameter("pageName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	파라미터 값을 전달받아 실해되는 포함되는 페이지<%=pageName %><br>
	<b><%=name %></b> 안녕하세요 :)
	<hr>
	
</body>
</html>