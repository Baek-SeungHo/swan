package sikdanboard.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import sikdanboard.model.vo.SikdanBorad;

public class SikdanBoradDao {

	//�Խ��� ���� ��ȸ
		public int getListCount(Connection con) {

			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;

			String query = "select count(*) from FOOD_RECOMMEND";

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
	
	//�Խ��� ��ü ��ȸ
		public ArrayList<SikdanBorad> selectList(Connection con, int currentPage, int limit) {
			ArrayList<SikdanBorad> list = new ArrayList<SikdanBorad>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from (select rownum rnum, board_num, board_write, board_title, board_date, board_look from food_recommend) "
					+ "where rnum >= ? and rnum <= ?";

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);

				rset = pstmt.executeQuery();

				while (rset.next()) {

					SikdanBorad sb = new SikdanBorad();
					sb.setBoard_num(rset.getInt("board_num"));
					sb.setBoard_write(rset.getString("board_write"));
					sb.setBoard_title(rset.getString("board_title"));
					sb.setBoard_date(rset.getDate("board_date"));
					sb.setBoard_look(rset.getInt("board_look"));

					list.add(sb);
				}
				System.out.println(list);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return list;
		}
	
	//�Խ��� ���
		public int insertSikdanBorad(Connection con, SikdanBorad sb) {
			int result = 0;
			PreparedStatement pstmt = null;

			String query = "insert into FOOD_RECOMMEND values (FOOD_SEQ.nextval, ?, ?, ?, sysdate, 0)";

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, sb.getBoard_write());
				pstmt.setString(2, sb.getBoard_title());
				pstmt.setString(3, sb.getBoard_content());

				result = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
		
	//�Խ��� �� ����
		public SikdanBorad selectBoard(Connection con, int board_num) {
			SikdanBorad sb = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "select * from FOOD_RECOMMEND  where board_num = ?";
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, board_num);

				rset = pstmt.executeQuery();

				if (rset.next()) {
				
					sb = new SikdanBorad();
					sb.setBoard_num(board_num);
					sb.setBoard_num(rset.getInt("board_num"));
					sb.setBoard_write(rset.getString("board_write"));
					sb.setBoard_title(rset.getString("board_title"));
					sb.setBoard_date(rset.getDate("board_date"));
					sb.setBoard_content(rset.getString("board_content"));

				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return sb;
		}
		
		//�Խ��� ��ȸ�� ����
		public int addReadCount(Connection con, int board_num) {
			int result = 0;
			PreparedStatement pstmt = null;

			String query = "update FOOD_RECOMMEND set board_look = board_look + 1 where board_num = ?";

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, board_num);

				result = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
}
