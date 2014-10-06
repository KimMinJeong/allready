package kr.ac.apart.serviceImpl;

import java.util.List;

import kr.ac.apart.dao.BoardDAO;
import kr.ac.apart.service.BoardService;
import kr.ac.apart.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
    @Autowired 
    private BoardDAO boardDao;
 
    @Override
    public BoardVO addBoard(String writer_id, String category, String title, String contents, String anonymous, String closed){
        BoardVO vo = new BoardVO();
        
        vo.setWriter_id(writer_id);
        vo.setCategory(category);
        vo.setTitle(title);
        vo.setContents(contents);
        
        if (anonymous == null) 
            vo.setAnonymous("IDENTIFIED");
        else 
            vo.setAnonymous(anonymous);
        if (closed == null) 
            vo.setClosed("OPEN");
        else 
            vo.setClosed(closed);
        
        boardDao.add(vo);
        
        return vo;
    }

    @Override
    public List < BoardVO > NoticeBoardList(int page){
        List < BoardVO > list = boardDao.BoardList("notice", page);
        
        return list;
    }

    @Override
    public List < BoardVO > ComplainBoardList(int page){
        List < BoardVO > list = boardDao.BoardList("complain", page);
        
        return list;
    }
    
    @Override
    public List < BoardVO > FreeBoardList(int page){
        List < BoardVO > list = boardDao.BoardList("free", page);
        
        return list;
    }

    @Override
    public BoardVO getBoardDetail(int board_no){
        BoardVO vo = boardDao.getOne(board_no);
        
        return vo;
    }

    @Override
    public BoardVO delete(int board_no){
        BoardVO vo = boardDao.getOne(board_no);
        
        boardDao.delete(board_no);
        
        return vo;
    }

    @Override
    public void updateBoard(BoardVO board){

        boardDao.updateBoard(board);
    }

    @Override
    public List < BoardVO > searchBoard(String condition, String str, String category){
        BoardVO search = new BoardVO();
        
        search.setCategory(category);
        search.setSearchKind(condition);
        search.setSearchStr(str);
        
        List < BoardVO > list = boardDao.searchBoard(search);
        
        return list;
    }

    @Override
    public void addGood(int board_no){

        boardDao.addGood(board_no);
    }

    @Override
    public void addBad(int board_no){
    	
        boardDao.addBad(board_no);
    }

	@Override
	public void updateClicks(int board_no) {
		boardDao.updateClicks(board_no);
	}

    @Override
    public List<BoardVO> getNoticeList(){
    	List<BoardVO> list = boardDao.getNoticeList();
    	
    	return list;
    }
    
    @Override
    public int getRowNum(String category){
    	int rowNum = boardDao.getRowNum(category);
    	
    	return rowNum;
    }
}