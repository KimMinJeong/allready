package kr.ac.apart.dao;

import java.io.IOException;
import kr.ac.apart.vo.ParkingVO;
//import kr.ac.apart.vo.UserVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class junit_test {
//	@Autowired
//	private UserDAO userDao;
	@Autowired
	private ParkingDAO parkingDao;

//	@Test
//	public void getUser() {
//		UserVO user = userDao.getUser("1031401");
//		System.out.println(user);
//		assertEquals("1031401", user.getUser_id());
//	}
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
		pv.setFloor("B1 ");
		pv.setSection("A ");
		pv.setParking_lot("1 ");
		pv.setIsfull("EMPTY");
		pv.setParking_no(1);
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

}
