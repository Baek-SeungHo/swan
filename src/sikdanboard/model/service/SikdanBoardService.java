package sikdanboard.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import sikdanboard.model.dao.SikdanBoradDao;
import sikdanboard.model.vo.SikdanBorad;

public class SikdanBoardService {
	public SikdanBoardService() {
		// TODO Auto-generated constructor stub
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new SikdanBoradDao().getListCount(con);
		close(con);
		return listCount;

	}
	
	public ArrayList<SikdanBorad> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<SikdanBorad> list = new SikdanBoradDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	public int insertBoard(SikdanBorad sb) {
		Connection con = getConnection();
		int result = new SikdanBoradDao().insertSikdanBorad(con, sb);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	public int updateBoard(SikdanBorad sb) {
		Connection con = getConnection();
		int result = new SikdanBoradDao().updateSikdanBorad(con, sb);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	public int deleteBoard(SikdanBorad sb) {
		Connection con = getConnection();
		int result = new SikdanBoradDao().deleteSikdanBorad(con, sb);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public SikdanBorad selectBoard(int board_num) {
		Connection con = getConnection();
		SikdanBorad sb = new SikdanBoradDao().selectBoard(con, board_num);
		close(con);
		return sb;
	}
	
	public void addReadCount(int board_num) {
		Connection con = getConnection();
		int result = new SikdanBoradDao().addReadCount(con, board_num);
		if (result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return;
	}
}
