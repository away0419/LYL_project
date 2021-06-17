package src.aftervideo;

public class aftervideoVO {
	private int userNo;
	private int vidNo;
	
	public aftervideoVO(int userNo, int vidNo) {
		super();
		this.userNo = userNo;
		this.vidNo = vidNo;
	}

	public aftervideoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "aftervideoVO [userNo=" + userNo + ", vidNo=" + vidNo + "]";
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
	
	
}
