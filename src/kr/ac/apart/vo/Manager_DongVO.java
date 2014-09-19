package kr.ac.apart.vo;

public class Manager_DongVO {
	private String dong;
	private String user_id;
	@Override
	public String toString() {
		return "Manager_DongVO [dong=" + dong + ", user_id=" + user_id + "]";
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
