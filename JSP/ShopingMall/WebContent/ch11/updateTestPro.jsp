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
	ResultSet rs=null;
	try{
		String url="jdbc:mysql://localhost:3305/covibbs";
		String sqlid="root";
		String pw="2955";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,sqlid,pw);
		
		String sql= "select id,passwd from member where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs= pstmt.executeQuery();
		
		if(rs.next()){
			String rid = rs.getString("id");
			String rpasswd= rs.getString("passwd");
			if(id.equals(rid)&&passwd.equals(rpasswd)){
				sql="update membert set name= ? where id= ?";
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			}else
				out.println("패스워드가 틀렸습니다.");
			}else
				out.println("아이디가 틀렸습니다.");
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs!=null)
					try{rs.close();}catch(SQLException se){}
				if(pstmt!=null)
					try{pstmt.close();}catch(SQLException se){}
				if(conn!=null)
					try{conn.close();}catch(SQLException se){}
			
		}%>
		
</body>
</html>