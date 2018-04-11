package sikdanboard.model.vo;

import java.sql.Date;

public class SikdanBorad implements java.io.Serializable{
	private static final long serialVersionUID = 2L;
	
	private int board_num;
	private String board_write;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int board_look;
	
	public SikdanBorad() {
		// TODO Auto-generated constructor stub
	}

	public SikdanBorad(int board_num, String board_write, String board_title, String board_content, Date board_date,
			int board_look) {
		super();
		this.board_num = board_num;
		this.board_write = board_write;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_look = board_look;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_write() {
		return board_write;
	}

	public void setBoard_write(String board_write) {
		this.board_write = board_write;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_look() {
		return board_look;
	}

	public void setBoard_look(int board_look) {
		this.board_look = board_look;
	}

	

}
