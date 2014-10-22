package kr.ac.apart.service;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;

import kr.ac.apart.vo.TaxVO;

public interface TaxService {
	public TaxVO addTax(String user_id, int year, int month, int basic_tax,
    		int electric_tax, int water_tax, int heating_tax, int internet_tax)  throws Exception;
	public List<TaxVO> getTaxList();
	public List<TaxVO> getOneTax(String user_id);
}
