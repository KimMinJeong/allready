package kr.ac.apart.vo;

public class ExpressVO {
	private int express_id;
	private String user_id;
	private String orderer;
	private String receiver;
	private String express_company;
	private String checked;
	private String reg_date;
	@Override
	public String toString() {
		return "ExpressVO [express_id=" + express_id + ", user_id=" + user_id
				+ ", orderer=" + orderer + ", receiver=" + receiver
				+ ", express_company=" + express_company + ", checked="
				+ checked + ", reg_date=" + reg_date + "]";
	}
	public int getExpress_id() {
		return express_id;
	}
	public void setExpress_id(int express_id) {
		this.express_id = express_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getExpress_company() {
		return express_company;
	}
	public void setExpress_company(String express_company) {
		this.express_company = express_company;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
