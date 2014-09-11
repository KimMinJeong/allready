package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

public interface VisitorDAO {
	public int addVisitor(VisitorVO vo);
	public List<VisitorVO> getVisitorList(String id);
	public int deleteVisitor(String id);
	public int addVisitorManager();
	public int updateVisitor(String visitor_no);
	public List<Visit_RecordVO> getVisitorListManager();
	public List<VisitorVO> getVisitorListAll();
	public String getRegDate();
	public int deleteVisitRecord(String id);
	public int addVisitRecord(int visitorNo);
	public int getMaxVisitRecordNo();
}
