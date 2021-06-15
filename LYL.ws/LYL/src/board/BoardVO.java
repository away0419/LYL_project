package board;

import java.sql.Timestamp;

public class BoardVO {
	private int boNo; /* 번호 */
	private String boTitle; /* 제목 */
	private String boCon; /* 내용 */
	private int boHits;  /* 조회수 */
	private int boCom; /* 댓글수 */
	private Timestamp boDate; /* 작성일 */
	private int boSec; /* 비밀글 여부 */
	private int userNo; /* 크리에이터 */
	private int userNo2; /* 글쓴이 */
	private int boMyNo; /* 마이페이지별 글번호 */
	private int boStep; /* 게시글 단계 */
	private int boSort;/* 게시글 정렬 번호 */
	private int boGroupNo; /* 게시글 그룹번호 */
	
	public BoardVO(int boNo, String boTitle, String boCon, int boHits, int boCom, Timestamp boDate, int boSec,
			int userNo, int userNo2, int boMyNo, int boStep, int boSort, int boGroupNo) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boCon = boCon;
		this.boHits = boHits;
		this.boCom = boCom;
		this.boDate = boDate;
		this.boSec = boSec;
		this.userNo = userNo;
		this.userNo2 = userNo2;
		this.boMyNo = boMyNo;
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

	public int getBoSec() {
		return boSec;
	}

	public void setBoSec(int boSec) {
		this.boSec = boSec;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}

	public int getBoMyNo() {
		return boMyNo;
	}

	public void setBoMyNo(int boMyNo) {
		this.boMyNo = boMyNo;
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
