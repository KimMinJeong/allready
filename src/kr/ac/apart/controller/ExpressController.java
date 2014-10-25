package kr.ac.apart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.ExpressService;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.ExpressVO;
import kr.ac.apart.vo.Manager_DongVO;
import kr.ac.apart.vo.UserVO;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
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
		UserVO user = userService.getOne(user_id);
		expressService.ExpressCheck(user);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="/addExpress.do")
	public String addExpress(String userDong, String userNo, String orderer, String express_company){
		String user_id = userDong + userNo;
		
		try {
			expressService.addExpress(user_id, orderer, express_company);
		} catch (Exception e) {
			return "NullToParentKey";
		}
		
		UserVO user=new UserVO();
		
		user.setUser_id(user_id);
		expressService.ExpressArrive(user);
		
		return "redirect:/expressList.do";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/expressList.do")
	public ModelAndView getExpressList(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		UserVO vo = (UserVO) session.getAttribute("UserFlag");
		List<Manager_DongVO> dongList=(List<Manager_DongVO>) userService.getManagerDong(vo.getUser_id());
		Manager_DongVO commandDong=new Manager_DongVO();
		for(int i=0;i<dongList.size();i++){
			commandDong=dongList.get(i);
		}
		if(commandDong.getDong()==null){
			mav.addObject("commandDongList", null);
		}else{
			mav.addObject("commandDongList", dongList);
		}
		
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=manage_express_list");
    	}
    	
		int page = 0;    //기본 페이지 번호를 0으로 설정
    	
		if(request.getParameter("page") != null){   //넘어온 파라미터가 있다면
  		   page = Integer.parseInt(request.getParameter("page"));   //해당파라미터를 int로 캐스팅한 후 변수에 대입
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
		
		return "redirect:/expressList.do?page=" + page;
	}
}