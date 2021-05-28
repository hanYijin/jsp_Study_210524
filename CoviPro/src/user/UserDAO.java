package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			Class.forName(DBInfo.mysql_class);
			conn=DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPW) {
		String sql= "SELECT userPW FROM user WHERE userID= ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; //회원 로그인 성공
				}
				else
					return 0; //비밀번호 불일치
			}
			return -1; // 아이디가 없음 회원이 아님
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception ex){
				
			}
		}
		return -2; //데이터베이스 오류
	}
	public int join(User user) {
		String sql= "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPW());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			return pstmt.executeUpdate();// 성공적으로 반영시 0 이상의 숫자를 반환
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception ex){
				
			}
		}
		return -1; // 데이터베이스 오류
	}

}
