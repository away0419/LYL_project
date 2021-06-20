package board;

import java.sql.Timestamp;

public class BoardVO {
	private int boNo; /* 게시판번호 */
	private String boTitle; /* 제목 */
	private String boCon; /* 내용 */
	private int boHits; /* 조회수 */
	private int boCom; /* 댓글수 */
	private Timestamp boDate; /* 작성일 */
	private int boPwd; /* 비밀번호 */
	private int userNo; /* 크리에이터 */
	private String userId; /* 글쓴이 */
	private int boStep; /* 게시글 단계 */
	private int boSort; /* 게시글 정렬 번호 */
	private int boGroupNo; /* 게시글 그룹번호 */
	
	public BoardVO() {
		super();
	}

	public BoardVO(int boNo, String boTitle, String boCon, int boHits, int boCom, Timestamp boDate, int boPwd,
			int userNo, String userId, int boStep, int boSort, int boGroupNo) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boCon = boCon;
		this.boHits = boHits;
		this.boCom = boCom;
		this.boDate = boDate;
		this.boPwd = boPwd;
		this.userNo = userNo;
		this.userId = userId;
		this.boStep = boStep;
		this.boSort = boSort;
		this.boGroupNo = boGroupNo;
	}


	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoCon() {
		return boCon;
	}

	public void setBoCon(String boCon) {
		this.boCon = boCon;
	}

	public int getBoHits() {
		return boHits;
	}

	public void setBoHits(int boHits) {
		this.boHits = boHits;
	}

	public int getBoCom() {
		return boCom;
	}

	public void setBoCom(int boCom) {
		this.boCom = boCom;
	}

	public Timestamp getBoDate() {
		return boDate;
	}

	public void setBoDate(Timestamp boDate) {
		this.boDate = boDate;
	}

	public int getBoPwd() {
		return boPwd;
	}

	public void setBoPwd(int boPwd) {
		this.boPwd = boPwd;
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

	public int getBoStep() {
		return boStep;
	}

	public void setBoStep(int boStep) {
		this.boStep = boStep;
	}

	public int getBoSort() {
		return boSort;
	}

	public void setBoSort(int boSort) {
		this.boSort = boSort;
	}

	public int getBoGroupNo() {
		return boGroupNo;
	}

	public void setBoGroupNo(int boGroupNo) {
		this.boGroupNo = boGroupNo;
	}
	
	
}
