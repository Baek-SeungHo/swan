package exeboard.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import exeboard.model.dao.ExeBoardDao;
import exeboard.model.vo.ExeBoard;

public class ExeBoardService {
	public ExeBoardService() {
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ExeBoardDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<ExeBoard> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<ExeBoard> list = new ExeBoardDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	// 운동정보 입력
		public int insertBoard(ExeBoard b) {
		Connection con = getConnection();
		int result = new ExeBoardDao().insertExeBoard(con, b);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	// 운동정보 조회수 증가
	public void addReadCount(String ecode) {
		Connection con = getConnection();
		int result = new ExeBoardDao().addReadCount(con, ecode);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return;
	}

	// 운동정보 상세보기
	public ExeBoard selectBoard(String ecode) {
		Connection con = getConnection();
		ExeBoard b = new ExeBoardDao().selectBoard(con, ecode);
		close(con);
		return b;
	}

	// 운동부위검색
	public ArrayList<ExeBoard> search(String body) {
		Connection con = getConnection();
		ArrayList<ExeBoard> list = new ExeBoardDao().search(con, body);
		return list;
	}

	// 운동명검색
	public ArrayList<ExeBoard> namesearch(String name) {

		Connection con = getConnection();
		ArrayList<ExeBoard> list = new ExeBoardDao().namesearch(con, name);
		return list;

	}

}
