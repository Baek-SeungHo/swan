package qna.model.dao;

import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.ArrayList;

import qna.model.vo.QNA;

public class QNADao {

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from q_n_a";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<QNA> selectList(Connection con, int currentPage, int limit) {

		ArrayList<QNA> list = new ArrayList<QNA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		/*
		 * String query = "select * from " + "(select rownum rnum, board_num, " +
		 * "board_title, board_writer, board_content, " +
		 * "board_original_filename, board_rename_filename, " +
		 * "board_date, board_readcount, board_level, " +
		 * "board_ref, board_reply_ref, board_reply_seq " +
		 * "from (select * from board order by " +
		 * "board_ref desc, board_reply_ref desc, " +
		 * "board_level asc, board_reply_seq asc)) " + "where rnum >= ? and rnum <= ?";
		 */

		String query = "select * from (select rownum rnum, Q_N_A.QNA_NUM, Q_N_A.QNA_QUESTION, Q_N_A.QNA_ANSWER from Q_N_A order by Q_N_A.QNA_NUM desc) where rnum >= ? and rnum <= ?";

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				QNA q = new QNA();
				q.setQna_num(rset.getInt("qna_num"));
				q.setQna_question(rset.getString("qna_question"));
				q.setQna_answer(rset.getString("qna_answer"));

				list.add(q);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

}
