package kr.ac.apart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("taxController")
public class TaxController {

	@RequestMapping(value="/tax.do")
	public String tax(){
		return "user_tax";
	}
}
