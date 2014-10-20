package kr.ac.apart.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.apart.dao.TaxDAO;
import kr.ac.apart.vo.TaxVO;

@Repository("taxDao")
public class TaxDAOImpl implements TaxDAO{
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	@Override
	public void addTax(TaxVO tax_vo) {
		sqlMapClientTemplate.insert("addTax", tax_vo);
	}
	
	public List<TaxVO> getTaxList(){
		return sqlMapClientTemplate.queryForList("getTaxList");
	}
	
	public List<TaxVO> getOneTax(String user_id){
		return sqlMapClientTemplate.queryForList("getOneTax", user_id);
	}
}
