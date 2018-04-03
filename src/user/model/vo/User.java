package user.model.vo;

public class User implements java.io.Serializable{
	private final static long serialVersionUID = 7L;
	
	private String userId;
	private String userPwd;
	private String userName;	
	private String userGender;
	private int userAge;
	private String userEmail;
	private String userPhone;
	private String administrator;

	public User() {}

	public User(String userId, String userPwd, String userName, String userGender, int userAge, String userEmail,
			String userPhone, String administrator) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userGender = userGender;
		this.userAge = userAge;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.administrator = administrator;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getAdministrator() {
		return administrator;
	}

	public void setAdministrator(String administrator) {
		this.administrator = administrator;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return this.userId + ", " + this.userPwd+ ", " + this.userName 
				+ ", " + this.userGender + ", "  + this.userAge + ", " 
				+ this.userEmail + ", " + this.userPhone + ", "  + this.administrator;
	}
	
}
