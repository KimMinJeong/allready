package kr.ac.apart.dao;

import java.util.List;

<<<<<<< HEAD
=======
import kr.ac.apart.vo.Visit_RecordVO;
>>>>>>> e87634fd0939a89a1fb61aa946f933711e0526f8
import kr.ac.apart.vo.VisitorVO;

public interface VisitorDAO {
	public int addVisitor(VisitorVO vo);
	public List<VisitorVO> getVisitorList(String id);
	public int deleteVisitor(String id);
<<<<<<< HEAD
	public boolean addVisitorManager();
=======
	public int addVisitorManager();
	public int updateVisitor(String visitor_no);
	public List<Visit_RecordVO> getVisitorListManager();
	public List<VisitorVO> getVisitorListAll();
	public String getRegDate();
	public int deleteVisitRecord(String id);
	public int addVisitRecord(int visitorNo);
	public int getMaxVisitRecordNo();
>>>>>>> e87634fd0939a89a1fb61aa946f933711e0526f8
}
