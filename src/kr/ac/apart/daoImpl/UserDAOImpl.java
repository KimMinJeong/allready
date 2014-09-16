package kr.ac.apart.daoImpl;

import kr.ac.apart.dao.UserDAO;
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
}
