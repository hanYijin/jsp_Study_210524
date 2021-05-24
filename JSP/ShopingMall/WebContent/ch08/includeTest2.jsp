<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	String name="한이진";
	String pageName="includedTest2.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	포함되는 페이지 includeTest2.jsp 페이지 <br>
	<hr>
	<jsp:include page="<%=pageName %>" flush= "false">
		<jsp:param value="<%=name %>" name="name"/>
		<jsp:param value="<%=pageName %>" name="pageName"/>
	</jsp:include>
	
	includeTes2.jsp의 나머지 내용입니다.
</body>
</html>