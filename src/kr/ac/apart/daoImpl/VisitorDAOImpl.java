package kr.ac.apart.daoImpl;

import java.util.List;

import kr.ac.apart.dao.VisitorDAO;
import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("visitorDAO")
public class VisitorDAOImpl implements VisitorDAO{
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public int addVisitor(VisitorVO vo){
		return (Integer) sqlMapClientTemplate.update("addVisitor", vo);
	}
	
	public List<VisitorVO> getVisitorList(String id){
		return (List<VisitorVO>) sqlMapClientTemplate.queryForList("getVisitorList", id);
	}
	
	public int deleteVisitor(String id){
		return (Integer) sqlMapClientTemplate.delete("deleteVisitor", id);
	}
	
	public boolean addVisitorManager(){
		sqlMapClientTemplate.insert("addVisitorManager", new Visit_RecordVO());
		return true;
	}

}
