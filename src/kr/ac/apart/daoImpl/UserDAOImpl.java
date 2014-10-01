package kr.ac.apart.daoImpl;

import java.util.List;

import kr.ac.apart.dao.UserDAO;
import kr.ac.apart.vo.FamilyVO;
import kr.ac.apart.vo.Manager_DongVO;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public UserVO getUser(String userId){
		return (UserVO) sqlMapClientTemplate.queryForObject("getUser", userId);
	}
	
	public int modifyManager(UserVO vo){
		return (Integer) sqlMapClientTemplate.update("modifyManager", vo);
	}
	
	public int updateManagerDong(Manager_DongVO vo){
		return (Integer) sqlMapClientTemplate.update("updateDong", vo);
	}
	
	public int deleteManageDong(String userId){
		return (Integer) sqlMapClientTemplate.delete("deleteDong", userId);
	}
	
	public List<Manager_DongVO> getManagerDong(String userId){
		return (List<Manager_DongVO>) sqlMapClientTemplate.queryForList("getManagerDong", userId);
	}
	
	public int modifyUser(UserVO vo){
		return (Integer) sqlMapClientTemplate.update("modifyUser", vo);
	}
	
	public int updateFamily(FamilyVO vo){
		return (Integer) sqlMapClientTemplate.update("modifyFamily", vo);
	}
	
	public int deleteFamily(String userId){
		return (Integer) sqlMapClientTemplate.delete("deleteFamily", userId);
	}
	
	public List<FamilyVO> getFamilyList(String userId){
		return (List<FamilyVO>) sqlMapClientTemplate.queryForList("getFamilyList", userId);
	}

	@Override
	public void expressModify(UserVO user) {
		sqlMapClientTemplate.update("ExpressModify", user);
	}
}