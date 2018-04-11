package poll.model.vo;

import java.io.*;

public class Poll implements Serializable {
	private static final long serialVersionUID = 10L;

	private String Rating;

	public Poll() {
	}

	public String getRating() {
		return Rating;
	}

	public void setRating(String rating) {
		Rating = rating;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Poll(String rating) {
		super();
		Rating = rating;
	}

}
