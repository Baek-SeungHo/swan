package poll.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import poll.model.vo.Poll;

public class PollDao {

	public int pollrating(Connection con, String rating) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update EXE_INFO set USER_GRADE = ? where user_id = 'ganjiplay'";

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rating);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("hi");
		return result;
	}

}
