package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.BoardVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class boardDAOTest {

	@Autowired
	public BoardDAO boardDao;
	
	@Test
	public void getNoticeList(){
		List<BoardVO> list = boardDao.getNoticeList();
		
		System.out.println(list);
	}

}
