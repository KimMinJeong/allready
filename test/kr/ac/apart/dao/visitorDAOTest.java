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
	public void modifyVisitorTest(){
		VisitorVO vo = new VisitorVO();
		
		vo.setVisitor_no(155);
		vo.setUser_id("1");
		vo.setVisitor_name("hihi");
		vo.setBusiness("hihi");
		
		int count = visitorDao.modifyVisitor(vo);
		
		assertEquals(count, 1);
	}


	
}
