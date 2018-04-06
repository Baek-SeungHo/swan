package exeboard.model.vo;

import java.sql.Date;

public class ExeBoard implements java.io.Serializable {
	private static final long serialVersionUID = 11L;

	private String sportbody;
	private String sportname;
	/*
	 * private int boardRef; //참조하는 원글번호 private int boardReplyRef; //참조하는 댓글 번호,
	 * 원글은 0 private int boardLevel; //원글:0, 원글의댓글:1, 댓글의댓글:2 private int
	 * boardReplySeq; //댓글의 순번, 최근 댓글이 1
	 */ private int sportlook; // 읽은 조회수
	private Date sportdate; // 작성날짜
	private String sporturl; // 동영상 url
	private String sportcode; // 운동코드

	public ExeBoard() {
	}

	public ExeBoard(String sportbody, String sportname, int sportlook, Date sportdate, String sporturl,
			String sportcode) {
		super();
		this.sportbody = sportbody;
		this.sportname = sportname;
		this.sportlook = sportlook;
		this.sportdate = sportdate;
		this.sporturl = sporturl;
		this.sportcode = sportcode;
	}

	public String getSportcode() {
		return sportcode;
	}

	public void setSportcode(String sportcode) {
		this.sportcode = sportcode;
	}

	public String getSporturl() {
		return sporturl;
	}

	public void setSporturl(String sporturl) {
		this.sporturl = sporturl;
	}

	public String getSportbody() {
		return sportbody;
	}

	public void setSportbody(String sportbody) {
		this.sportbody = sportbody;
	}

	public String getSportname() {
		return sportname;
	}

	public void setSportname(String sportname) {
		this.sportname = sportname;
	}

	public int getSportlook() {
		return sportlook;
	}

	public void setSportlook(int sportlook) {
		this.sportlook = sportlook;
	}

	public Date getSportdate() {
		return sportdate;
	}

	public void setSportdate(Date sportdate) {
		this.sportdate = sportdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
