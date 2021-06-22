package video;

import java.sql.Timestamp;

public class VideoVO {
	private int vidNo;
	private String vidTitle; /* ���� */
	private long vidHits; /* ��ȸ�� */
	private int vidCom; /* ��� */
	private String vidurl; /* ������ */
	private int vidLike; /* ���ƿ� */
	private Timestamp vidDate; /* ���ε� �ð� */
	private String vidEx; /* ���� ���� */
	private int vidTheme; /* �¸� ��ȣ */
	private int userNo; /* ũ�������� */
	private String vidThu; /* ����ϰ�� */
	private String vidName;
	private long vidSize;
	private String vidOriName;

	public VideoVO() {
		super();
	}

	public VideoVO(int vidNo, String vidTitle, long vidHits, int vidCom, String vidurl, int vidLike, Timestamp vidDate,
			String vidEx, int vidTheme, int userNo, String vidThu, String vidName, long vidSize, String vidOriName) {
		super();
		this.vidNo = vidNo;
		this.vidTitle = vidTitle;
		this.vidHits = vidHits;
		this.vidCom = vidCom;
		this.vidurl = vidurl;
		this.vidLike = vidLike;
		this.vidDate = vidDate;
		this.vidEx = vidEx;
		this.vidTheme = vidTheme;
		this.userNo = userNo;
		this.vidThu = vidThu;
		this.vidName = vidName;
		this.vidSize = vidSize;
		this.vidOriName = vidOriName;
	}

	public int getVidNo() {
		return vidNo;
	}

	public void setVidNo(int vidNo) {
		this.vidNo = vidNo;
	}

	public String getVidTitle() {
		return vidTitle;
	}

	public void setVidTitle(String vidTitle) {
		this.vidTitle = vidTitle;
	}

	public long getVidHits() {
		return vidHits;
	}

	public void setVidHits(long vidHits) {
		this.vidHits = vidHits;
	}

	public int getVidCom() {
		return vidCom;
	}

	public void setVidCom(int vidCom) {
		this.vidCom = vidCom;
	}

	public String getVidurl() {
		return vidurl;
	}

	public void setVidurl(String vidurl) {
		this.vidurl = vidurl;
	}

	public int getVidLike() {
		return vidLike;
	}

	public void setVidLike(int vidLike) {
		this.vidLike = vidLike;
	}

	public Timestamp getVidDate() {
		return vidDate;
	}

	public void setVidDate(Timestamp vidDate) {
		this.vidDate = vidDate;
	}

	public String getVidEx() {
		return vidEx;
	}

	public void setVidEx(String vidEx) {
		this.vidEx = vidEx;
	}

	public int getVidTheme() {
		return vidTheme;
	}

	public void setVidTheme(int vidTheme) {
		this.vidTheme = vidTheme;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getVidThu() {
		return vidThu;
	}

	public void setVidThu(String vidThu) {
		this.vidThu = vidThu;
	}

	public String getVidName() {
		return vidName;
	}

	public void setVidName(String vidName) {
		this.vidName = vidName;
	}

	public long getVidSize() {
		return vidSize;
	}

	public void setVidSize(long vidSize) {
		this.vidSize = vidSize;
	}

	public String getVidOriName() {
		return vidOriName;
	}

	public void setVidOriName(String vidOriName) {
		this.vidOriName = vidOriName;
	}

	@Override
	public String toString() {
		return "VideoVO [vidNo=" + vidNo + ", vidTitle=" + vidTitle + ", vidHits=" + vidHits + ", vidCom=" + vidCom
				+ ", vidurl=" + vidurl + ", vidLike=" + vidLike + ", vidDate=" + vidDate + ", vidEx=" + vidEx
				+ ", vidTheme=" + vidTheme + ", userNo=" + userNo + ", vidThu=" + vidThu + ", vidName=" + vidName
				+ ", vidSize=" + vidSize + ", vidOriName=" + vidOriName + "]";
	}

}
