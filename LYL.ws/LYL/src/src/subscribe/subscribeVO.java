package src.subscribe;

public class subscribeVO {
	private int userNo2;
	private int userNo;

	public subscribeVO(int userNo2, int userNo) {
		super();
		this.userNo2 = userNo2;
		this.userNo = userNo;
	}

	public subscribeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "subscribeVO [userNo2=" + userNo2 + ", userNo=" + userNo + "]";
	}

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
