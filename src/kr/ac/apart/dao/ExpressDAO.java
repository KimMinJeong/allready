package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.ExpressVO;

public interface ExpressDAO {
	public void addExpress(ExpressVO vo);
	public List<ExpressVO> getExpressList(int page);
	public void updateExpress(ExpressVO vo);
	public ExpressVO getExpressOne(int express_id);
	public int getExpressRowNum();
}