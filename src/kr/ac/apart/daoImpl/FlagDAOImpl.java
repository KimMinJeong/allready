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

	@Override
	public void addBadId(FlagVO flagvo) {
		sqlMapClientTemplate.insert("badIdAdd",flagvo);
		
	}

	@Override
	public FlagVO getflagBad(FlagVO flagvo) {
		return (FlagVO)sqlMapClientTemplate.queryForObject("flagGetBad", flagvo);
	}

	@Override
	public void addCountId(FlagVO flagvo) {
		sqlMapClientTemplate.insert("countIdAdd",flagvo);
		
		
	}

	@Override
	public FlagVO getflagCountId(FlagVO flagvo) {
		return (FlagVO)sqlMapClientTemplate.queryForObject("flagGetCountId", flagvo);
	}





}
