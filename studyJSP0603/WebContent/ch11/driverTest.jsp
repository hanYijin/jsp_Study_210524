<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
	Connection conn= null;
	try{
		String url="jdbc:mysql://localhost:3306/stuJSP";
		String id="root";
		String pw="1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,id,pw);
		out.println("제대로 연결되었습니다.");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>