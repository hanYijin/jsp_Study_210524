package ch12.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDBBean {
	private static LoginDBBean instance= new LoginDBBean();
	public static LoginDBBean getInstance() {
		return instance;
	}
	private LoginDBBean() {}
	
	private Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stuJSP?useUnicode=true&characterEncoding=utf-8","root","1234");
		return conn;
	}
	public void insertMember(LoginDataBean member)throws Exception {
		Connection conn=null;
		PreparedStatement pstmt = null;
		try { 
			conn=getConnection();
			pstmt=conn.prepareStatement("insert into member values(?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getDate());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally{
				if(pstmt!=null)
					try{pstmt.close();}catch(SQLException e){}
				if(conn!=null)
					try{conn.close();}catch(SQLException e){}
				
		}
		
	}
	public int userCheck(String id, String pw)throws Exception {
		Connection conn=null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String dbpw="";
		int x=-1;
		
		try {
			conn= getConnection();
			pstmt= conn.prepareStatement("select pw from member where id= ?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw=rs.getString("pw");
				if(dbpw.equals(pw)) {
					x=1; //인증 성공

				}else {
					x=0;//비밀번호 틀림
				}
			}else {
				x=-1; //해당 아이디가 없음
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException e){}
			if(conn!=null)
				try{conn.close();}catch(SQLException e){}
			if(rs!=null)
				try{rs.close();}catch(SQLException e){}
		}
		return x;
	}
}
