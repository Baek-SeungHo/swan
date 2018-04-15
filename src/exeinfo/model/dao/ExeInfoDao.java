package exeinfo.model.dao;

import java.sql.*;

import exeinfo.model.vo.ExeInfo;

import static common.JDBCTemplate.*;

public class ExeInfoDao {

	public int insertExeInfo(Connection con, ExeInfo exeinfo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into exe_info values (?, default, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, exeinfo.getUserId());
			pstmt.setInt(2, exeinfo.getUserHeight());
			pstmt.setInt(3, exeinfo.getUserWeight());
			pstmt.setInt(4, exeinfo.getUserBmi());
			pstmt.setInt(5, exeinfo.getUserGoal());
			pstmt.setDate(6, exeinfo.getUserStartdate());
			pstmt.setDate(7, exeinfo.getUserEnddate());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ExeInfo selectUserId(Connection con, String userId) {
		ExeInfo exeinfo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from exe_info where user_id=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				exeinfo = new ExeInfo();
				
				exeinfo.setUserId(rset.getString("user_id"));
				exeinfo.setUserGrade(rset.getString("user_grade"));
				exeinfo.setUserHeight(rset.getInt("user_height"));
				exeinfo.setUserWeight(rset.getInt("user_weight"));
				exeinfo.setUserBmi(rset.getInt("user_bmi"));
				exeinfo.setUserGoal(rset.getInt("user_goal"));
				exeinfo.setUserStartdate(rset.getDate("user_startdate"));
				exeinfo.setUserEnddate(rset.getDate("user_enddate"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return exeinfo;
	}

}
