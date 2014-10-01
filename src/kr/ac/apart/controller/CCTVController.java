package kr.ac.apart.controller;

import javax.servlet.http.HttpSession;

import kr.ac.apart.service.CCTVService;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cctvController") 
public class CCTVController {
	
    @Autowired 
    private CCTVService cctvservice;

    @RequestMapping(value="/cctv_client.do") 
    public String cctv_client(HttpSession session){
    	UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		return "emptyLoginSession";
    	}
    	else{
    		return "webTemplete.jsp?nextPage=CCTV";
    	}
    }
}