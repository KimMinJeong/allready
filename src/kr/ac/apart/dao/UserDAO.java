package kr.ac.apart.dao;

import java.util.List;

import kr.ac.apart.vo.FamilyVO;
import kr.ac.apart.vo.Manager_DongVO;
import kr.ac.apart.vo.UserVO;

public interface UserDAO {
	public UserVO getUser(String userId);
	public List<UserVO> getUserList();
	public int modifyManager(UserVO vo);
	public int updateManagerDong(Manager_DongVO vo);
	public int deleteManageDong(String userId);
	public List<Manager_DongVO> getManagerDong(String userId);
	public int modifyUser(UserVO vo);
	public int updateFamily(FamilyVO vo);
	public int deleteFamily(String userId);
	public List<FamilyVO> getFamilyList(String userId);
	public void expressModify(UserVO user);
}
