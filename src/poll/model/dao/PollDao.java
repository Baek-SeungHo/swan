package poll.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import poll.model.vo.Poll;
import user.model.vo.User;

public class PollDao {

	public PollDao() {
	}

	public int pollrating(Connection con, String rating, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update EXE_INFO set USER_GRADE = ? where user_id = ?";

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rating);
			pstmt.setString(2, userid);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public User grade(Connection con, String userid) {
		User poll = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from exe_info where user_id = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			System.out.println("Hi");
			if(rset.next()) {
				
				poll= new User();
				
				poll.setUsergrade(rset.getString("user_grade"));
				
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
			close(rset);
		}

		return poll;
	}

}
