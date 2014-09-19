package kr.ac.apart.controller;

import java.util.List;

import kr.ac.apart.service.ExpressService;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.ExpressVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("expressController")
public class ExpressController {
	
	@Autowired
	private ExpressService expressService;
	

	
	@RequestMapping(value="/addExpress.do")
	public String addExpress(String user_id,String orderer, String express_company){
	
		expressService.addExpress(user_id, orderer, express_company);
		
		return "redirect:/expressList.do";
	
	}
	
	@RequestMapping(value="/expressList.do")
	public ModelAndView getExpressList(){
		
		List<ExpressVO> list = expressService.getExpressList();

			ModelAndView mav = new ModelAndView();
			mav.addObject("list",list);
			mav.setViewName("webTemplete.jsp?nextPage=manage_express_list");
			return mav;
		
	}
	
	@RequestMapping("/getExpressOne.do")
	public ModelAndView getExpressOne(int express_id){
		ExpressVO vo = expressService.getExpressOne(express_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		System.out.println(vo.getExpress_id());

		return mav;
	}

	@RequestMapping("/updateExpress.do")
	public String updateExpress(ExpressVO vo){
	
		System.out.println("update"+vo);
		expressService.updateExpress(vo);
		
		return "redirect:/expressList.do";
	}
	
	

}
