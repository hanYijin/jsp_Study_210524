<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>
<%@ page errorPage="error.jsp" %>

<% 
	Date date = new Date();
	SimpleDateFormat simpleDate= new SimpleDateFormat("yyyy-MM-dd");
	String strdate= simpleDate.format(date);
%>
	보통의 jsp 페이지의 형태입니다.<br>
	
	오늘 날짜는 <%=strdat %>입니다.
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>