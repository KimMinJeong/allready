package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.ExpressVO;
import kr.ac.apart.vo.UserVO;

public interface ExpressService {
	public ExpressVO addExpress(String user_id, String orderer, String express_company);
	public List<ExpressVO> getExpressList(int page);
	public void updateExpress(ExpressVO vo);
	public ExpressVO getExpressOne(int express_id);
	public void ExpressArrive(UserVO user);
	public void ExpressCheck(UserVO user);
	public int getExpressRowNum();
}
