package survey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import post.Post;
import user.DBInfo;

public class SurveyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public SurveyDAO() {
		try {
			Class.forName(DBInfo.mysql_class);
			conn=DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int Submit(String answer, String sql) {
		String SQL =sql;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);

			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int allCount() {
		String sql="select count(*) from question1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int result(String answer, String question) {
		String sql="select count("+answer+") from "+question;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
