package exeinfo.model.vo;

import java.sql.*;

public class ExeInfo implements java.io.Serializable{
	private final static long serialVersionUID = 8L;
	
	private String userId;
	private String userGrade;
	private int userHeight;
	private int userWeight;
	private int userBmi;
	private int userGoal;
	private Date userStartdate;
	private Date userEnddate;
	
	public ExeInfo() {}	
	
	public ExeInfo(String userId, String userGrade, int userHeight, int userWeight, int userBmi, int userGoal,
			Date userStartdate, Date userEnddate) {
		super();
		this.userId = userId;
		this.userGrade = userGrade;
		this.userHeight = userHeight;
		this.userWeight = userWeight;
		this.userBmi = userBmi;
		this.userGoal = userGoal;
		this.userStartdate = userStartdate;
		this.userEnddate = userEnddate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public int getUserHeight() {
		return userHeight;
	}

	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}

	public int getUserWeight() {
		return userWeight;
	}

	public void setUserWeight(int userWeight) {
		this.userWeight = userWeight;
	}

	public int getUserBmi() {
		return userBmi;
	}

	public void setUserBmi(int userBmi) {
		this.userBmi = userBmi;
	}

	public int getUserGoal() {
		return userGoal;
	}

	public void setUserGoal(int userGoal) {
		this.userGoal = userGoal;
	}

	public Date getUserStartdate() {
		return userStartdate;
	}

	public void setUserStartdate(Date userStartdate) {
		this.userStartdate = userStartdate;
	}

	public Date getUserEnddate() {
		return userEnddate;
	}

	public void setUserEnddate(Date userEnddate) {
		this.userEnddate = userEnddate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return this.userId + ", " + this.userGrade + ", " + this.userHeight + 
				", " + this.userWeight + ", " + this.userBmi + ", " + this.userGoal + 
				", " + this.userStartdate + ", " + this.userEnddate;
	}
	
}
