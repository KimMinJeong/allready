package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.ExpressVO;

public interface ExpressDAO {
	public void addExpress(ExpressVO vo);
	public List<ExpressVO> getExpressList();
	public void updateExpress(int express_id);
}
