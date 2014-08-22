package kr.ac.apart.serviceImpl;

import kr.ac.apart.dao.UserDAO;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDao;
	
	public UserVO getUser(String userId)
	{
		return userDao.getUser(userId);
	}
}
