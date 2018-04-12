package userexeinfo.model.dao;

import java.sql.*;
import java.util.ArrayList;

import userexeinfo.model.vo.UserExeInfo;

import static common.JDBCTemplate.*;

public class UserExeInfoDao {

	public int insertUserExeInfo(Connection con, UserExeInfo userexeinfo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into user_exe_info values (?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userexeinfo.getUserId());
			pstmt.setString(2, userexeinfo.getSportCode());
			pstmt.setString(3, userexeinfo.getSportNum());
			pstmt.setDate(4, userexeinfo.getSportDate());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	}

	public ArrayList<UserExeInfo> searchTable(Connection con, String userid, String sportdate) {
		ArrayList<UserExeInfo> sportTable = new ArrayList<UserExeInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query="select * from user_exe_info where user_id = ? and sport_date = ?";
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, sportdate);			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				UserExeInfo e = new UserExeInfo();
				e.setUserId(rset.getString("user_id"));
				e.setSportCode(rset.getString("sport_code"));
				e.setSportNum(rset.getString("sport_num"));
				e.setSportDate(rset.getDate("sport_date"));
				
				sportTable.add(e);
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return sportTable;
	}

}
