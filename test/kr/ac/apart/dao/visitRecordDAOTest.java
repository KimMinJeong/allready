package kr.ac.apart.dao;

import static org.junit.Assert.assertEquals;
import kr.ac.apart.vo.Visit_RecordVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:./resource/applicationContext.xml"})
public class visitRecordDAOTest {

	@Autowired
	private VisitorDAO visitorDao;
	
	@Test
	public void modyfiVisitRecord() {
		Visit_RecordVO vo = new Visit_RecordVO();
		
		vo.setVisit_record_no(215);
		vo.setVisitor_no(160);
		vo.setReg_date("14-10-11");
		
		int count = visitorDao.modifyVisitRecord(vo);
		
		assertEquals(count, 1);
	}

}
