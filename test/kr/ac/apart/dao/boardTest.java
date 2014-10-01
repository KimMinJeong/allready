package kr.ac.apart.dao;

import static org.junit.Assert.*;
import kr.ac.apart.vo.FlagVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class boardTest {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private FlagDAO flagdao;

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testupdateClicks(){
		 boardDAO.updateClicks(52);
		
	}
//	@Test
//	public void getFlag(){
//		FlagVO vo = flagdao.getflag(55);
//		System.out.println(vo);
//		assertEquals("1", vo.getGood_id());
//	}
//	

}
