package user.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import user.model.dao.UserDao;
import user.model.vo.User;

public class UserService {

	public UserService() {
	}

	public User loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		User user = new UserDao().loginCheck(con, userId, userPwd);
		System.out.println("con : " + con);
		close(con);
		return user;
	}

	public User selectUser(String userId) {
		Connection con = getConnection();
		User user = new UserDao().selectUser(con, userId);
		close(con);
		return user;
	}

	public int updateUser(User user) {
		Connection con = getConnection();
		int result = new UserDao().updateUser(con, user);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertUser(User user) {
		Connection con = getConnection();
		int result = new UserDao().insertUser(con, user);
		System.out.println("con : " + con);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
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

	public int selectCheckId(String userId) {
		Connection con = getConnection();
		int result = new UserDao().selectCheckId(con, userId);
		close(con);
		return result;
	}

	public User findId(String userName, String userEmail) {
		Connection con = getConnection();
		User user = new UserDao().findId(con, userName, userEmail);
		close(con);
		return user;
	}

	public User findPwd(String userId, String userName, String userEmail) {
		Connection con = getConnection();
		User user = new UserDao().findPwd(con, userId, userName, userEmail);
		close(con);
		return user;
	}

	public int pwdchange(User user) {
		Connection con = getConnection();
		int result = new UserDao().pwdchange(con, user);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
