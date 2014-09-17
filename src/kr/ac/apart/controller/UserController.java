package kr.ac.apart.controller;

import javax.servlet.http.HttpSession;

import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.UserVO;

import kr.ac.apart.vo.UserVO;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("userController")
public class UserController{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/loginForm.do")
	public String index(){
		return "loginForm";
	}
	
	@RequestMapping("/login.do")
	public String join(String user_id, String user_password, HttpSession session){
		UserVO vo=userService.getUser(user_id, user_password);
		if(vo!=null){							
				session.setAttribute("UserFlag", vo);
				return "redirect:/main.do";
		}
		else
			return "redirect:/loginForm.do";
	}
	
	@RequestMapping(value="/main.do")
	public String main(){
		return "webTemplete.jsp?nextPage=user_main";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("UserFlag");
		return "redirect:/loginForm.do";
	}
	
	@RequestMapping(value="/user_detail.do")
	public ModelAndView user_detail(){
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_detail");
		
		return mav;
	}
	
	@RequestMapping(value="/manage_detail.do")
	public ModelAndView manager_detail(){
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_detail");
		
		return mav;
	}
	@RequestMapping(value="modifyManager.do")
	public @ResponseBody String modifyManager(String userId, String userPassword, String userName, String userPhone, String manageDone){
		System.out.println("modifyManager.do start!");
		System.out.println("userId : " + userId + ", userPassword : " + userPassword + ", userName : " + userName + ", userPhone : " + userPhone);
		System.out.println("manageDone : " + manageDone);
		
		JSONObject obj = new JSONObject();
		
		return obj.toString();
	}
}
