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
   
   public int addVisitorManager(){
      return (Integer) sqlMapClientTemplate.insert("addVisitorManager", new Visit_RecordVO());
   }
   
   public int updateVisitor(int visitor_no){
      return (Integer) sqlMapClientTemplate.update("updateVisitor", visitor_no);
   }
   
   public List<Visit_RecordVO> getVisitorListManager(int page){
      return (List<Visit_RecordVO>) sqlMapClientTemplate.queryForList("getVisitorListManager", null, page, 5);
      //앞의 두개의 파라미터는 동일, 세번째 파라미터는 가져올 페이지번호, 네번째 파라미터는 가져올 데이터 로우의 갯수
   }
   
   public List<VisitorVO> getVisitorListAll(){
      return (List<VisitorVO>) sqlMapClientTemplate.queryForList("getVisitorListAll");
   }
   
   public String getRegDate(){
      return (String) sqlMapClientTemplate.queryForObject("getRegDate");
   }
   
   public int deleteVisitRecord(int id){
      return (Integer) sqlMapClientTemplate.delete("deleteVisitRecord", id);
   }
   
   public int addVisitRecord(int visitorNo){
      return (Integer) sqlMapClientTemplate.update("addVisitRecord", visitorNo);
   }
   
   public int getMaxVisitRecordNo(){
      return (Integer) sqlMapClientTemplate.queryForObject("getMaxVisitRecordNo");
   }
   
   public int modifyVisitRecord(Visit_RecordVO vo){
	   return (Integer) sqlMapClientTemplate.update("modifyVisitRecord", vo);
   }
   
   public int modifyVisitor(VisitorVO vo){
	   return (Integer) sqlMapClientTemplate.update("modifyVisitor", vo);
   }
   
   public int countVisitRecord(){
	   return (Integer) sqlMapClientTemplate.queryForObject("countVisitRecord");
   }
}