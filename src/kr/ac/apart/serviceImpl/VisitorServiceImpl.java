package kr.ac.apart.serviceImpl;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.VisitorDAO;
import kr.ac.apart.service.VisitorService;
import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

@Service("visitorService")
public class VisitorServiceImpl implements VisitorService {
<<<<<<< HEAD
	
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
		System.out.println("visitorService");
		
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
	public List<VisitorVO> getVisitorList(String id){     //user id�� �̿� �湮�� list
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
	public void updateVisitor(String no){
		visitorDao.updateVisitor(no);
	}
	
	@Override
	public List<Visit_RecordVO> getVisitorListManager(){
		List<Visit_RecordVO> visitList = visitorDao.getVisitorListManager();
		
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
	public void deleteVisitRecord(String no){
		int count  = visitorDao.deleteVisitRecord(no);
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
=======
   
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
      System.out.println("visitorService");
      
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
   public List<VisitorVO> getVisitorList(String id){     //user id¸¦ ÀÌ¿ë ¹æ¹®°´ list
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
   public void updateVisitor(String no){
      visitorDao.updateVisitor(no);
   }
   
   @Override
   public List<Visit_RecordVO> getVisitorListManager(){
      List<Visit_RecordVO> visitList = visitorDao.getVisitorListManager();
      
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
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
}
