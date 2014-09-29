package kr.ac.apart.service;

import kr.ac.apart.vo.FlagVO;

public interface FlagService {
	public FlagVO addFlagId(String good_id,int board_no);
	public FlagVO getFlag(int board_no,String good_id);
}
