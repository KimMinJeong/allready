package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.ExpressVO;

public interface ExpressService {
	public ExpressVO addExpress(String user_id, String orderer, String express_company);
	public List<ExpressVO> getExpressList();
	public void updateExpress(ExpressVO vo);
	public ExpressVO getExpressOne(int express_id);
}
