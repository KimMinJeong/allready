package kr.ac.apart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.VisitorDAO;
import kr.ac.apart.service.VisitorService;
import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

@Service("visitorService")
public class VisitorServiceImpl implements VisitorService {
   
   @Autowired
   private VisitorDAO visitorDao;
   
   @Override
   public int addVisitor(VisitorVO vo){
      int count = 0;
      
      count = visitorDao.addVisitor(vo);

      return count;
   }
   
   @Override
   public int addVisitorManager(VisitorVO vo){
      int count = 0;
      
      count = visitorDao.addVisitor(vo);
      count = visitorDao.addVisitorManager();
      
      return count;
   }
   
   @Override
   public void addVisitormanagerOnly(){
	   
      visitorDao.addVisitorManager();  
   }
   
   @Override
   public VisitorVO insert(String user_id, String visitor_name, String business, String fixed){
      VisitorVO vo = new VisitorVO();
      
      vo.setUser_id(user_id);
      vo.setVisitor_name(visitor_name);
      vo.setBusiness(business);
      
      if(fixed == null){
         fixed = "UNFIXED";
      }
      else if(fixed.equals("on")){
         fixed = "FIXED";
      }
      
      vo.setFixed(fixed);
      
      return vo;
   }
   
   @Override
   public List<VisitorVO> getVisitorList(String id){
      List<VisitorVO> visitorList = visitorDao.getVisitorList(id);
      
      System.out.println(visitorList);
      
      return visitorList;
   }
   
   @Override
   public void deleteVisitor(String no){
      System.out.println("deleteService");
      
      visitorDao.deleteVisitor(no);
   }
   
   @Override
   public void updateVisitor(int visitorNo){
	   
      visitorDao.updateVisitor(visitorNo);
   }
   
   @Override
   public List<Visit_RecordVO> getVisitorListManager(int page){
	   
	   List<Visit_RecordVO> visitList = visitorDao.getVisitorListManager(page);
      
      return visitList;
   }
   
   @Override
   public List<VisitorVO> getVisitorListAll(){
      List<VisitorVO> visitorListAll = visitorDao.getVisitorListAll();
      
      return visitorListAll;
   }
   
   @Override
   public String getRegDate(){
      String regDate = visitorDao.getRegDate();
      
      return regDate;
   }
   
   @Override
   public int deleteVisitRecord(int no){
      int count  = visitorDao.deleteVisitRecord(no);
      
      return count;
   }
   
   @Override
   public int addVisitRecord(int visitorNo){
      int count = visitorDao.addVisitRecord(visitorNo);
      
      return count;
   }
   
   @Override
   public int getMaxVisitRecordNo(){
      int no = visitorDao.getMaxVisitRecordNo();
      
      return no;
   }
   
   @Override
   public void modifyVisitor(int visitorNo, String userId, String visitorName, String business){
	   VisitorVO vo = new VisitorVO();
	   
	   vo.setVisitor_no(visitorNo);
	   vo.setUser_id(userId);
	   vo.setVisitor_name(visitorName);
	   vo.setBusiness(business);
	   
	   visitorDao.modifyVisitor(vo);
   }
   
   @Override
   public void modifyVisitRecord(int visitRecordNo, int visitorNo, String regDate){
	   Visit_RecordVO vo = new Visit_RecordVO();
	   
	   vo.setVisit_record_no(visitRecordNo);
	   vo.setVisitor_no(visitorNo);
	   vo.setReg_date(regDate);
	   
	   visitorDao.modifyVisitRecord(vo);   
   }
   
   @Override
   public int countVisitRecord(){
	   return visitorDao.countVisitRecord();
   }
}