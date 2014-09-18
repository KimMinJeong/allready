package kr.ac.apart.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

public interface VisitorService {
   public int addVisitor(VisitorVO vo);
   public int addVisitorManager(VisitorVO vo);
   public VisitorVO insert(String user_id, String visitor_name, String business, String fixed);
   public List<VisitorVO> getVisitorList(String id);
   public void deleteVisitor(String no);
   public void updateVisitor(String no);
   public List<Visit_RecordVO> getVisitorListManager();
   public List<VisitorVO> getVisitorListAll();
   public String getRegDate();
   public void addVisitormanagerOnly();
   public int deleteVisitRecord(int no);
   public int addVisitRecord(int visitorNo);
   public int getMaxVisitRecordNo();
}
