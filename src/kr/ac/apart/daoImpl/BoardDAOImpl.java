package kr.ac.apart.daoImpl;

import java.util.List;

import kr.ac.apart.dao.BoardDAO;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.CommentsVO;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@Override
	public void add(BoardVO vo) {
	
		sqlMapClientTemplate.insert("BoardAdd",vo);
	}
	
	@Override
	public List<BoardVO> BoardList(String category) {

		return (List<BoardVO>)sqlMapClientTemplate.queryForList("BoardList", category);
	
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
	public void updateBoard(BoardVO vo) {
		sqlMapClientTemplate.update("boardUpdate", vo);
	}

	@Override
	public List<BoardVO> searchBoard(BoardVO search) {
		List<BoardVO> list=sqlMapClientTemplate.queryForList("searchBoard", search);
		System.out.println(list);
		return list;
	}

	@Override
	public void addGood(int board_no) {
		sqlMapClientTemplate.update("addGood", board_no);
	}


	
}
