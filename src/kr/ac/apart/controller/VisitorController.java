package kr.ac.apart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.VisitorService;
import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.VisitorVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("visitorController")
public class VisitorController {
	
	@Autowired
	private VisitorService visitorService;

	@RequestMapping(value="/user_visitor.do")      //유저의 방문페이지 
	public String user_visitor(){
		/*return "webTemplete.jsp?nextPage=user_visitor";*/
		return "redirect:/getVisitorList.do";
	}
	
	@RequestMapping(value="/manage_visitor.do")    //관리자의 방문페이지
	public String manage_visitor(){
		return "webTemplete.jsp?nextPage=manage_visitManage";
	}
	
	@RequestMapping(value="/addVisitor.do")      //nomal user의 방문객 추가
	public String addVisitor(String fixed, String visitor_name, String business, HttpSession session){
		UserVO userVO = (UserVO)session.getAttribute("UserFlag");
		String user_id = userVO.getUser_id();    //현재 로그인 중인 user의 id 가져오기
		VisitorVO visitorVO = new VisitorVO();
		
		//fixed 체크되면 on, 체크 안되면 null
		System.out.println("user_id : " + user_id + " fixed : " + fixed + " visitor_name : " + visitor_name + " business : " + business);
		if(fixed != null){
			visitorVO = visitorService.insert(user_id, visitor_name, business, fixed);
		}
		else if(fixed == null){
			visitorVO = visitorService.insert(user_id, visitor_name, business, null);
		}
		visitorService.addVisitor(visitorVO);

		return "redirect:/getVisitorList.do";
	}
	
	@RequestMapping(value="/addVisitorManger.do")
	public ModelAndView addVisitorManager(String user_id, String visitor_name, String business){
		ModelAndView mav = new ModelAndView("redirect:/getVisitorManager.do");
		VisitorVO visitorVO = visitorService.insert(user_id, visitor_name, business, null);
	/*	VisitorVO vo = (VisitorVO)visitorService.addVisitor(visitorVO);
		mav.addObject("Test", vo);        //visitorT에 값 입력
	*/			
		return mav;
	}
	
	@RequestMapping(value="/getVisitorManager.do")
	public String getVisitorManager(HttpServletRequest request){
		
		System.out.println("Test" + request.getAttribute("Test"));
		
		return "redirect:/manage_visitor.do";
		
	}
	
	@RequestMapping(value="/getVisitorList.do")
	public ModelAndView getVisitorList(HttpSession session){   //id에 해당하는 방문객정보 session으로 가지고 있기
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_visitor");
		UserVO userVO = (UserVO)session.getAttribute("UserFlag");
		String id = userVO.getUser_id();     //현재 로그인 중인 유저 id
		List<VisitorVO> visitorList = null;
		
		try{
			visitorList = visitorService.getVisitorList(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.addObject("VisitorFlag", visitorList);
		
		return mav;		
	}
	
	@RequestMapping(value="/deleteVisitor.do")
	public String deleteVisitor(String name){
		visitorService.deleteVisitor(name);
		
		return "redirect:/getVisitorList.do";
	}
	
	@RequestMapping(value="/getVisitor")
	ModelAndView getVisitor(String user_id){
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_visitManage");
		List<VisitorVO> visitorList = null;
		try{
			visitorList = visitorService.getVisitorList(user_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.addObject("VisitorManagerFlag", visitorList);

		return mav;
	}
}