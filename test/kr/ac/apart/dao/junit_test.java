package kr.ac.apart.dao;

import java.io.IOException;
import java.util.List;

import kr.ac.apart.vo.FlagVO;
import kr.ac.apart.vo.ParkingVO;
import kr.ac.apart.vo.TaxVO;
//import kr.ac.apart.vo.UserVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class junit_test {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ParkingDAO parkingDao;
	@Autowired
	private FlagDAO flagdao;
	@Autowired
	private TaxDAO taxDao;

	@Test
	public void getIsFull() {
		ParkingVO pv=new ParkingVO();
		pv.setFloor("B1 ");
		pv.setSection("A ");
		pv.setParking_lot("2 ");
		String result = parkingDao.getParking_info(pv);
		System.out.println(result);
	}

	@Test
	public void updateParking() throws IOException {
		ParkingVO pv=new ParkingVO();
		pv.setFloor("B1");
		pv.setSection("A");
		pv.setParking_lot("1");
		pv.setIsfull("FULL");
		parkingDao.updateIsFull(pv);
	}
	
	@Test
	public void getSectionCount(){
		ParkingVO parking=new ParkingVO();
		parking.setFloor("B1");
		parking.setSection("A ");
		int sectionCount=parkingDao.getSectionCount(parking);
		System.out.println("sectionCount="+sectionCount);
	}
	
	@Test
	public void getFloorCount(){
		int floorCount=parkingDao.getFloorCount("B1 ");
		System.out.println("floorCount="+floorCount);
	}

	@Test
	public void getParkCount(){
		int Count=parkingDao.getParkCount();
		System.out.println("parkCount="+Count);
	}
	
	@Test
	public void addTax() throws Exception{
		TaxVO taxVo = new TaxVO();
		taxVo.setUser_id("2");
		taxVo.setYear(2014);
		taxVo.setMonth(10);
		taxVo.setBasic_tax(10000);
		taxVo.setElectric_tax(10000);
		taxVo.setHeating_tax(100);
		taxVo.setInternet_tax(3000);
		System.out.println(taxVo);
		taxDao.addTax(taxVo);
		System.out.println(taxVo);
	}
	@Test
	public void getTaxList(){
		List<TaxVO> list = taxDao.getTaxList();
		System.out.println(list);
	}
	@Test
	public void getOneTax(){
		List<TaxVO> list = taxDao.getOneTax("2");
		System.out.println(list);
	}
}
