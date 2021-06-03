
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	String name= request.getParameter("name");
	Timestamp time = new Timestamp(System.currentTimeMillis());
	
	Connection conn= null;
	PreparedStatement pstmt= null;
	String str="";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stuJSP?useUnicode=true&characterEncoding=utf-8","root","1234");
		String sql= "insert into stuJSP.member values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, time);
		pstmt.executeUpdate();
		
		str="member 추가 완료!";
	}catch(Exception e){
		e.printStackTrace();
		str="데이터베이스 에러";
	}finally{
		if(pstmt!=null)
			try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)
			try{conn.close();}catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=str %>
</body>
</html>