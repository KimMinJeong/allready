package kr.ac.apart.controller;

import kr.ac.apart.processing.ArduinoProcessing;
import kr.ac.apart.processing.ParkingImpl;
import kr.ac.apart.service.ParkingService;
import kr.ac.apart.vo.ParkingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("parkingController")
public class ParkingController {
	@Autowired
	private ParkingService parkingService;
	@Autowired
	private ParkingImpl frame;
	
	@RequestMapping(value="/user_parking.do")
	public String user_parking(){
		return "webTemplete.jsp?nextPage=user_parking";
	}
	
	@RequestMapping(value="/parking.do")
	public ModelAndView parking(String floor, String section){
		System.out.println(floor+section);
		frame.check();
		while(ArduinoProcessing.isfull==null){}
		ModelAndView mav=new ModelAndView();
		if(ArduinoProcessing.isfull.equals("ERROR"))
			mav.setViewName("NoPage");
		else
			mav.setViewName("webTemplete.jsp?nextPage=parking");
		String isfull=ArduinoProcessing.isfull;
		ParkingVO pv=new ParkingVO();
		String parking_lot="1";
		pv.setFloor(floor);
		pv.setSection(section);
		pv.setParking_lot(parking_lot);
		pv.setIsfull(isfull);
		System.out.println("ParkingVO.isfull : "+pv.getIsfull());
		try {
			parkingService.updateParking(pv);
			ArduinoProcessing.isfull=null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("isfull", isfull);
		return mav;
	}
}