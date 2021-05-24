<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>java 현재 시스템 시간 가져오기</h2>
	<%
	Timestamp now = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat format = new SimpleDateFormat("yyy-MM-DD");
	SimpleDateFormat format2= new SimpleDateFormat("hh:mm:ss");
	String strDate = format.format(now);
	String strTime = format2.format(now);
	%>
	오늘은 <%=strDate %> 현재 시간: <%=strTime %>입니다.
</body>
</html>