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
		FlagVO flagvo = new FlagVO();
		flagvo.setBoard_no(board_no);
		flagvo.setGood_id(good_id);
		
		flagvo = flagDAO.getflag(flagvo);
		if(flagvo==null){

			addFlagId(good_id, board_no);
			boardService.addGood(board_no);
		}
		
		return flagvo;
	}

	@Override
	public FlagVO addFlagIdBad(String bad_id, int board_no) {
		FlagVO flagvo = new FlagVO();
		flagvo.setBad_id(bad_id);
		flagvo.setBoard_no(board_no);
		
		flagDAO.addBadId(flagvo);
		return flagvo;
	}

	@Override
	public FlagVO getFlagBad(int board_no, String bad_id) {
		FlagVO flagvo = new FlagVO();
		flagvo.setBoard_no(board_no);
		flagvo.setBad_id(bad_id);
		
		flagvo = flagDAO.getflagBad(flagvo);

		if(flagvo==null){
			addFlagIdBad(bad_id, board_no);
			boardService.addBad(board_no);
		}		
		
		return flagvo;
	}

	@Override
	public FlagVO addFlagIdCount(String count_id, int board_no) {
		FlagVO flagvo = new FlagVO();
		flagvo.setCount_id(count_id);
		flagvo.setBoard_no(board_no);
		
		flagDAO.addCountId(flagvo);
		return flagvo;
	}

	@Override
	public FlagVO getFlagCount(int board_no, String count_id) {
		FlagVO flagvo = new FlagVO();
		flagvo.setBoard_no(board_no);
		flagvo.setCount_id(count_id);
		
		flagvo = flagDAO.getflagCountId(flagvo);
		
		if(flagvo==null){

			addFlagIdCount(count_id, board_no);
			boardService.updateClicks(board_no);
		}
		
		return flagvo;
	}
}