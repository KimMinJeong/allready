package kr.ac.apart.controller;

import kr.ac.apart.service.CCTVService;

import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> e87634fd0939a89a1fb61aa946f933711e0526f8
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cctvController")
public class CCTVController {

	
	@Autowired
	private CCTVService cctvservice;
	
	@RequestMapping(value="/cctv_client.do")
	public String cctv_client(){
		return "CCTV";
	}
}
