package kr.ac.apart.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import kr.ac.apart.vo.UserVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.nkzawa.socketio.client.IO;
import com.github.nkzawa.socketio.client.Socket;

@Controller("chatController") 
public class ChatController {
    
    @RequestMapping(value="/chat_server.do")
    public String chat_server(HttpSession session){
    	return "webTemplete.jsp?nextPage=chatting_room";
    }
}