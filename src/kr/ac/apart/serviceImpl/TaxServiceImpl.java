package kr.ac.apart.serviceImpl;

import java.util.List;

import kr.ac.apart.dao.TaxDAO;
import kr.ac.apart.service.TaxService;
import kr.ac.apart.vo.TaxVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("taxService")
public class TaxServiceImpl implements TaxService{
	@Autowired
	private TaxDAO taxDao;
	
	public TaxVO addTax(String user_id, int year, int month, int basic_tax,
    		int electric_tax, int water_tax, int heating_tax, int internet_tax){
		
		TaxVO tax_vo = new TaxVO();
		tax_vo.setUser_id(user_id);
		tax_vo.setYear(year);
		tax_vo.setMonth(month);
		tax_vo.setBasic_tax(basic_tax);
		tax_vo.setElectric_tax(electric_tax);
		tax_vo.setWater_tax(water_tax);
		tax_vo.setHeating_tax(heating_tax);
		tax_vo.setInternet_tax(internet_tax);
		
		taxDao.addTax(tax_vo);
		
		return tax_vo;
	}
	@Override
	public List<TaxVO> getTaxList(){
		List<TaxVO> tax_vo = taxDao.getTaxList();
		return tax_vo;
	}
	@Override
	public List<TaxVO> getOneTax(String user_id) {
		List<TaxVO> tax_vo = taxDao.getOneTax(user_id);
		return tax_vo;
	}
}
