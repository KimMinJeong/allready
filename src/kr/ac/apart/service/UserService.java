package kr.ac.apart.service;

import java.util.List;

import kr.ac.apart.vo.FamilyVO;
import kr.ac.apart.vo.Manager_DongVO;
import kr.ac.apart.vo.UserVO;

public interface UserService {
	public UserVO getUser(String userId,String password);
	public void updateManager(String userId, String userPassword, String userName, String userPhone);
	public void updateManagerDong(String manageDong, String userId);
	public List<Manager_DongVO> getManagerDong(String userId);
	public void modifyUsers(String userId, String userName, String userPassword, String userEmail, String userPhone);
	public void updateFamily(String userId, String familyName, String familyPhone);
	public List<FamilyVO> getFamilyList(String userId);
	public boolean findPassword(String userId, String userName, String userEmail);
}
