package kr.ac.apart.controller;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.BoardService;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.UserVO;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("userController")
public class UserController {
	
    @Autowired 
    private UserService userService;
    
    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/loginForm.do")
    public String index(){
        return "loginForm";
    }

    @RequestMapping("/login.do")
    public String join(String user_id, String user_password, HttpSession session){
    	UserVO vo = userService.getUser(user_id, user_password);
    	
    	session.setAttribute("UserFlag", vo);
    	
    	return "redirect:/main.do";
    }
    
    @RequestMapping(value = "/main.do")
    public ModelAndView main(HttpSession session){
    	ModelAndView mav = new ModelAndView();
    	List<BoardVO> list =  boardService.getNoticeList();
    	UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=user_main");
    	}
    	
    	mav.addObject("getNoticeList", list);
    	
    	return mav;
    }

    @RequestMapping(value = "/passwordForm.do")
    public String passwordForm(){
        return "passwordForm";
    }

    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession session){
    	
        session.removeAttribute("UserFlag");
        
        return "redirect:/loginForm.do";
    }

    @RequestMapping(value = "/user_detail.do")
    public ModelAndView user_detail(HttpSession session){
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=user_detail");
    	}
        String userId = vo.getUser_id();
        
        mav.addObject("familyList", userService.getFamilyList(userId));
        
        return mav;
    }

    @RequestMapping(value = "/manage_detail.do")
    public ModelAndView manager_detail(HttpSession session){
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=manage_detail");
    	}
    	
    	String userId = vo.getUser_id();
    	
        mav.addObject("managerDongList", userService.getManagerDong(userId));
        
        return mav;
    }

    @RequestMapping(value = "modifyManager.do")
    public @ResponseBody String modifyManager(String userId, String userPassword, String userName, String userPhone, String manageDong){
        
        userService.updateManager(userId, userPassword, userName, userPhone);
        userService.updateManagerDong(manageDong, userId);
        
        JSONObject obj = new JSONObject();
        
        return obj.toString();
    }

    @RequestMapping(value = "modifyUser.do")
    public @ResponseBody String modifyUser(String userId, String userName, String userPassword, String userEmail, String userPhone, String familyName, String familyPhone){
        
    	System.out.println("controller");
        System.out.println("familyName : " + familyName + ", familyPhone : " + familyPhone);
        
        userService.modifyUsers(userId, userName, userPassword, userEmail, userPhone);
        userService.updateFamily(userId, familyName, familyPhone);
        
        JSONObject obj = new JSONObject();
        
        return obj.toString();
    }
    
    @RequestMapping(value = "findPassword.do")
    public @ResponseBody String findPassword(String userId, String userName, String userEmail, String userPhone){
    	System.out.println("findPasswordController.do");
    	System.out.println("userId : " + userId + ", userPassword : " + userName + ", userName : " + userEmail + ", userPhone : " + userPhone );
    	
    	boolean userCheck = userService.findPassword(userId, userName, userEmail, userPhone);
    	UserVO vo = userService.getUserVO(userId);
    	
    	JSONObject obj = new JSONObject();
    	
    	obj.put("userCheck", userCheck);
    	obj.put("getUser", vo);
    	
    	return obj.toString();
    }
}