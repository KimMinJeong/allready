package kr.ac.apart.controller;

import kr.ac.apart.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userController")
public class UserController{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/intro.do")
	public String index(){
		return "1.main";
	}
	
	@RequestMapping(value="/login.do")
	public String main(){
		return "user_main";
	}
}
