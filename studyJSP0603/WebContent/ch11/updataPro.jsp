<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String cpw = request.getParameter("cpw");	
	String name = request.getParameter("name");
	
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stuJSP?useUnicode=true&characterEncoding=utf-8","root","1234");
		String sql="select id, pw from member where id= ?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs= pstmt.executeQuery();
		
		if(rs.next()){
			String rid= rs.getString("id");
			String rpw= rs.getString("pw");
			if(id.equals(rid) && pw.equals(rpw)){
				sql="update member set name= ?, pw=? where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, cpw);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
			
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		수정완료
	<% }else
		out.println("패스원드가 틀림");
		}else
			out.println("아이디가 틀림");
		
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)
			try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)
			try{conn.close();}catch(SQLException e){}
		if(rs!=null)
			try{rs.close();}catch(SQLException e){}
	}
		%>
	
</body>
</html>