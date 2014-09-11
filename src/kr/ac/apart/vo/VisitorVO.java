package kr.ac.apart.vo;

public class VisitorVO {
	private int visitor_no;
	private String user_id;
	private String visitor_name;
	private String business;
	private String fixed;
	private String viewing;
	
	@Override
	public String toString() {
		return "VisitorVO [visitor_no=" + visitor_no + ", user_id=" + user_id
				+ ", visitor_name=" + visitor_name + ", business=" + business
				+ ", fixed=" + fixed + ", viewing=" + viewing + "]";
	}
	public String getViewing() {
		return viewing;
	}
	public void setViewing(String viewing) {
		this.viewing = viewing;
	}
	public int getVisitor_no() {
		return visitor_no;
	}
	public void setVisitor_no(int visitor_no) {
		this.visitor_no = visitor_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getVisitor_name() {
		return visitor_name;
	}
	public void setVisitor_name(String visitor_name) {
		this.visitor_name = visitor_name;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getFixed() {
		return fixed;
	}
	public void setFixed(String fixed) {
		this.fixed = fixed;
	}
	
}