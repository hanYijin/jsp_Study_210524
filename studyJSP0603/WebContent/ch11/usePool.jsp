<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td width="100">id</td>
		<td width="100">pw</td>
		<td width="100">name</td>
		<td width="250">date</td>
	</tr>
	<%
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try{
			Context initCtx = new InitialContext();
			Context envCtx= (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/stuJSP");
			conn= ds.getConnection();
			
			String sql="select *from member";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				String id=rs.getString("id");
				String pw= rs.getString("pw");
				String name= rs.getString("name");
				Timestamp date= rs.getTimestamp("reg_data");
			
	%>
	<tr>
		<td width="100"><%=id %></td>
		<td width="100"><%=pw%></td>
		<td width="100"><%=name %></td>
		<td width="250"><%=date.toString() %></td>
	</tr>
	<%		}
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
</table>
</body>
</html>