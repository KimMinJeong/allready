package kr.ac.apart.dao;

<<<<<<< HEAD
public interface BoardDAO {
	
=======
import java.util.List;

import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.CommentsVO;

public interface BoardDAO {
	public void add(BoardVO vo);
	public List<BoardVO> BoardList(String category);
	public BoardVO getOne(int board_no);
	public int delete(int board_no);
	public void updateBoard(BoardVO vo);
	public List<BoardVO> searchBoard(BoardVO search);
	public CommentsVO addComments(CommentsVO vo);
	public List<CommentsVO> getComments(int board_no);
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
}
