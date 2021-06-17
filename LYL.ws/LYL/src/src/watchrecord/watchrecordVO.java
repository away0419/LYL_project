package src.watchrecord;

import java.sql.Timestamp;

public class watchrecordVO {

	private int userNo;
	private int vidNo;
	private Timestamp watchDate;

	public watchrecordVO(int userNo, int vidNo, Timestamp watchDate) {
		super();
		this.userNo = userNo;
		this.vidNo = vidNo;
		this.watchDate = watchDate;
	}

	public watchrecordVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "watchrecordVO [userNo=" + userNo + ", vidNo=" + vidNo + ", watchDate=" + watchDate + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getVidNo() {
		return vidNo;
	}

	public void setVidNo(int vidNo) {
		this.vidNo = vidNo;
	}

	public Timestamp getWatchDate() {
		return watchDate;
	}

	public void setWatchDate(Timestamp watchDate) {
		this.watchDate = watchDate;
	}

}
