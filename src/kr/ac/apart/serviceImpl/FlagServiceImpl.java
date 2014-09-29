package kr.ac.apart.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.apart.dao.FlagDAO;
import kr.ac.apart.service.BoardService;
import kr.ac.apart.service.FlagService;
import kr.ac.apart.vo.FlagVO;

@Repository("flagService")
public class FlagServiceImpl implements FlagService {

	@Autowired
	private FlagDAO flagDAO;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FlagService flagService;
	
	@Override
	public FlagVO addFlagId(String good_id, int board_no) {
		FlagVO flagvo = new FlagVO();
		flagvo.setGood_id(good_id);
		flagvo.setBoard_no(board_no);
		
		flagDAO.addGoodId(flagvo);
		return flagvo;
	}

	@Override
	public FlagVO getFlag(int board_no,String good_id) {
		System.out.println("getFlag");
		FlagVO flagvo = new FlagVO();
		flagvo.setBoard_no(board_no);
		flagvo.setGood_id(good_id);
		
		flagvo = flagDAO.getflag(flagvo);
			
		System.out.println("floagvo : " + flagvo);
		if(flagvo==null){
			flagService.addFlagId(good_id, board_no); 
			boardService.addGood(board_no);
		}
		else{
			
			System.out.println("null이 아니다");
		}
			
		
		return flagvo;
	}

}
