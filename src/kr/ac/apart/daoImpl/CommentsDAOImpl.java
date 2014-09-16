package kr.ac.apart.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.ac.apart.dao.CommentsDAO;
import kr.ac.apart.vo.CommentsVO;

@Repository("commentsDao")
public class CommentsDAOImpl implements CommentsDAO{
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public int addComments(CommentsVO vo){
		 return (Integer) sqlMapClientTemplate.update("addComments", vo);
	}
	
	public String getCommentsRegDate(){
		return (String) sqlMapClientTemplate.queryForObject("getCommentsRegDate");
	}
	
	public int getMaxCommentsNo(){
		return (Integer) sqlMapClientTemplate.queryForObject("getMaxCommentsNo");
	}
	
	public int deleteComments(int commentsNo){
		return (Integer) sqlMapClientTemplate.delete("deleteComments", commentsNo);
	}
	
	public List<CommentsVO> getComments(int board_no){
		return (List<CommentsVO>) sqlMapClientTemplate.queryForList("getComments", board_no);
	}

}
