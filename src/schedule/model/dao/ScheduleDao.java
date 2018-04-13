package schedule.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import schedule.model.vo.Schedule;

public class ScheduleDao {

	public ScheduleDao() {
	}
	//날짜를 조회로 운동스케쥴
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
			if (rset.next()) {

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

}
