package kr.ac.apart.serviceImpl;


import java.util.List;

import kr.ac.apart.dao.UserDAO;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDao;
	
	public UserVO getUser(String userId,String password)
	{
		UserVO user=userDao.getUser(userId);
		String pwd=user.getPassword();
		if(password.equals(pwd)){
			return user;
		}
		else
			return null;
	}

	@Override
	public List<UserVO> testList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO delete(int no, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO addGuest(String name, String password, String message) {
		// TODO Auto-generated method stub
		return null;
	}
}
