<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id= "gksdlwls";
	String hobby="coding";
%>

<jsp:forward page="forwardToTest2.jsp">
	<jsp:param name="id" value="<%=id %>"/>
	<jsp:param value="<%=hobby %>" name="hobby"/>
</jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
forwardTest2.jsp page!!!
</body>
</html>