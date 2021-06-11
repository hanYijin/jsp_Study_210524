package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.DBInfo;



public class VaccineDAO {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<Vaccine> select(String addr){
		ArrayList<Vaccine> list = new ArrayList<Vaccine>();
		String sql="select * from covibbs.vaccine where addr like '"+addr+"%'";
		try {
			Class.forName(DBInfo.mysql_class);
			conn=DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Vaccine data = new Vaccine();
				data.setIdx(rs.getInt("idx"));
				data.setCentertype(rs.getString("type"));
				data.setCenterName(rs.getString("centerName"));
				data.setOperation(rs.getString("operation"));
				data.setFacility(rs.getString("facility"));
				data.setPostNum(rs.getString("postNum"));
				data.setAddr(rs.getString("addr"));
				data.setTel(rs.getString("tel"));
				list.add(data);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException e) {}
			if(conn!=null)
				try {conn.close();}catch(SQLException e) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}

}
