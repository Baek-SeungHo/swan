package userexeinfo.model.vo;

import java.sql.*;

public class UserExeInfo implements java.io.Serializable{
	private final static long serialVersionUID = 10L;
	
	private String userId;
	private String sportCode;
	private String sportNum;
	private Date sportDate;
	private String sportBody;
	
	public UserExeInfo() {}	
	
	public UserExeInfo(String userId, String sportCode, String sportNum, Date sportDate, String sportBody) {
		super();
		this.userId = userId;
		this.sportCode = sportCode;
		this.sportNum = sportNum;
		this.sportDate = sportDate;
		this.sportBody = sportBody;
	}	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSportCode() {
		return sportCode;
	}

	public void setSportCode(String sportCode) {
		this.sportCode = sportCode;
	}

	public String getSportNum() {
		return sportNum;
	}

	public void setSportNum(String sportNum) {
		this.sportNum = sportNum;
	}

	public Date getSportDate() {
		return sportDate;
	}

	public void setSportDate(Date sportDate) {
		this.sportDate = sportDate;
	}

	public String getSportBody() {
		return sportBody;
	}

	public void setSportBody(String sportBody) {
		this.sportBody = sportBody;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return this.userId + ", " + this.sportCode + ", " + this.sportNum + ", " + this.sportDate + ", " + this.sportBody;
	}

}
