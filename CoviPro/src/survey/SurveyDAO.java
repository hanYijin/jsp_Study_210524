package survey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	//	String sql= "INSERT INTO `covibbs`.`question1` (`answer2`) VALUES ('answer2')";
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
	
}
