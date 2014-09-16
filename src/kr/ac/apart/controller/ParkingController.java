package kr.ac.apart.controller;

<<<<<<< HEAD
import kr.ac.apart.processing.ParkingImpl;
import kr.ac.apart.service.ParkingService;

import org.springframework.beans.factory.annotation.Autowired;
=======
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("parkingController")
public class ParkingController {
	@Autowired
	private ParkingService parkingService;
	@Autowired
	private ParkingImpl frame;
	
	@RequestMapping(value="/parking.do")
	public String parking(){
		frame.check();
		return "test";
	}
}
