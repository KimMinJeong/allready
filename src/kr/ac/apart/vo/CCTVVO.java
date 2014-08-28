package kr.ac.apart.vo;

public class CCTVVO {
	private int cctv_no;
	private String file_name;
	private String reg_date;
	@Override
	public String toString() {
		return "CCTVVO [cctv_no=" + cctv_no + ", file=" + file_name + ", reg_date="
				+ reg_date + "]";
	}
	public int getCctv_no() {
		return cctv_no;
	}
	public void setCctv_no(int cctv_no) {
		this.cctv_no = cctv_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
