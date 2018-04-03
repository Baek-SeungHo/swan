package user.model.dao;

import java.io.FileReader;
import java.sql.*;
import java.util.Properties;

import user.model.vo.User;

import static common.JDBCTemplate.*;

public class UserDao {
	private Properties prop;
	
	public UserDao() {
		prop = new Properties();
		
		try {
			prop.load(new FileReader(
					UserDao.class.getResource("/dbresource/user.properties").getPath()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User loginCheck(Connection con, String userId, String userPwd) {
		
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("loginCheck"));
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new User();
				
				loginUser.setUserId(rset.getString("user_id"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setUserName(rset.getString("user_name"));
				loginUser.setUserGender(rset.getString("user_gender"));
				loginUser.setUserAge(rset.getInt("user_age"));
				loginUser.setUserEmail(rset.getString("user_email"));
				loginUser.setUserPhone(rset.getString("user_phone"));
				loginUser.setAdministrator(rset.getString("administrator"));
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public User selectUser(Connection con, String userId) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("selectUser"));
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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
		}finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}

	public int updateUser(Connection con, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("updateUser"));
			pstmt.setString(1, user.getUserPwd());
			pstmt.setString(2, user.getUserGender());
			pstmt.setInt(3, user.getUserAge());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserPhone());
			pstmt.setString(6, user.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertUser(Connection con, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("insertUser"));
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());			
			pstmt.setString(4, user.getUserGender());
			pstmt.setInt(5, user.getUserAge());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setString(7, user.getUserPhone());
			pstmt.setString(8, user.getAdministrator());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteUser(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("deleteUser"));
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectCheckId(Connection con, String userId) {
		int idCount = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("selectCheckId"));
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				idCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}finally {
			close(rset);
			close(pstmt);
		}
		return idCount;
	}

}