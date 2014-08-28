package kr.ac.apart.controller;

import kr.ac.apart.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("boardController")
public class BoardController {

	@Autowired
	private BoardDAO boardDao;
	
	@RequestMapping(value="/noticeBoard.do")
	public String noticeList(){
		return "webTemplete.jsp?nextPage=notice_board_list";
	}
	
	@RequestMapping(value="/complainBoard.do")
	public String minoneList(){
		return "webTemplete.jsp?nextPage=complain_board_list";
	}
	
	@RequestMapping(value="/freeBoard.do")
	public String freeList(){
		return "webTemplete.jsp?nextPage=free_board_list";
	}
	
	@RequestMapping(value="/boardWriteForm.do")
	public String boardWriteForm(){
		return "webTemplete.jsp?nextPage=board_write_form";
	}
}
