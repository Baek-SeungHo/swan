package poll.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import exeboard.model.dao.ExeBoardDao;
import poll.model.dao.PollDao;
import poll.model.vo.Poll;
import user.model.vo.User;

public class PollService {

	public PollService() {
	}

	public int pollrating(String rating, String userid) {
		Connection con = getConnection();
		int result = new PollDao().pollrating(con, rating, userid);
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
