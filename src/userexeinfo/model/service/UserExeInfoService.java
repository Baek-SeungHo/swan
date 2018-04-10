package userexeinfo.model.service;

import userexeinfo.model.dao.UserExeInfoDao;
import userexeinfo.model.vo.UserExeInfo;

import static common.JDBCTemplate.*;

import java.sql.*;

public class UserExeInfoService {

	public int insertUserExeInfo(UserExeInfo userexeinfo) {
		Connection con = getConnection();
		int result = new UserExeInfoDao().insertUserExeInfo(con, userexeinfo);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
