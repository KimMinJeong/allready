package kr.ac.apart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.CommentsDAO;
import kr.ac.apart.service.CommentsService;
import kr.ac.apart.vo.CommentsVO;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
	
	@Autowired
	private CommentsDAO commentsDao;
	
	@Override
	public int addComments(int board_no, String writer_id, String contents){	
		CommentsVO vo = new CommentsVO();
		
		vo.setBoard_no(board_no);
		vo.setWriter_id(writer_id);
		vo.setContents(contents);
		
		int count = commentsDao.addComments(vo);
	
		return count;
	}
	
	@Override
	public String getCommentsRegDate(){
		String regDate = commentsDao.getCommentsRegDate();
		
		return regDate;
	}
	
	@Override
	public int getMaxCommentsNo(){
		int maxCommentsNo = commentsDao.getMaxCommentsNo();
		
		return maxCommentsNo;
	}
	
	@Override
	public void deleteComments(int commentsNo){
		commentsDao.deleteComments(commentsNo);
	}
	
	@Override
	public List<CommentsVO> getComments(int board_no){
		List<CommentsVO> vo =  commentsDao.getComments(board_no);
		
		return vo;
	}

}
