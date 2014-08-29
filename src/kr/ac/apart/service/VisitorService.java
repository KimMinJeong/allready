package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.VisitorVO;

public interface VisitorService {
	public int addVisitor(VisitorVO vo);
	public VisitorVO insert(String user_id, String visitor_name, String business, String fixed);
	public List<VisitorVO> getVisitorList(String id);
}
