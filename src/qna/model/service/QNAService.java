package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.dao.QNADao;
import qna.model.vo.QNA;

public class QNAService {

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new QNADao().getListCount(con);
		close(con);
		return listCount;

	}

	public ArrayList<QNA> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<QNA> list = new QNADao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	public ArrayList<QNA> selectListAll() {
		Connection con = getConnection();
		ArrayList<QNA> listAll = new QNADao().selectListAll(con);
		close(con);
		return listAll;
	}

	public int insertQuestion(QNA qna) {
		Connection con = getConnection();

		int result = new QNADao().insertQuestion(con, qna);
		close(con);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int deleteQuestion(String qnanum) {
		Connection con = getConnection();

		int result = new QNADao().deleteQuestion(con, qnanum);
		close(con);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

}
