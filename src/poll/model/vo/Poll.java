package poll.model.vo;

import java.io.*;

public class Poll implements Serializable {
	private static final long serialVersionUID = 10L;

	private String Rating;
	private String Grade;

	public Poll() {
	}

	public String getRating() {
		return Rating;
	}

	public void setRating(String rating) {
		this.Rating = rating;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Poll(String rating, String grade) {
		super();
		this.Rating = rating;
		this.Grade = grade;
	}

	public String getGrade() {
		return Grade;
	}

	public void setGrade(String grade) {
		this.Grade = grade;
	}

}
