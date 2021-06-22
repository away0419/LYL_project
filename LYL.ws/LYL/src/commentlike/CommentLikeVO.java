package commentlike;

public class CommentLikeVO {
	private int comNo;
	private int userNo;
	
	
	
	public CommentLikeVO() {
	}

	public CommentLikeVO(int comNo, int userNo) {
		super();
		this.comNo = comNo;
		this.userNo = userNo;
	}

	public int getComNo() {
		return comNo;
	}
	
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "CommentLikeVO [comNo=" + comNo + ", userNo=" + userNo + "]";
	}
	
	
}
