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
	//운동스케쥴
	public ArrayList<Schedule> todayschedule(String usergrade ,Date sqlDate) {
		Connection con = getConnection();
		ArrayList<Schedule> list = new ScheduleDao().todaySchedule(con, usergrade, sqlDate);
		close(con);
		return list;
	}

}
