package kr.ac.apart.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import kr.ac.apart.vo.CommentsVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class commentsDAOTest {
	
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired
	private BoardDAO boardDAO;
	
	@Test
	public void addComments(){
		
		CommentsVO vo = new CommentsVO();
		
		vo.setBoard_no(32);
		vo.setWriter_id("1");
		vo.setContents("´ñ±Û");
		
		int count = commentsDAO.addComments(vo);
		
		assertEquals(count, 1);
	}
	
	@Test
	public void getRegDate(){
		String regDate = commentsDAO.getCommentsRegDate();
		System.out.println(regDate);
	}
	
	@Test
	public void getMaxCommentsNo(){
		int commentNo = commentsDAO.getMaxCommentsNo();
		System.out.println(commentNo);
	}
	
	@Test
	public void deleteComments(){
		int count = commentsDAO.deleteComments(20);
		
		assertEquals(count, 1);
	}
	
	@Test
	public void getComment(){
		List<CommentsVO> vo = commentsDAO.getComments(32);
		
		System.out.println(vo);
	}
	

	

}
