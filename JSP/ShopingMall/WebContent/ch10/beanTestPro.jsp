<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="testBean" class="ch10.bean.TestBean">
	<jsp:setProperty name="testBean" property="name"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자바빈을 사용하는 jsp page</h2>
name: <jsp:getProperty property="name" name="testBean"/>
</body>
</html>