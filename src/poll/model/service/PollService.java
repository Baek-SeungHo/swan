package poll.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import poll.model.dao.PollDao;
import poll.model.vo.Poll;

public class PollService {

	public PollService() {
	}

	public int pollrating(String Rating) {
		int result = 0;
		Connection con = getConnection();
		result = new PollDao().pollrating(con, Rating);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

}
