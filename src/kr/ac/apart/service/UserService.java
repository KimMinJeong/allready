package kr.ac.apart.service;

import kr.ac.apart.vo.UserVO;


public interface UserService {

	public UserVO getUser(String userId,String password);
	public List<UserVO> testList();
	public UserVO delete(int no,String password);
	public UserVO addGuest(String name, String password, String message);
}
