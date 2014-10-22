package kr.ac.apart.dao;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.util.NestedServletException;

import kr.ac.apart.vo.TaxVO;

public interface TaxDAO{
	public void addTax(TaxVO tax_vo)  throws Exception;
	public List<TaxVO> getTaxList();
	public List<TaxVO> getOneTax(String user_id);
}
