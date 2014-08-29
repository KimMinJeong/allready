package kr.ac.apart.serviceImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.VisitorDAO;
import kr.ac.apart.service.VisitorService;
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
	public List<VisitorVO> getVisitorList(String id){     //user id를 이용 방문객 list
		List<VisitorVO> visitorList = visitorDao.getVisitorList(id);
		
		return visitorList;
	}
	
	@Override
	public void deleteVisitor(String no){
		System.out.println("deleteService");
		visitorDao.deleteVisitor(no);
	}

}
