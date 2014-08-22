package kr.ac.apart.dao;
import static org.junit.Assert.*;
import kr.ac.apart.vo.UserVO;

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

	@Test
	public void getUser() {
		UserVO user = userDao.getUser("1031401");
		System.out.println(user);
		assertEquals("1031401", user.getUser_id());
	}

}
