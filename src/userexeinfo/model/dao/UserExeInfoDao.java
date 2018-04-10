package userexeinfo.model.dao;

import java.sql.*;

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

}
