package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.CommentsVO;

public interface CommentsDAO {
	public int addComments(CommentsVO vo);
	public String getCommentsRegDate();
	public int getMaxCommentsNo();
	public int deleteComments(int commentsNo);
	public List<CommentsVO> getComments(int board_no);
}
