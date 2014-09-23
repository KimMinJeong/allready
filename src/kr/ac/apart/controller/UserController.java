package kr.ac.apart.controller;

import javax.servlet.http.HttpSession;

import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userController") public class UserController {
    @Autowired 
    private UserService userService;

    @RequestMapping(value="/loginForm.do") 
    public String index() {
        return "loginForm";
    }
    
    @RequestMapping(value="/login.do") 
    public String join(String user_id, String user_password, HttpSession session) {
        UserVO vo = userService.getUser(user_id, user_password);
        if(vo!=null) {
            session.setAttribute("UserFlag", vo);
            return "redirect:/main.do";
        }
        else return "redirect:/loginForm.do";
    }
    
    @RequestMapping(value="/main.do") 
    public String main() {
        return "webTemplete.jsp?nextPage=user_main";
    }
    
    @RequestMapping(value="/logout.do") 
    public String logout(HttpSession session) {
        session.removeAttribute("UserFlag");
        return "redirect:/loginForm.do";
    }
}