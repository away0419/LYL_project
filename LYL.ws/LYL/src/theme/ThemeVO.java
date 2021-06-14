package theme;

public class ThemeVO {
	private int thNo;
	private String thName;
	
	public ThemeVO() {
		super();
	}

	public ThemeVO(int thNo, String thName) {
		super();
		this.thNo = thNo;
		this.thName = thName;
	}

	public int getThNo() {
		return thNo;
	}

	public void setThNo(int thNo) {
		this.thNo = thNo;
	}

	public String getThName() {
		return thName;
	}

	public void setThName(String thName) {
		this.thName = thName;
	}

	@Override
	public String toString() {
		return "ThemeVO [thNo=" + thNo + ", thName=" + thName + "]";
	}
	
	
}
