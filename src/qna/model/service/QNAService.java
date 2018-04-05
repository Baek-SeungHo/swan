package qna.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

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
		ArrayList<QNA> list = 
			new QNADao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

}
