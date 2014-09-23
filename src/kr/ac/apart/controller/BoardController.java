package kr.ac.apart.controller;

import java.util.List;

import kr.ac.apart.service.BoardService;
import kr.ac.apart.service.CommentsService;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.CommentsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("boardController")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping(value="/noticeBoard.do")
	public ModelAndView noticeList(){
		
		List<BoardVO> list = boardService.NoticeBoardList();

			ModelAndView mav = new ModelAndView();
			mav.addObject("list",list);
			mav.setViewName("webTemplete.jsp?nextPage=notice_board_list");
			return mav;
		
	}
	
	@RequestMapping(value="/complainBoard.do")
	public ModelAndView minoneList(){
		List<BoardVO> list = boardService.ComplainBoardList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("webTemplete.jsp?nextPage=complain_board_list");	
		return mav;
	
	}
	
	@RequestMapping(value="/freeBoard.do")
	public ModelAndView freeList(){
		List<BoardVO> list = boardService.FreeBoardList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("webTemplete.jsp?nextPage=free_board_list");
		return mav;
	
	}
	
	@RequestMapping(value="/boardWriteForm.do")
	public String boardWriteForm(){
		return "webTemplete.jsp?nextPage=board_write_form";
	}
	
	@RequestMapping(value="/boardAdd.do")
	public String boardWrite(String writer_id,String category, String title, String contents, String anonymous, String closed){
	
		boardService.addBoard(writer_id,category, title, contents, anonymous, closed);
		
		if(category.equals("notice")){
			return "redirect:/noticeBoard.do";
		}
		else if(category.equals("complain")){
			return "redirect:/complainBoard.do";
		}
		else
			return "redirect:/freeBoard.do";
	
	}
	
	@RequestMapping(value="/boardDetail.do")
	public ModelAndView boardDetail(int board_no){
		BoardVO vo = boardService.getBoardDetail(board_no);

		List<CommentsVO> commentsList = commentsService.getComments(board_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("commentsList",commentsList);
		mav.setViewName("webTemplete.jsp?nextPage=board_view");
		return mav;
	}
	
	@RequestMapping(value="/UpdateForm.do")
	public ModelAndView UpdateForm(int board_no){
		BoardVO vo = boardService.getBoardDetail(board_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("webTemplete.jsp?nextPage=board_modify_form");
		return mav;
	
	}
	
	@RequestMapping("/Delete.do")
	public String guestbookdelete(int board_no){
		
		boardService.delete(board_no);
		return "redirect:/noticeBoard.do";
	
	}
	
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO board){
	
		boardService.updateBoard(board);
		
		
			return "redirect:/noticeBoard.do";
	
	}
	
	@RequestMapping("/search.do")
	public ModelAndView search(String condition, String str){
		ModelAndView mav=new ModelAndView("webTemplete.jsp?nextPage=searchPage");
		List<BoardVO> searchList=null;
		try {
			searchList=boardService.searchBoard(condition, str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("searchList", searchList);
		return mav;
	}
	
	
	@RequestMapping("/addGood.do")
	public String addGood(int board_no){
	
		boardService.addGood(board_no);
		
		return "redirect:/boardDetail.do?board_no="+board_no;
	
	}
	
	@RequestMapping("/addBad.do")
	public String addBad(int board_no){
	
		boardService.addBad(board_no);
		
		return "redirect:/boardDetail.do?board_no="+board_no;
	}
}