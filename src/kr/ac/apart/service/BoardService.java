package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.CommentsVO;

public interface BoardService {
	public BoardVO addBoard(String writer_id,String category, String title, String contents, String anonymous, String closed);
	public List<BoardVO> NoticeBoardList();
	public List<BoardVO> ComplainBoardList();
	public List<BoardVO> FreeBoardList();
	public BoardVO getBoardDetail(int board_no);
	public BoardVO delete(int board_no);
	public void updateBoard(BoardVO board);
	public List<BoardVO> searchBoard(String condition, String str);
	public CommentsVO addComments(CommentsVO comments);
	public List<CommentsVO> getComments(int board_no);
}
