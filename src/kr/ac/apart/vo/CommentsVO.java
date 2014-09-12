package kr.ac.apart.vo;

public class CommentsVO {
	private int comments_no;
	private int board_no;
	private String writer_id;
	private String contents;
	private String reg_date;
	@Override
	public String toString() {
		return "CommentsVO [comments_no=" + comments_no + ", board_no="
				+ board_no + ", writer_id=" + writer_id + ", contents="
				+ contents + ", reg_date=" + reg_date + "]";
	}
	public int getComments_no() {
		return comments_no;
	}
	public void setComments_no(int comments_no) {
		this.comments_no = comments_no;
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
	
}
