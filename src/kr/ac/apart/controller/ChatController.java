package kr.ac.apart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("chatController") public class ChatController {

    @RequestMapping(value="/chat.do") 
    public String chat() {
        return "loginForm";
    }
}