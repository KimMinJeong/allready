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
	public ModelAndView user_parking(HttpSession session){
		ModelAndView mav=new ModelAndView();
		UserVO vo = (UserVO) session.getAttribute("UserFlag");
		String B1, B2, B3;
        try {
			B1=parkingService.getFloorCount("B1");
			B2=parkingService.getFloorCount("B2");
			B3=parkingService.getFloorCount("B3");
			mav.addObject("B1", B1);
			mav.addObject("B2", B2);
			mav.addObject("B3", B3);
		} catch (Exception e) {
			mav.setViewName("NoPage");
			return mav;
		}
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    		return mav;
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=user_parking");
    		return mav;
    	}
	}
	
	@RequestMapping(value="/parking.do")
	public ModelAndView parking(String floor, String section){
		ArduinoProcessing.isfull1=null;
		ArduinoProcessing.isfull2=null;
		String B1, B2, B3;
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
		
		pv2.setFloor(floor);
		pv2.setSection(section);
		pv2.setParking_lot(parking_lot);
		pv2.setIsfull(full2);
		
		try {
			parkingService.updateParking(pv1);
			parkingService.updateParking(pv2);
		} catch (Exception e) {
			e.printStackTrace();
		}
        try {
			B1=parkingService.getFloorCount("B1");
			B2=parkingService.getFloorCount("B2");
			B3=parkingService.getFloorCount("B3");
			mav.addObject("B1", B1);
			mav.addObject("B2", B2);
			mav.addObject("B3", B3);
		} catch (Exception e) {
			mav.setViewName("NoPage");
			return mav;
		}
		mav.addObject("isfull1", full1);
		mav.addObject("isfull2", full2);
		
		
		return mav;
	}
}