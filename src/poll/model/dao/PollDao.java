package poll.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import poll.model.vo.Poll;

public class PollDao {
	
	public PollDao() {}

	public int pollrating(Connection con, String rating ,String userid ) {
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
	
	
}
