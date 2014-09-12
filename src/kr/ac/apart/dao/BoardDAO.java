package kr.ac.apart.dao;


import java.util.List;

import kr.ac.apart.vo.BoardVO;

public interface BoardDAO {
	public void add(BoardVO vo);
	public List<BoardVO> BoardList(String category);
	public BoardVO getOne(int board_no);
	public int delete(int board_no);
	public void updateBoard(BoardVO vo);
}
