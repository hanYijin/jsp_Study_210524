<%@page import="ch12.member.LoginDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="ch12.member.LoginDataBean">
	<jsp:setProperty name="member" property="*"/>
	
<% member.setDate(new Timestamp(System.currentTimeMillis()));
	LoginDBBean login=LoginDBBean.getInstance();
	login.insertMember(member);
%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty property="id" name="member"/> 회원가입완료
</body>
</html>