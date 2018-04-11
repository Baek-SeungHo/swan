package exeinfo.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import exeinfo.model.dao.ExeInfoDao;
import exeinfo.model.vo.ExeInfo;

public class ExeInfoService {

	public int insertExeInfo(ExeInfo exeinfo) {
		Connection con = getConnection();
		int result = new ExeInfoDao().insertExeInfo(con, exeinfo);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ExeInfo selectUserId(String userId) {
		Connection con = getConnection();
		ExeInfo exeinfo = new ExeInfoDao().selectUserId(con, userId);
		close(con);
		return exeinfo;
	}

}
