package kr.ac.apart.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import kr.ac.apart.vo.UserVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.nkzawa.socketio.client.IO;
import com.github.nkzawa.socketio.client.Socket;

@Controller("chatController") 
public class ChatController {
    
    @RequestMapping(value="/chat_server.do")
    public String chat_server(HttpSession session){
    	String socketIoUrl = "http://localhost";
    	Integer socketIoPort = 3000;
    	Socket socketIO = null;
    	
    	UserVO user_id = (UserVO) session.getAttribute("UserFlag");
    	try {
			socketIO = IO.socket(socketIoUrl + ":" + socketIoPort.toString());
		} catch (URISyntaxException e2) {
			e2.printStackTrace();
		}
    	
    	socketIO.connect();
    	socketIO.emit("user_id", user_id); 
    	
    	return "webTemplete.jsp?nextPage=chatting_room";
    }
}