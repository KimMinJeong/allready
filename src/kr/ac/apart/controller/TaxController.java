package kr.ac.apart.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("taxController")
public class TaxController {

	@RequestMapping(value="/user_tax.do")
	public ModelAndView tax(){
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_tax");
		
		String TaxUrl = "http://www.k-apt.go.kr/user/mment/mment_main_list.mn";
		URL url = null;
		try {
			url = new URL(TaxUrl);
			Document doc = Jsoup.parse(url, 8088);
			Element text = doc.select("table[class=board02]").first();
			System.out.println(text);
			mav.addObject("TaxText", text);
		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}
}
