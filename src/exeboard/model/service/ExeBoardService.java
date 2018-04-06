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
	
	public ExeBoard selectBoard(String ecode) {
		Connection con = getConnection();
		ExeBoard b = new ExeBoardDao().selectBoard(con, ecode);
		close(con);
		return b;
	}
}

// public void updateReplySeq(ExeBoard replyBoard) {
// Connection con = getConnection();
// int result = new ExeBoardDao().updateReplySeq(con, replyBoard);
// if (result > 0)
// commit(con);
// else
// rollback(con);
// close(con);
// return;
// }
//
// public int insertReply(ExeBoard replyBoard) {
// Connection con = getConnection();
// int result = new ExeBoardDao().insertReply(con, replyBoard);
// if (result > 0)
// commit(con);
// else
// rollback(con);
// close(con);
// return result;
// }
//
// public int deleteBoard(int boardNum) {
// Connection con = getConnection();
// int result = new ExeBoardDao().deleteBoard(con, boardNum);
// if (result > 0)
// commit(con);
// else
// rollback(con);
// close(con);
// return result;
// }
//
// public int updateReply(Board board) {
// Connection con = getConnection();
// int result = new BoardDao().updateReply(con, board);
// if (result > 0)
// commit(con);
// else
// rollback(con);
// close(con);
// return result;
// }
//
// public int updateBoard(ExeBoard board) {
// // 원글 수정 처리용
// Connection con = getConnection();
// int result = new ExeBoardDao().updateBoard(con, board);
// if (result > 0)
// commit(con);
// else
// rollback(con);
// close(con);
// return result;
// }
// //Top3 조회수 게시글
// public ArrayList<ExeBoard> selectTop3() {
//
// Connection con = getConnection();
// ArrayList<ExeBoard> list = new ExeBoardDao().selectTop3(con);
// close(con);
// return list;
// }
