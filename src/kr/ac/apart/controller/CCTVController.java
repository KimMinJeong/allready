package kr.ac.apart.controller;

<<<<<<< HEAD
import kr.ac.apart.service.CCTVService;

import org.springframework.beans.factory.annotation.Autowired;
=======
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cctvController")
public class CCTVController {
<<<<<<< HEAD
	
	@Autowired
	private CCTVService cctvservice;
	
	@RequestMapping(value="/cctv_client.do")
	public String cctv_client(){
		return "webTemplete.jsp?nextPage=CCTV";
	}

=======

	@RequestMapping(value="/cctv.do")
	public String cctv(){
		return "CCTV";
	}
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
}
