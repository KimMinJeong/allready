package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.BoardVO;

public interface BoardDAO {
    public void add(BoardVO vo);
    public List<BoardVO> BoardList(String category, int page);
    public BoardVO getOne(int board_no);
    public int delete(int board_no);
    public void updateBoard(BoardVO vo);
    public List<BoardVO> searchBoard(BoardVO search, int page);
    public void addGood(int board_no);
    public void addBad(int board_no);
    public void updateClicks(int board_no);
    public List<BoardVO> getNoticeList();
    public int getRowNum(String category);
}