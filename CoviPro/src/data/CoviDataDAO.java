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
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			
		}
		return list;
	}

}
