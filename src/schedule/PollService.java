package poll.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import poll.model.dao.PollDao;
import poll.model.vo.Poll;
import user.model.vo.User;

public class PollService {

	public PollService() {
	}

	public int pollrating(String Rating, String userid) {
		int result = 0;
		Connection con = getConnection();
		result = new PollDao().pollrating(con, Rating, userid);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public User GradeService(String userid) {
		Connection con = getConnection();
		User poll = new PollDao().grade(con, userid);
		close(con);
		return poll;
	}

}
