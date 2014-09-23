package kr.ac.apart.controller;

import kr.ac.apart.service.CCTVService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cctvController") 
public class CCTVController {
    @Autowired 
    private CCTVService cctvservice;

    @RequestMapping(value="/cctv_client.do") 
    public String cctv_client() {
        return "webTemplete.jsp?nextPage=CCTV";
    }
}