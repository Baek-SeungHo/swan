package management.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import management.model.dao.UserManagementDao;
import management.model.vo.UserManagement;
import user.model.dao.UserDao;

	public class UserManagementService {
	
		public int getListCount() {
			Connection con = getConnection();
			int listCount = new UserManagementDao().getListCount(con);
			close(con);
			return listCount;

		}	
		
		public ArrayList<UserManagement> selectList(int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<UserManagement> list = new UserManagementDao().selectList(con, currentPage, limit);
			close(con);
			return list;
		
		}
		
		public int deleteUser(String userId) {
			Connection con = getConnection();
			int result = new UserDao().deleteUser(con, userId);
			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}
}
