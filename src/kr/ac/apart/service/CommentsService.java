package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.CommentsVO;

public interface CommentsService {
	public int addComments(int board_no, String writer_id, String contents);
	public String getCommentsRegDate();
	public int getMaxCommentsNo();
	public void deleteComments(int commentsNo);
	public List<CommentsVO> getComments(int board_no);
}
