package kr.ac.apart.vo;

public class FlagVO {
	private String good_id;
	private String bad_id;
	private String count_id;
	private int board_no;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getGood_id() {
		return good_id;
	}
	public void setGood_id(String good_id) {
		this.good_id = good_id;
	}
	public String getBad_id() {
		return bad_id;
	}
	public void setBad_id(String bad_id) {
		this.bad_id = bad_id;
	}
	public String getCount_id() {
		return count_id;
	}
	public void setCount_id(String count_id) {
		this.count_id = count_id;
	}
	@Override
	public String toString() {
		return "FlagVO [good_id=" + good_id + ", bad_id=" + bad_id
				+ ", count_id=" + count_id + ", board_no=" + board_no + "]";
	}
	
}
