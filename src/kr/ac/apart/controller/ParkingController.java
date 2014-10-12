package kr.ac.apart.controller;

import javax.servlet.http.HttpSession;

import kr.ac.apart.processing.ArduinoProcessing;
import kr.ac.apart.processing.ParkingImpl;
import kr.ac.apart.service.ParkingService;
import kr.ac.apart.vo.ParkingVO;
import kr.ac.apart.vo.UserVO;

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
	public String user_parking(HttpSession session){
		UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		return "emptyLoginSession";
    	}
    	else{
    		return "webTemplete.jsp?nextPage=user_parking";
    	}
	}
	
	@RequestMapping(value="/parking.do")
	public ModelAndView parking(String floor, String section){
		frame.check();
		
		while(ArduinoProcessing.isfull1==null){}
		while(ArduinoProcessing.isfull2==null){}
		
		ModelAndView mav=new ModelAndView();
		
		if(ArduinoProcessing.isfull1.equals("ERROR"))
			mav.setViewName("NoPage");
		else if(ArduinoProcessing.isfull2.equals("ERROR"))
			mav.setViewName("NoPage");
		else
			mav.setViewName("webTemplete.jsp?nextPage=parking");
		String full1=ArduinoProcessing.isfull1;
		ParkingVO pv1=new ParkingVO();
		String parking_lot="1";
		
		pv1.setFloor(floor);
		pv1.setSection(section);
		pv1.setParking_lot(parking_lot);
		pv1.setIsfull(full1);
		
		String full2=ArduinoProcessing.isfull2;
		ParkingVO pv2=new ParkingVO();
		parking_lot="2";
		
		pv1.setFloor(floor);
		pv1.setSection(section);
		pv1.setParking_lot(parking_lot);
		pv1.setIsfull(full1);
		
		try {
			parkingService.updateParking(pv1);
			parkingService.updateParking(pv2);
			ArduinoProcessing.isfull1=null;
			ArduinoProcessing.isfull2=null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("isfull1", full1);
		mav.addObject("isfull2", full2);
		
		return mav;
	}
}