package qna.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import qna.model.vo.QNA;

public class QNADao {

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from qna";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<QNA> selectList(Connection con, int currentPage, int limit) {
		
			ArrayList<QNA> list = new ArrayList<QNA>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from "
					+ "(select rownum rnum, board_num, "
					+ "board_title, board_writer, board_content, "
					+ "board_original_filename, board_rename_filename, "
					+ "board_date, board_readcount, board_level, "
					+ "board_ref, board_reply_ref, board_reply_seq "
					+ "from (select * from board order by "
					+ "board_ref desc, board_reply_ref desc, "
					+ "board_level asc, board_reply_seq asc)) "
					+ "where rnum >= ? and rnum <= ?";
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					QNA q = new QNA();
					b.setBoardNum(rset.getInt("board_num"));
					b.setBoardTitle(rset.getString("board_title"));
					b.setBoardWriter(rset.getString("board_writer"));
					b.setBoardContent(rset.getString("board_content"));
					b.setBoardDate(rset.getDate("board_date"));
					b.setBoardReadCount(rset.getInt("board_readcount"));
					b.setBoardOriginalFileName(rset.getString("board_original_filename"));
					b.setBoardRenameFileName(rset.getString("board_rename_filename"));
					b.setBoardLevel(rset.getInt("board_level"));
					b.setBoardRef(rset.getInt("board_ref"));
					b.setBoardReplyRef(rset.getInt("board_reply_ref"));
					b.setBoardReplySeq(rset.getInt("board_reply_seq"));
					
					list.add(b);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
	}

}
