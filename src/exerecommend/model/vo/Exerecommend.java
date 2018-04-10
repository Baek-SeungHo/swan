package exerecommend.model.vo;

import java.sql.Date;

public class Exerecommend implements java.io.Serializable{
	private final static long serialVersionUID = 7L;
	
	private String sportCode;
	private String sportName;
	private String sportBody;
	private int sportLook;
	private Date sportDate;
	
	public Exerecommend() {}

	public Exerecommend(String sportCode, String sportName, String sportBody, int sportLook, Date sportDate) {
		super();
		this.sportCode = sportCode;
		this.sportName = sportName;
		this.sportBody = sportBody;
		this.sportLook = sportLook;
		this.sportDate = sportDate;
	}

	public String getSportCode() {
		return sportCode;
	}

	public void setSportCode(String sportCode) {
		this.sportCode = sportCode;
	}

	public String getSportName() {
		return sportName;
	}

	public void setSportName(String sportName) {
		this.sportName = sportName;
	}

	public String getSportBody() {
		return sportBody;
	}

	public void setSportBody(String sportBody) {
		this.sportBody = sportBody;
	}

	public int getSportLook() {
		return sportLook;
	}

	public void setSportLook(int sportLook) {
		this.sportLook = sportLook;
	}

	public Date getSportDate() {
		return sportDate;
	}

	public void setSportDate(Date sportDate) {
		this.sportDate = sportDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return this.sportCode + ", " + this.sportName + ", " + this.sportBody + ", " + this.sportLook + ", " + this.sportDate;
	}

}
