package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

public interface VisitorDAO {
   public int addVisitor(VisitorVO vo);
   public List<VisitorVO> getVisitorList(String id);
   public int deleteVisitor(String id);
   public int addVisitorManager();
   public int updateVisitor(int visitor_no);
   public List<Visit_RecordVO> getVisitorListManager(int page);
   public List<VisitorVO> getVisitorListAll();
   public String getRegDate();
   public int deleteVisitRecord(int id);
   public int addVisitRecord(int visitorNo);
   public int getMaxVisitRecordNo();
   public int modifyVisitRecord(Visit_RecordVO vo);
   public int modifyVisitor(VisitorVO vo);
   public int countVisitRecord();
}