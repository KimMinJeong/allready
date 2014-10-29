package kr.ac.apart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.ExpressDAO;
import kr.ac.apart.dao.UserDAO;
import kr.ac.apart.service.ExpressService;
import kr.ac.apart.vo.ExpressVO;
import kr.ac.apart.vo.UserVO;

@Service("expressService") 
public class ExpressServiceImpl implements ExpressService {

    @Autowired 
    private ExpressDAO expressDAO;
    @Autowired
    private UserDAO userDAO;

    @Override 
    public ExpressVO addExpress(String user_id, String orderer, String express_company) throws Exception{
        ExpressVO vo = new ExpressVO();
    
        vo.setUser_id(user_id);
        vo.setOrderer(orderer);
        vo.setExpress_company(express_company);
        
        expressDAO.addExpress(vo);
        
        return vo;
    }

    @Override 
    public List<ExpressVO> getExpressList(int page){
        List<ExpressVO> list = expressDAO.getExpressList(page);
        
        return list;
    }
    
    @Override 
    public void updateExpress(ExpressVO vo){
    	
        expressDAO.updateExpress(vo);
    }
    
    @Override
    public ExpressVO getExpressOne(int express_id){
    	
        ExpressVO vo = expressDAO.getExpressOne(express_id);
        
        return vo;
    }

	@Override
	public void ExpressArrive(UserVO user) {
		user.setExpress("TRUE");
		userDAO.expressModify(user);
	}

	@Override
	public void ExpressCheck(UserVO user) {
		user.setExpress("FALSE");
		userDAO.expressModify(user);
	}
	
	@Override
	public int getExpressRowNum(){
		int count = expressDAO.getExpressRowNum();

		return count;
	}
}