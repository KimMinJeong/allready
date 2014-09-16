package kr.ac.apart.dao;

import kr.ac.apart.vo.UserVO;

public interface UserDAO {
	
	public UserVO getUser(String userId);
=======
import java.util.List;

import kr.ac.apart.vo.UserVO;

public interface UserDAO {
	public UserVO getUser(String userId);
	public List<UserVO> testList();
	public void add(UserVO vo);
	public int delete(int no);

}
