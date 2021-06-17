package vidcomment;

import java.sql.Timestamp;

public class VidCommentVO {
	private int comNo;/* 댓글 번호 */
	private String comCon; /* 내용 */
	private Timestamp comDate; /* 날짜 */
	private int comRe; /* 답글수 */
	private int comLike; /* 좋아요 */
	private int comSec; /* 비밀글 여부 */
	private int vidNo; /* 영상 번호 */
	private int userNo; /* 크리에이터 */
	private int comStep; /* 댓글 단계 */
	private int comSort; /* 댓글 정렬 번호 */
	private int comGroup; /* 댓글 그룹 번호 */
	
	public VidCommentVO() {
		super();
	}

	public VidCommentVO(int comNo, String comCon, Timestamp comDate, int comRe, int comLike, int comSec, int vidNo,
			int userNo, int comStep, int comSort, int comGroup) {
		super();
		this.comNo = comNo;
		this.comCon = comCon;
		this.comDate = comDate;
		this.comRe = comRe;
		this.comLike = comLike;
		this.comSec = comSec;
		this.vidNo = vidNo;
		this.userNo = userNo;
		this.comStep = comStep;
		this.comSort = comSort;
		this.comGroup = comGroup;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComCon() {
		return comCon;
	}

	public void setComCon(String comCon) {
		this.comCon = comCon;
	}

	public Timestamp getComDate() {
		return comDate;
	}

	public void setComDate(Timestamp comDate) {
		this.comDate = comDate;
	}

	public int getComRe() {
		return comRe;
	}

	public void setComRe(int comRe) {
		this.comRe = comRe;
	}

	public int getComLike() {
		return comLike;
	}

	public void setComLike(int comLike) {
		this.comLike = comLike;
	}

	public int getComSec() {
		return comSec;
	}

	public void setComSec(int comSec) {
		this.comSec = comSec;
	}

	public int getVidNo() {
		return vidNo;
	}

	public void setVidNo(int vidNo) {
		this.vidNo = vidNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getComStep() {
		return comStep;
	}

	public void setComStep(int comStep) {
		this.comStep = comStep;
	}

	public int getComSort() {
		return comSort;
	}

	public void setComSort(int comSort) {
		this.comSort = comSort;
	}

	public int getComGroup() {
		return comGroup;
	}

	public void setComGroup(int comGroup) {
		this.comGroup = comGroup;
	}

	@Override
	public String toString() {
		return "VidCommentVO [comNo=" + comNo + ", comCon=" + comCon + ", comDate=" + comDate + ", comRe=" + comRe
				+ ", comLike=" + comLike + ", comSec=" + comSec + ", vidNo=" + vidNo + ", userNo=" + userNo
				+ ", comStep=" + comStep + ", comSort=" + comSort + ", comGroup=" + comGroup + "]";
	}
	
	
}
