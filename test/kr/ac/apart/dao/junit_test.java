package kr.ac.apart.dao;
import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import kr.ac.apart.vo.ParkingVO;
import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.VisitorVO;

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
	private VisitorDAO visitorDao;

	@Test
	public void getUser() {
		UserVO user = userDao.getUser("1031401");
		System.out.println(user);
		assertEquals("1031401", user.getUser_id());
	}
	@Test
	public void getIsFull() {
		String result = parkingDao.getParking_info(1);
		System.out.println(result);
	}

	@Test
	public void updateParking() throws IOException {
		ParkingVO pv=new ParkingVO();
		pv.setParking_no(1);
		FileReader fr = null;
		BufferedReader br = null;
		String s =null;
		try{
			fr = new FileReader("../Apart/WebContent/parking_info/data.txt");
			br = new BufferedReader(fr);
			s = null;
			while((s=br.readLine())!=null)
			{
				System.out.println(s);
				pv.setIsfull(s);
				parkingDao.updateIsFull(pv);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			br.close();
			fr.close();
		}
	}
}
