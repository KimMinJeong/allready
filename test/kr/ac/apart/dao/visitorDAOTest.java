package kr.ac.apart.dao;
import static org.junit.Assert.*;

import java.util.List;

import kr.ac.apart.vo.Visit_RecordVO;
import kr.ac.apart.vo.VisitorVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class visitorDAOTest {
	
	@Autowired
	private VisitorDAO visitorDao;
	
	@Test
	public void addVisitorTest(){
		VisitorVO vo = new VisitorVO();
		vo.setUser_id("111");
		
		int count = visitorDao.addVisitor(vo);
		assertEquals(count, 1);
	}
	
	@Test
	public void getVisitorListTest(){
		List<VisitorVO> list = visitorDao.getVisitorList("111");
		System.out.println(list);
		assertNotNull(list);
	}
	
	@Test
	public void deleteVisitorTest(){
		int count = visitorDao.deleteVisitor("1");
		
		assertEquals(count, 1);
	}
	
	@Test
	public void addVisitRecordTest(){
		int count = visitorDao.addVisitorManager();
		
		assertEquals(count, 27);
	}
	
	@Test
	public void updateVisitorTest(){
		int count = visitorDao.updateVisitor("71");
		
		assertEquals(count, 1);
	}
	
	@Test
	public void getVisitorListManagerTest(){
		List<Visit_RecordVO> list = visitorDao.getVisitorListManager();
		System.out.println(list);

		assertNotNull(list);
	}
	
	@Test
	public void getVisitorListAllTest(){
		List<VisitorVO> list = visitorDao.getVisitorListAll();
		System.out.println(list);
		
		assertNotNull(list);
	}
	
	@Test
	public void getRegDate(){

		String vo =  visitorDao.getRegDate();
		System.out.println(vo);
		assertNotNull(vo);
		
	}
	
	@Test
	public void deleteVisitRecordTest(){
		int count = visitorDao.deleteVisitRecord(203);
		assertEquals(count, 1);
	}
	
	@Test
	public void addVisitRecordTest2(){
		int count = 0;
		System.out.println("count="+count);
		count = visitorDao.addVisitRecord(144);
		System.out.println("count="+count);
        assertEquals(count, 1);
	}
	
	@Test
	public void getMaxVisitRecordNoTest(){
		int count = visitorDao.getMaxVisitRecordNo();
		System.out.println(count);
	}
}
