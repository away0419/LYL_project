package bocomment;

import java.sql.Timestamp;

public class BoCommentVO {
	private int bcNo; /* 댓글 번호 */
	private String bcCom; /* 내용 */
	private Timestamp bcDate; /* 날짜 */
	private int bcStep; /* 댓글 단계 */
	private int bcSort; /* 댓글 정렬 번호 */
	private int bcGroupNo; /* 댓글 그룹 번호 */
	private int boNo; /* 게시판번호 */
	private int userNo; /* 크리에이터 */
	private String userId; /* 글쓴이 */
	
	public BoCommentVO() {
		super();
	}
	
	public BoCommentVO(int bcNo, String bcCom, Timestamp bcDate, int bcStep,
			int bcSort, int bcGroupNo, int boNo, int userNo, String userId) {
		this.bcNo = bcNo;
		this.bcCom = bcCom;
		this.bcDate = bcDate;
		this.bcStep = bcStep;
		this.bcSort = bcSort;
		this.bcGroupNo = bcGroupNo;
		this.boNo = boNo;
		this.userNo = userNo;
		this.userId = userId;
	}

	public int getBcNo() {
		return bcNo;
	}

	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}

	public String getBcCom() {
		return bcCom;
	}

	public void setBcCom(String bcCom) {
		this.bcCom = bcCom;
	}

	public Timestamp getBcDate() {
		return bcDate;
	}

	public void setBcDate(Timestamp bcDate) {
		this.bcDate = bcDate;
	}


	public int getBcStep() {
		return bcStep;
	}

	public void setBcStep(int bcStep) {
		this.bcStep = bcStep;
	}

	public int getBcSort() {
		return bcSort;
	}

	public void setBcSort(int bcSort) {
		this.bcSort = bcSort;
	}

	public int getBcGroupNo() {
		return bcGroupNo;
	}

	public void setBcGroupNo(int bcGroupNo) {
		this.bcGroupNo = bcGroupNo;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
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
	
}
