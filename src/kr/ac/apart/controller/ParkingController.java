package kr.ac.apart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("parkingController")
public class ParkingController {

	@RequestMapping(value="/parking.do")
	public String parking(){
		return "webTemplete.jsp?nextPage=parking";
	}
}
