package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.TaxVO;

public interface TaxDAO{
	public void addTax(TaxVO tax_vo);
	public List<TaxVO> getTaxList();
	public List<TaxVO> getOneTax(String user_id);
}
