 package userexeinfo.model.service;

import userexeinfo.model.dao.UserExeInfoDao;

import userexeinfo.model.vo.UserExeInfo;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import exerecommend.model.dao.ExerecommendDao;
import exerecommend.model.vo.Exerecommend;

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

	public ArrayList<UserExeInfo> searchTable(String userid, String sportdate) {
		Connection con = getConnection();
		ArrayList<UserExeInfo> sportTable = new UserExeInfoDao().searchTable(con, userid, sportdate);
		close(con);
		return sportTable;
	}

}
