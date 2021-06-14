package src.myuser;

import java.sql.Timestamp;

public class MyuserVO {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private int userPhone;
	private String userEmail;
	private Timestamp userJoin;
	private int userSub;
	private String  userImg;
	
	@Override
	public String toString() {
		return "MyuserVO [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userJoin=" + userJoin + ", userSub="
				+ userSub + ", userImg=" + userImg + "]";
	}

	public MyuserVO(int userNo, String userId, String userPwd, String userName, int userPhone, String userEmail,
			Timestamp userJoin, int userSub, String userImg) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userJoin = userJoin;
		this.userSub = userSub;
		this.userImg = userImg;
	}

	public MyuserVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public int getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Timestamp getUserJoin() {
		return userJoin;
	}

	public void setUserJoin(Timestamp userJoin) {
		this.userJoin = userJoin;
	}

	public int getUserSub() {
		return userSub;
	}

	public void setUserSub(int userSub) {
		this.userSub = userSub;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	
	
	
}
