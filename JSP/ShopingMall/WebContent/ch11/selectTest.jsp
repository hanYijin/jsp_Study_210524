<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td width="100">ID</td>
		<td width="100">Password</td>
		<td width="100">Name</td>
		<td width="250">가입일자</td>
	</tr>
	<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String url="jdbc:mysql://localhost:3305/covibbs";
		String sid="root";
		String pw="2955";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,sid,pw);
		
		String sql="select * from member";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			String id= rs.getString("id");
			String passwd= rs.getString("passwd");
			String name= rs.getString("name");
			Timestamp register= rs.getTimestamp("reg_date");
		%>
		<tr>
			<td width="100"><%=id %></td>
			<td width="100"><%=passwd %></td>
			<td width="100"><%=name %></td>
			<td width="250"><%=register.toString() %></td>
		</tr>
		<% }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)
				try{rs.close();}catch(SQLException se){}
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException se){}
			if(conn!=null)
				try{conn.close();}catch(SQLException se){}
	
	}
	%>
</table>
</body>
</html>