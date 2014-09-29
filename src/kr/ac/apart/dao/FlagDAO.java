package kr.ac.apart.dao;

import kr.ac.apart.vo.FlagVO;

public interface FlagDAO {
	public void addGoodId(FlagVO flagvo);
	public FlagVO getflag(FlagVO flagvo);
	public void addBadId(FlagVO flagvo);
	public FlagVO getflagBad(FlagVO flagvo);
	public void addCountId(FlagVO flagvo);
	public FlagVO getflagCountId(FlagVO flagvo);
}
