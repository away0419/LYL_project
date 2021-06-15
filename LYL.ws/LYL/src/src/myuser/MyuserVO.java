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
	private String userImgName;
	private long userImgSize;
	private String userImgOriName;
	private String userDelFalg;

	public MyuserVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyuserVO(int userNo, String userId, String userPwd, String userName, int userPhone, String userEmail,
			Timestamp userJoin, int userSub, String userImgName, long userImgSize, String userImgOriName,
			String userDelFalg) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userJoin = userJoin;
		this.userSub = userSub;
		this.userImgName = userImgName;
		this.userImgSize = userImgSize;
		this.userImgOriName = userImgOriName;
		this.userDelFalg = userDelFalg;
	}

	@Override
	public String toString() {
		return "MyuserVO [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userJoin=" + userJoin + ", userSub="
				+ userSub + ", userImgName=" + userImgName + ", userImgSize=" + userImgSize + ", userImgOriName="
				+ userImgOriName + ", userDelFalg=" + userDelFalg + "]";
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

	public String getUserImgName() {
		return userImgName;
	}

	public void setUserImgName(String userImgName) {
		this.userImgName = userImgName;
	}

	public long getUserImgSize() {
		return userImgSize;
	}

	public void setUserImgSize(long userImgSize) {
		this.userImgSize = userImgSize;
	}

	public String getUserImgOriName() {
		return userImgOriName;
	}

	public void setUserImgOriName(String userImgOriName) {
		this.userImgOriName = userImgOriName;
	}

	public String getUserDelFalg() {
		return userDelFalg;
	}

	public void setUserDelFalg(String userDelFalg) {
		this.userDelFalg = userDelFalg;
	}
	
	

	

}
