package kr.ac.apart.controller;

import kr.ac.apart.processing.ParkingImpl;
import kr.ac.apart.service.ParkingService;

import org.springframework.beans.factory.annotation.Autowired;
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
