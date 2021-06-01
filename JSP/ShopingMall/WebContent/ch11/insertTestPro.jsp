<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id= request.getParameter("id");
	String passwd= request.getParameter("passwd");
	String name= request.getParameter("name");
	Timestamp register= new Timestamp(System.currentTimeMillis());
	
	Connection conn=null;
	PreparedStatement pstmt= null;
	String str="";
	try{
		String url="jdbc:mysql://localhost:3305/covibbs";
		String sqlid="root";
		String pw="2955";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,sqlid,pw);
		
		String sql= "insert into member values(?, ? ,?, ?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, register);
		pstmt.executeUpdate();
		
		str="member 태이블에 새로운 레토드 추가했습니다.";
		
	}catch(Exception e){
		e.printStackTrace();
		str="Database error";
	}finally{
		if(pstmt!=null)
			try{pstmt.close();}catch(SQLException se){}
		if(conn!=null)
			try{conn.close();}catch(SQLException se){}
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