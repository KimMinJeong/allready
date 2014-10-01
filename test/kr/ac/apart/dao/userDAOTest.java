package kr.ac.apart.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import kr.ac.apart.vo.FamilyVO;
import kr.ac.apart.vo.Manager_DongVO;
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
	public void modifyManager(){
		UserVO vo = new UserVO();
		
		vo.setUser_id("m1");
		vo.setPassword("m1");
		vo.setUser_name("seul");
		vo.setPhone("010");
		
		int count = userDao.modifyManager(vo);
		
		assertEquals(count, 1);
	}
	
	@Test
	public void updateDong(){
		Manager_DongVO vo = new Manager_DongVO();
		
		vo.setDong("2");
		vo.setUser_id("m1");
		
		int count = userDao.updateManagerDong(vo);
		
		assertEquals(count, 1);
	}
	
	@Test
	public void deleteDong(){
		int count = userDao.deleteManageDong("m1");
		
		assertEquals(count, 1);
	}
	
	@Test
	public void getManagerDong(){
		List<Manager_DongVO> vo = userDao.getManagerDong("m1");
		System.out.println(vo);
	}
	
	@Test
	public void modifyUser(){
		UserVO vo = new UserVO();
		
		vo.setUser_id("1");
		vo.setUser_name("kim");
		vo.setPassword("1");
		
		int count = userDao.modifyUser(vo);
		
		assertEquals(count, 1);
	}
	
	@Test
	public void updateFamily(){
		FamilyVO vo = new FamilyVO();
		
		vo.setUser_id("1");
		vo.setName("kim");
		vo.setPhone("0613");
		
		int count = userDao.updateFamily(vo);
		
		assertEquals(count, 1);
	}
	
	@Test
	public void deleteFamily(){
		
		int count = userDao.deleteFamily("1");
		
		assertEquals(count, 1);
	}
	
	@Test
	public void getFamilyList(){
		List<FamilyVO> list = userDao.getFamilyList("1");
		
		System.out.println(list);
	}
	
	@Test
	public void getUser(){
		UserVO vo = new UserVO();
		
		vo = userDao.getUser("1");
		
		System.out.println(vo);
	}

	@Test
	public void modifyExpressTest(){
		UserVO user=new UserVO();
		user.setExpress("FALSE");
		user.setUser_id("1");
		userDao.expressModify(user);
	}
}
