package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.DBInfo;

public class CoviDataDAO {
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	public ArrayList<CoviData> addrSelect(){
		ArrayList<CoviData> list = new ArrayList<CoviData>();
		String sql = "select addr, count(*) as addrCount from seoulcovid ";
		String addr;
		int addrCount =0;
		try {
			Class.forName(DBInfo.mysql_class);
			conn=DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CoviData data = new CoviData();
				data.setAddr(rs.getString("addr"));
				data.setAddrcount(rs.getInt("addrCount"));
				list.add(data);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception ex){
				
			}
		}
		return list;
	}

}
