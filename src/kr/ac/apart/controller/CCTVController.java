package kr.ac.apart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cctvController")
public class CCTVController {

	@RequestMapping(value="/cctv.do")
	public String cctv(){
		return "CCTV";
	}
}
