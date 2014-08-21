package kr.ac.apart.vo;

public class CCTVVO {
	private int cctv_no;
	private String file;
	private String reg_date;
	@Override
	public String toString() {
		return "CCTVVO [cctv_no=" + cctv_no + ", file=" + file + ", reg_date="
				+ reg_date + "]";
	}
	public int getCctv_no() {
		return cctv_no;
	}
	public void setCctv_no(int cctv_no) {
		this.cctv_no = cctv_no;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
