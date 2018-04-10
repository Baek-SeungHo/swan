package exerecommend.model.dao;

import java.sql.*;
import java.util.ArrayList;

import exerecommend.model.vo.Exerecommend;

import static common.JDBCTemplate.*;

public class ExerecommendDao {

	public ArrayList<Exerecommend> search(Connection con, String sportbody) {
		ArrayList<Exerecommend> sportList = new ArrayList<Exerecommend>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query="select * from exe_recommend where sport_body = ?";
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sportbody);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Exerecommend e = new Exerecommend();
				e.setSportCode(rset.getString("sport_code"));
				e.setSportName(rset.getString("sport_name"));
				e.setSportBody(rset.getString("sport_body"));
				e.setSportLook(rset.getInt("sport_look"));
				e.setSportDate(rset.getDate("sport_date"));
				
				sportList.add(e);
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return sportList;
			
			
	}

}
