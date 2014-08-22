package kr.ac.apart.dao;

import kr.ac.apart.vo.UserVO;

public interface UserDAO {
	
	public UserVO getUser(String userId);
}
