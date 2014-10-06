package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.BoardVO;

public interface BoardService {
	public BoardVO addBoard(String writer_id,String category, String title, String contents, String anonymous, String closed);
	public List<BoardVO> NoticeBoardList(int page);
	public List<BoardVO> ComplainBoardList(int page);
	public List<BoardVO> FreeBoardList(int page);
	public BoardVO getBoardDetail(int board_no);
	public BoardVO delete(int board_no);
	public void updateBoard(BoardVO board);
	public List<BoardVO> searchBoard(String condition, String str, String category);
	public void addGood(int board_no);
	public void addBad(int board_no);
	public void updateClicks(int board_no);
	public List<BoardVO> getNoticeList();
	public int getRowNum(String category);
}
