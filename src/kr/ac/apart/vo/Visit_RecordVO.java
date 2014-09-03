package kr.ac.apart.vo;

public class Visit_RecordVO {
	private int visit_record_no;
	private int visitor_no;
	private String reg_date;
	@Override
	public String toString() {
		return "Visit_RecordVO [visit_record_no=" + visit_record_no
				+ ", visitor_no=" + visitor_no + ", reg_date=" + reg_date + "]";
	}
	public int getVisit_record_no() {
		return visit_record_no;
	}
	public void setVisit_record_no(int visit_record_no) {
		this.visit_record_no = visit_record_no;
	}
	public int getVisitor_no() {
		return visitor_no;
	}
	public void setVisitor_no(int visitor_no) {
		this.visitor_no = visitor_no;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
