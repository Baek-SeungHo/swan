package schedule.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import schedule.model.vo.Schedule;
import user.model.vo.User;

public class ScheduleDao {

	public ScheduleDao() {
	}

	// 날짜를 조회로 운동스케쥴
	public ArrayList<Schedule> todaySchedule(Connection con, String usergrade, Date sqlDate) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from exe_schedule where SCHEDULE_DATE = ? and User_grade =?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sqlDate);
			pstmt.setString(2, usergrade);

			rset = pstmt.executeQuery();
			while (rset.next()) {

				Schedule s = new Schedule();

				s.setGrade(usergrade);
				s.setSchedulename(rset.getString("schedule_name"));
				s.setSchedulenum(rset.getInt("schedule_num"));
				s.setScheduleurl(rset.getString("schedule_url"));
				s.setScheduledate(rset.getString("schedule_date"));

				list.add(s);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	// 선택한 날짜 스케쥴 조회
	public ArrayList<Schedule> dateselet(Connection con, String grade, String selectdate) {

		ArrayList<Schedule> list = new ArrayList<Schedule>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from exe_schedule where SCHEDULE_DATE = ? and User_grade =?";
		System.out.println(selectdate);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectdate);
			pstmt.setString(2, grade);

			rset = pstmt.executeQuery();
			while (rset.next()) {

				Schedule s = new Schedule();

				s.setGrade(grade);
				s.setSchedulename(rset.getString("schedule_name"));
				s.setSchedulenum(rset.getInt("schedule_num"));
				s.setScheduleurl(rset.getString("schedule_url"));
				s.setScheduledate(rset.getString("schedule_date"));

				list.add(s);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;

	}
	//유저등급 조회
	public Schedule usergrade(Connection con, String userid) {
		Schedule s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select *  from user_info , exe_info where user_info.user_id = exe_info.user_id "
				+ "and user_info.user_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				s = new Schedule();

				s.setUsergrade(rset.getString("user_grade"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return s;
	}
}