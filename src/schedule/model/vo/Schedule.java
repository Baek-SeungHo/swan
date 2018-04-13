package schedule.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Schedule implements Serializable {
	private final static long serialVersionUID = 3L;

	private String grade;
	private String schedulename;
	private int schedulenum;
	private String scheduleurl;
	private String scheduledate;
	
	public Schedule() {};
	
	public Schedule(String grade, String schedulename, int schedulenum, String scheduleurl, String scheduledate) {
		super();
		this.grade = grade;
		this.schedulename = schedulename;
		this.schedulenum = schedulenum;
		this.scheduleurl = scheduleurl;
		this.scheduledate = scheduledate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSchedulename() {
		return schedulename;
	}

	public void setSchedulename(String schedulename) {
		this.schedulename = schedulename;
	}

	public int getSchedulenum() {
		return schedulenum;
	}

	public void setSchedulenum(int schedulenum) {
		this.schedulenum = schedulenum;
	}

	public String getScheduleurl() {
		return scheduleurl;
	}

	public void setScheduleurl(String scheduleurl) {
		this.scheduleurl = scheduleurl;
	}

	public String getScheduledate() {
		return scheduledate;
	}

	public void setScheduledate(String scheduledate) {
		this.scheduledate = scheduledate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
