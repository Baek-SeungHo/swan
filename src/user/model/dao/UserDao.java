package user.model.dao;

import java.sql.*;

import user.model.vo.User;

import static common.JDBCTemplate.*;

public class UserDao {

	public UserDao() {
	}

	public User loginCheck(Connection con, String userId, String userPwd) {

		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select *  from user_info , exe_info where user_info.user_id = exe_info.user_id "
				+ "and user_info.user_id = ? and user_info.user_pwd = ? ";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User();

				loginUser.setUserId(rset.getString("user_id"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setUserName(rset.getString("user_name"));
				loginUser.setUserGender(rset.getString("user_gender"));
				loginUser.setUserAge(rset.getInt("user_age"));
				loginUser.setUserEmail(rset.getString("user_email"));
				loginUser.setUserPhone(rset.getString("user_phone"));
				loginUser.setAdministrator(rset.getString("administrator"));
				loginUser.setUsergrade(rset.getString("user_grade"));
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginUser;
	}

	public User selectUser(Connection con, String userId) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from user_info where user_id=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				user = new User();

				user.setUserId(rset.getString("user_id"));
				user.setUserPwd(rset.getString("user_pwd"));
				user.setUserName(rset.getString("user_name"));
				user.setUserGender(rset.getString("user_gender"));
				user.setUserAge(rset.getInt("user_age"));
				user.setUserEmail(rset.getString("user_email"));
				user.setUserPhone(rset.getString("user_phone"));
				user.setAdministrator(rset.getString("administrator"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}

	public int updateUser(Connection con, User user) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update user_info set user_pwd = ?, user_gender = ?, user_age = ?, user_email = ?, user_phone = ? where user_id=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUserPwd());
			pstmt.setString(2, user.getUserGender());
			pstmt.setInt(3, user.getUserAge());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserPhone());
			pstmt.setString(6, user.getUserId());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertUser(Connection con, User user) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into user_info values (?, ?, ?, ?, ?, ?, ?, default)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setInt(5, user.getUserAge());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setString(7, user.getUserPhone());
			// pstmt.setString(8, user.getAdministrator());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
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

	public int selectCheckId(Connection con, String userId) {
		int idCount = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select count(user_id) from user_info where user_id = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				idCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return idCount;
	}

}
