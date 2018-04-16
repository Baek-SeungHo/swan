package schedule.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.*;

import schedule.model.dao.ScheduleDao;
import schedule.model.vo.Schedule;

public class ScheduleService {

	public ScheduleService() {
	}

	// 운동스케쥴
	public ArrayList<Schedule> todayschedule(String usergrade, Date sqlDate) {
		Connection con = getConnection();
		ArrayList<Schedule> list = new ScheduleDao().todaySchedule(con, usergrade, sqlDate);
		close(con);
		return list;
	}

	// 날짜조회스케쥴
	public ArrayList<Schedule> dateselet(String grade, String selectdate) {
		Connection con = getConnection();
		ArrayList<Schedule> list = new ScheduleDao().dateselet(con, grade, selectdate);
		close(con);
		return list;
	}

}
