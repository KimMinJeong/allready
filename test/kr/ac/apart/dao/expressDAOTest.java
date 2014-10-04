package kr.ac.apart.dao;
import static org.junit.Assert.*;


import java.util.List;

import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.ExpressVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class expressDAOTest {

	@Autowired 
	private ExpressDAO expressDao;
	@Autowired
	private BoardDAO boardDAO;
	
	@Test
	public void test() {
		
		ExpressVO vo = expressDao.getExpressOne(1);
		
		vo.setReceiver("aaa");
		expressDao.updateExpress(vo);
		assertEquals(vo.getReceiver(), "aaa");
		
	}
	

	

}
