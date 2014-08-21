package kr.ac.apart.vo;

public class FamilyVO {
	private int family_no;
	private String user_id;
	private String name;
	private String phone;
	@Override
	public String toString() {
		return "FamilyVO [family_no=" + family_no + ", user_id=" + user_id
				+ ", name=" + name + ", phone=" + phone + "]";
	}
	public int getFamily_no() {
		return family_no;
	}
	public void setFamily_no(int family_no) {
		this.family_no = family_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
