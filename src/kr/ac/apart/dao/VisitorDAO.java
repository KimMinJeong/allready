package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.VisitorVO;

public interface VisitorDAO {
	public int addVisitor(VisitorVO vo);
	public List<VisitorVO> getVisitorList(String id);
	public int deleteVisitor(String id);

}
