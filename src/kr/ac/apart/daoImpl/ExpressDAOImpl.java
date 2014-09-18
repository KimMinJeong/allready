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
	public void addExpress(ExpressVO vo) {
		
		sqlMapClientTemplate.insert("addExpress", vo);
		
	}

	@Override
	public List<ExpressVO> getExpressList() {
		
		return sqlMapClientTemplate.queryForList("getExpress");
	}

	@Override
	public void updateExpress(int express_id) {
		
		sqlMapClientTemplate.update("updateExpress", express_id);
	}

}
