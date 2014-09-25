package kr.ac.apart.controller;

import javax.servlet.http.HttpSession;

import kr.ac.apart.service.UserService;
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

    @RequestMapping(value = "/loginForm.do")
    public String index(){
        return "loginForm";
    }

    @RequestMapping("/login.do")
    public String join(String user_id, String user_password, HttpSession session){
    	
        UserVO vo = userService.getUser(user_id, user_password);
        
        if (vo != null) {
            session.setAttribute("UserFlag", vo);
            return "redirect:/main.do";
        } else 
            return "redirect:/loginForm.do";
    }

    @RequestMapping(value = "/main.do")
    public String main(){
        return "webTemplete.jsp?nextPage=user_main";
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
        ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_detail");
        
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        String userId = vo.getUser_id();
        
        mav.addObject("familyList", userService.getFamilyList(userId));
        
        return mav;
    }

    @RequestMapping(value = "/manage_detail.do")
    public ModelAndView manager_detail(HttpSession session){
        ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_detail");
        
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        String userId = vo.getUser_id();
        
        mav.addObject("managerDongList", userService.getManagerDong(userId));
        
        return mav;
    }

    @RequestMapping(value = "modifyManager.do")
    public @ResponseBody String modifyManager(String userId, String userPassword, String userName, String userPhone, String manageDong){
        
    	System.out.println("modifyManager.do start!");
        System.out.println("userId : " + userId + ", userPassword : " + userPassword + ", userName : " + userName + ", userPhone : " + userPhone);
        System.out.println("manageDone : " + manageDong);
        
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
}