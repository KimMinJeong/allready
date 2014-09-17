package kr.ac.apart.dao;

import static org.junit.Assert.assertEquals;
import kr.ac.apart.vo.UserVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class userDAOTest {
	
	@Autowired
	private UserDAO userDao;
	
	@Test
	public void modiryManager(){
		UserVO vo = new UserVO();
		
		vo.setUser_id("m1");
		vo.setPassword("m1");
		vo.setUser_name("seul");
		vo.setPhone("010");
		
		int count = userDao.modifyManager(vo);
		
		assertEquals(count, 1);
	}

}
