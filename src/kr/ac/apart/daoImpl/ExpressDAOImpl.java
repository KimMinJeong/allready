package kr.ac.apart.daoImpl;

import java.util.List;

import kr.ac.apart.dao.ExpressDAO;
import kr.ac.apart.vo.ExpressVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("expressdDao")
public class ExpressDAOImpl implements ExpressDAO{

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	@Override
	public void addExpress(ExpressVO vo){
		sqlMapClientTemplate.insert("addExpress", vo);
	}

	@Override
	public List<ExpressVO> getExpressList(int page){
		return sqlMapClientTemplate.queryForList("getExpress", null, page, 10);
	}

	@Override
	public void updateExpress(ExpressVO vo){
		sqlMapClientTemplate.update("updateExpress", vo);
	}

	@Override
	public ExpressVO getExpressOne(int express_id){
		return (ExpressVO) sqlMapClientTemplate.queryForObject("getExpressOne", express_id);
	}
	
	@Override
	public int getExpressRowNum(){

		if(sqlMapClientTemplate.queryForObject("getExpressRowNum") != null){
			return (Integer) sqlMapClientTemplate.queryForObject("getExpressRowNum");
		}
		else
			return 0;
	}
}