package kr.ac.apart.serviceImpl;

import java.util.List;

import kr.ac.apart.dao.BoardDAO;
import kr.ac.apart.service.BoardService;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.CommentsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDao;

	@Override
	public BoardVO addBoard(String writer_id,String category, String title, String contents, String anonymous, String closed) {
		BoardVO vo = new BoardVO();
		vo.setWriter_id(writer_id);
		vo.setCategory(category);
		vo.setTitle(title);
		vo.setContents(contents);
		if(anonymous==null)
			vo.setAnonymous("IDENTIFIED");
		else
			vo.setAnonymous(anonymous);
		if(closed==null)
			vo.setClosed("OPEN");
		else
			vo.setClosed(closed);
		boardDao.add(vo);
		return vo;
	}

	@Override
	public List<BoardVO> NoticeBoardList() {
		List<BoardVO> list=boardDao.BoardList("notice");
		return list;
	}

	@Override
	public List<BoardVO> ComplainBoardList() {
		List<BoardVO> list=boardDao.BoardList("complain");
		return list;
	}

	@Override
	public List<BoardVO> FreeBoardList() {
		List<BoardVO> list=boardDao.BoardList("free");
		return list;
	}

	@Override
	public BoardVO getBoardDetail(int board_no) {
		BoardVO vo = boardDao.getOne(board_no);
		return vo;
	}

	@Override
	public BoardVO delete(int board_no) {
		BoardVO vo = boardDao.getOne(board_no);
		boardDao.delete(board_no);
		return vo;
	}
	@Override
	public void updateBoard(BoardVO board) {
		boardDao.updateBoard(board);
	}
	@Override
	public List<BoardVO> searchBoard(String condition, String str) {
		BoardVO search=new BoardVO();
		search.setSearchKind(condition);
		search.setSearchStr(str);
		List<BoardVO> list=boardDao.searchBoard(search);
		return list;
	}
	@Override
	public CommentsVO addComments(CommentsVO comments){
		CommentsVO vo = boardDao.addComments(comments);
		return vo;	
	}
	@Override
	public List<CommentsVO> getComments(int board_no) {
		return boardDao.getComments(board_no);
	}
}
