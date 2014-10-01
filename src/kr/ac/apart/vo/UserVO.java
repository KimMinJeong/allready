package kr.ac.apart.vo;

public class UserVO {
	private String user_id;
	private String password;
	private String user_name;
	private String e_mail;
	private String phone;
	private String role;
	private String express;
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", password=" + password
				+ ", user_name=" + user_name + ", e_mail=" + e_mail
				+ ", phone=" + phone + ", role=" + role + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getExpress() {
		return express;
	}
	public void setExpress(String express) {
		this.express = express;
	}
}
