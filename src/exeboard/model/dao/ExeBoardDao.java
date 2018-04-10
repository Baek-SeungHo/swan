package exeboard.model.dao;

import java.sql.*;
import java.util.ArrayList;

import exeboard.model.vo.ExeBoard;

import static common.JDBCTemplate.*;

public class ExeBoardDao {
	public ExeBoardDao() {
	}

	// 게시판전체조회
	public ArrayList<ExeBoard> selectList(Connection con, int currentPage, int limit) {
		ArrayList<ExeBoard> list = new ArrayList<ExeBoard>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from (select rownum rnum, sport_code,sport_body,sport_name, sport_look, sport_date from exe_recommend) "
				+ "where rnum >= ? and rnum <= ?";

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				ExeBoard b = new ExeBoard();
				b.setSportbody(rset.getString("sport_body"));
				b.setSportname(rset.getString("sport_name"));
				b.setSportlook(rset.getInt("sport_look"));
				b.setSportdate(rset.getDate("sport_date"));
				b.setSportcode(rset.getString("sport_code"));

				list.add(b);
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

	// 게시판자료넣기
	public int insertExeBoard(Connection con, ExeBoard b) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("hi2");
		String query = "insert into EXE_RECOMMEND values (?,?,?,default,sysdate,?)";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getSportcode());
			pstmt.setString(2, b.getSportname());
			pstmt.setString(3, b.getSportbody());
			pstmt.setString(4, b.getSporturl());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("hi43434");
		return result;
	}

	// 게시판 조회수 증가
	public int addReadCount(Connection con, String ecode) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update EXE_RECOMMEND set sport_look = sport_look + 1 where sport_code = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ecode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시판 상세보기
	public ExeBoard selectBoard(Connection con, String ecode) {
		ExeBoard exeboard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from EXE_RECOMMEND  where sport_code = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ecode);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				exeboard = new ExeBoard();
				exeboard.setSportcode(ecode);
				exeboard.setSportbody(rset.getString("sport_body"));
				exeboard.setSportname(rset.getString("sport_name"));
				exeboard.setSportdate(rset.getDate("sport_date"));
				exeboard.setSporturl(rset.getString("sport_url"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return exeboard;
	}

	// 운동부위로 검색
	public ArrayList<ExeBoard> search(Connection con, String body) {
		ArrayList<ExeBoard> list = new ArrayList<ExeBoard>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(body);
		String sql = "select * from EXE_RECOMMEND where sport_body = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, body);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ExeBoard board = new ExeBoard();
				board.setSportbody(body);
				board.setSportcode(rset.getString("sport_code"));
				board.setSportname(rset.getString("sport_name"));
				board.setSporturl(rset.getString("sport_url"));
				board.setSportdate(rset.getDate("sport_date"));
				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 운동명으로 검색기능
	public ArrayList<ExeBoard> namesearch(Connection con, String name) {
		ArrayList<ExeBoard> list = new ArrayList<ExeBoard>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(name);
		String sql = "select * from EXE_RECOMMEND where sport_name like ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ExeBoard board = new ExeBoard();
				board.setSportname(name);
				board.setSportcode(rset.getString("sport_code"));
				board.setSportbody(rset.getString("sport_body"));
				board.setSporturl(rset.getString("sport_url"));
				board.setSportdate(rset.getDate("sport_date"));
				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	// 운동정보 삭제
	public int deleteBoard(Connection con, String code) {

		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from EXE_RECOMMEND where sport_code = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("hi");
		return result;

	}

}
