package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.DBInfo;

public class CommentDAO {
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public CommentDAO() {
		try {
			Class.forName(DBInfo.mysql_class);
			conn=DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getCommentID() {
		String sql="select commentID from comment order by commentID desc";
		try {
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 댓글
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int writeComment(String userID, String commentcontent) {
		String sql="insert into comment (userID,commentcontent,commentID) value(?,?,?)";
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, commentcontent);
			pstmt.setInt(3, getCommentID());
		
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
