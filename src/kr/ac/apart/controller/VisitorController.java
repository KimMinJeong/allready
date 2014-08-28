package kr.ac.apart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("visitorController")
public class VisitorController {

	@RequestMapping(value="/user_visitor.do")
	public String user_visitor(){
		return "user_visitor";
	}
	
	@RequestMapping(value="/manage_visitor.do")
	public String manage_visitor(){
		return "manage_visitManage";
	}
}
