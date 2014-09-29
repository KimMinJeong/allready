package kr.ac.apart.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.apart.dao.FlagDAO;
import kr.ac.apart.vo.FlagVO;

@Repository("flagDAO")
public class FlagDAOImpl implements FlagDAO {
	@Autowired 
	private SqlMapClientTemplate sqlMapClientTemplate;

	@Override
	public void addGoodId(FlagVO flagvo) {
		sqlMapClientTemplate.insert("goodIdAdd",flagvo);
	}

	@Override
	public FlagVO getflag(FlagVO flagvo) {
		return (FlagVO)sqlMapClientTemplate.queryForObject("flagGet", flagvo);
	}





}
