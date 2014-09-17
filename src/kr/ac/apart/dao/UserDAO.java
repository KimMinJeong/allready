package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.UserVO;

public interface UserDAO {
	public UserVO getUser(String userId);
	public int modifyManager(UserVO vo);
}
