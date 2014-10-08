package kr.ac.apart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.ExpressService;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.ExpressVO;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("expressController")
public class ExpressController {
	
	@Autowired
	private ExpressService expressService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/checkExpress.do")
	public String checkExpress(String user_id){
		UserVO user= userService.getOne(user_id);
		expressService.ExpressCheck(user);
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="/addExpress.do")
	public String addExpress(String userDong, String userNo, String orderer, String express_company){
		String user_id = userDong + userNo;

		expressService.addExpress(user_id, orderer, express_company);
		
		UserVO user=new UserVO();
		
		user.setUser_id(user_id);
		expressService.ExpressArrive(user);
		
		return "redirect:/expressList.do";
	}
	
	@RequestMapping(value="/expressList.do")
	public ModelAndView getExpressList(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=manage_express_list");
    	}
    	
		int page = 0;    //�⺻ ������ ��ȣ�� 0���� ����
    	
		if(request.getParameter("page") != null){   //�Ѿ�� �Ķ���Ͱ� �ִٸ�
  		   page = Integer.parseInt(request.getParameter("page"));   //�ش��Ķ���͸� int�� ĳ������ �� ������ ����
  	   	}
		
		List<ExpressVO> list = expressService.getExpressList(page);
		
    	String userId = vo.getUser_id();
    	
    	mav.addObject("expressRowNum", expressService.getExpressRowNum());
        mav.addObject("managerDongList", userService.getManagerDong(userId));
		mav.addObject("list",list);
		mav.addObject("currentPage", page);
		
		return mav;
	}
	
	@RequestMapping("/getExpressOne.do")
	public ModelAndView getExpressOne(String express_id){
		ModelAndView mav = new ModelAndView();
		int ex_id=Integer.parseInt(express_id);
		
		ExpressVO vo = expressService.getExpressOne(ex_id);
		
		mav.addObject("vo",vo);
		
		return mav;
	}

	@RequestMapping("/updateExpress.do")
	public String updateExpress(String express_id, String receiver, int page){
		int ex_id = Integer.parseInt(express_id);
		
		ExpressVO vo=expressService.getExpressOne(ex_id);
		vo.setReceiver(receiver);
		expressService.updateExpress(vo);
		
		System.out.println("page : " + page);
		
		return "redirect:/expressList.do?page=" + page;
	}
}