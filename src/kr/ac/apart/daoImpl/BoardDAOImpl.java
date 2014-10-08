package kr.ac.apart.daoImpl;

import java.util.List;

import kr.ac.apart.dao.BoardDAO;
import kr.ac.apart.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("boardDao") 
public class BoardDAOImpl implements BoardDAO {
	
    @Autowired 
    private SqlMapClientTemplate sqlMapClientTemplate;

    @Override 
    public void add(BoardVO vo){
        sqlMapClientTemplate.insert("BoardAdd",vo);
    }
    
    @Override 
    public List<BoardVO> BoardList(String category, int page){
        return (List<BoardVO>) sqlMapClientTemplate.queryForList("BoardList", category, page, 10);
    }
    
    @Override 
    public BoardVO getOne(int board_no) {
        return (BoardVO)sqlMapClientTemplate.queryForObject("getBoardDetail",board_no);
    }
    
    @Override 
    public int delete(int board_no) {
        return (int)sqlMapClientTemplate.delete("boardDelete",board_no);
    }
    
    @Override 
    public void updateBoard(BoardVO vo){
        sqlMapClientTemplate.update("boardUpdate", vo);
    }
    
    @Override 
    public List<BoardVO> searchBoard(BoardVO search, int page){
        List<BoardVO> list = sqlMapClientTemplate.queryForList("searchBoard", search, page, 10);
        
        return list;
    }
    
    @Override 
    public List<BoardVO> allSearchBoard(BoardVO search){
        List<BoardVO> list = sqlMapClientTemplate.queryForList("searchBoard", search);
        
        return list;
    }
    
    @Override 
    public void addGood(int board_no){
        sqlMapClientTemplate.update("addGood", board_no);
    }
    
    @Override 
    public void addBad(int board_no){
        sqlMapClientTemplate.update("addBad", board_no);
    }

	@Override
	public void updateClicks(int board_no) {
		sqlMapClientTemplate.update("updateClicks",board_no);
	}

    @Override
    public List<BoardVO> getNoticeList(){
    	return (List<BoardVO>) sqlMapClientTemplate.queryForList("getNoticeList");
    }
    
    @Override
    public int getRowNum(String category){
    	return (Integer) sqlMapClientTemplate.queryForObject("getRowNum", category);
    }

}