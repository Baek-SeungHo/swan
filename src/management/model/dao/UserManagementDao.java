package management.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import management.model.vo.UserManagement;

public class UserManagementDao {

	public int getListCount(Connection con) {

		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from user_info";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}
	
	public ArrayList<UserManagement> selectList(Connection con, int currentPage, int limit) {
		ArrayList<UserManagement> list = new ArrayList<UserManagement>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, user_id, user_name, user_gender, user_age, user_email, user_phone "
				+ "from user_info) "
				+ "where rnum >= ? and rnum <= ?";

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				UserManagement user = new UserManagement();
				user.setUserId(rset.getString("user_id"));
				user.setUserName(rset.getString("user_name"));
				user.setUserGender(rset.getString("user_gender"));
				user.setUserAge(rset.getInt("user_age"));
				user.setUserEmail(rset.getString("user_email"));
				user.setUserPhone(rset.getString("user_phone"));
			

				list.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int deleteUser(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from user_info where user_id = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
