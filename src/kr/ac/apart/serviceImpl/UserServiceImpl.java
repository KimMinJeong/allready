package kr.ac.apart.serviceImpl;

import java.util.List;

import kr.ac.apart.dao.UserDAO;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.FamilyVO;
import kr.ac.apart.vo.Manager_DongVO;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDao;

	@Override
	public UserVO getOne(String user_id) {
		UserVO user=userDao.getUser(user_id);
		
		return user;
	}
	
	public UserVO getUser(String userId, String password){
		UserVO userVo = userDao.getUser(userId);
		String pwd = userVo.getPassword();
		
		if(password.equals(pwd)){
			return userVo;
		}
		else
			return null;
	}
	
	public String getUser_passwordFind(String user_id, String user_name,String e_mail){
		UserVO user = userDao.getUser(user_id);
		String pwd = user.getPassword();
		
		if(user_id.equals(user.getUser_id())){
				if(user_name.equals(user.getUser_name())){
					if(e_mail.equals(user.getE_mail())){
						return pwd;
					}	
				}
		}
		return "회원정보가 일치하지 않습니다.ㅠㅠ";
	}
	
	@Override
	public void updateManager(String userId, String userPassword, String userName, String userPhone){
		UserVO vo = new UserVO();
		
		vo.setUser_id(userId);
		vo.setPassword(userPassword);
		vo.setUser_name(userName);
		vo.setPhone(userPhone);
		
		userDao.modifyManager(vo);
	}
	
	@Override
	public void updateManagerDong(String manageDong, String userId){
		userDao.deleteManageDong(userId); //이미 들어있는 정보 모두 삭제
		
		String[] namesArr = manageDong.split(",");
		Manager_DongVO vo = new Manager_DongVO();
		
		vo.setUser_id(userId);
		
		for(int i=0; i<namesArr.length; i++){
			vo.setDong(namesArr[i]);		
			
			userDao.updateManagerDong(vo);
		}
	}
	
	@Override
	public List<Manager_DongVO> getManagerDong(String userId){
		List<Manager_DongVO> vo = userDao.getManagerDong(userId);
		
		return vo;	
	}
	
	@Override
	public void modifyUsers(String userId, String userName, String userPassword, String userEmail, String userPhone){
		UserVO vo = new UserVO();
		
		vo.setUser_id(userId);
		vo.setUser_name(userName);
		vo.setPassword(userPassword);
		vo.setE_mail(userEmail);
		vo.setPhone(userPhone);
		
		userDao.modifyUser(vo);
	}
	
	@Override
	public void updateFamily(String userId, String familyName, String familyPhone){
		userDao.deleteFamily(userId);
		
		String[] familyNameArr = familyName.split(",");
		String[] familyPhoneArr = familyPhone.split(",");
		
		FamilyVO vo = new FamilyVO();
		
		vo.setUser_id(userId);
		
		for(int i=0; i<familyNameArr.length; i++){
			vo.setName(familyNameArr[i]);
			vo.setPhone(familyPhoneArr[i]);
			
			userDao.updateFamily(vo);
		}
	}
	
	@Override
	public List<FamilyVO> getFamilyList(String userId){
		List<FamilyVO> list = userDao.getFamilyList(userId);
		
		return list;
	}
	
	@Override
	public boolean findPassword(String userId, String userName, String userEmail){
		UserVO vo = userDao.getUser(userId);
		
		if(userName.equals(vo.getUser_name())){
			if(userEmail.equals(vo.getE_mail())){
				return true;
			}
			else 
				return false;
		}
		else
			return false;
	}
	
	public List<UserVO> getUserList(){
		List<UserVO> user_id = userDao.getUserList();
		
		return user_id;
	}
}