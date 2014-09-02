package kr.ac.apart.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.VisitorVO;

public interface VisitorService {
	public int addVisitor(VisitorVO vo);
	public int addVisitorManager(VisitorVO vo);
	public VisitorVO insert(String user_id, String visitor_name, String business, String fixed);
	public List<VisitorVO> getVisitorList(String id);
	public void deleteVisitor(String no);
}
