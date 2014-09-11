package kr.ac.apart.vo;

public class BoardVO {
	private int board_no;
	private String writer_id;
	private String category;
	private String title;
	private String contents;
	private String reg_date;
	private int view_count;
	private int good;
	private int bad;
	private String anonymous;
	private String closed;
	private String file_name;
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", writer_id=" + writer_id
				+ ", category=" + category + ", title=" + title + ", contents="
				+ contents + ", reg_date=" + reg_date + ", view_count="
				+ view_count + ", good=" + good + ", bad=" + bad
				+ ", anonymous=" + anonymous + ", closed=" + closed + ", file_name="
				+ file_name + "]";
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getAnonymous() {
		return anonymous;
	}
	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}
	public String getClosed() {
		return closed;
	}
	public void setClosed(String closed) {
		this.closed = closed;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
}
