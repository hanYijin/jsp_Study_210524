<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id= request.getParameter("id");
	String hobby= request.getParameter("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	forwardToTest.jsp입니다.<br>
	<b><%=id %></b> is hobby <%=hobby %>.
</body>
</html>