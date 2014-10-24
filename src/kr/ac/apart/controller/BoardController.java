package kr.ac.apart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.BoardService;
import kr.ac.apart.service.CommentsService;
import kr.ac.apart.service.FlagService;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.CommentsVO;
import kr.ac.apart.vo.UserVO;


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
    
    @Autowired
    private FlagService flagService;

    @RequestMapping(value="/noticeBoard.do") 
    public ModelAndView noticeList(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=notice_board_list");
    	}
    	
    	int page = 0;    //기본 페이지 번호를 0으로 설정
    	if(request.getParameter("page") != null){   //넘어온 파라미터가 있다면
  		   page = Integer.parseInt(request.getParameter("page"));   //해당파라미터를 int로 캐스팅한 후 변수에 대입
  	   }
    	
    	List<BoardVO> list = boardService.NoticeBoardList(page);
    	int rowNum = boardService.getRowNum("notice");
    	
        mav.addObject("list",list);
        mav.addObject("rowNum", rowNum);
        mav.addObject("page", page);

        return mav;
    }
    
    @RequestMapping(value="/complainBoard.do") 
    public ModelAndView minoneList(HttpSession session, HttpServletRequest request, HttpServletResponse response){
    	ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=complain_board_list");
    	}
    	
    	int page = 0;    //기본 페이지 번호를 0으로 설정
    	if(request.getParameter("page") != null){   //넘어온 파라미터가 있다면
  		   page = Integer.parseInt(request.getParameter("page"));   //해당파라미터를 int로 캐스팅한 후 변수에 대입
  	   }
    	
    	List<BoardVO> list = boardService.ComplainBoardList(page);
    	int rowNum = boardService.getRowNum("complain");
    	
        mav.addObject("list",list);
        mav.addObject("rowNum", rowNum);
        mav.addObject("page", page);

        return mav;
    }
    
    @RequestMapping(value="/freeBoard.do") 
    public ModelAndView freeList(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=free_board_list");
    	}
    	
    	int page = 0;    //기본 페이지 번호를 0으로 설정
    	if(request.getParameter("page") != null){   //넘어온 파라미터가 있다면
  		   page = Integer.parseInt(request.getParameter("page"));   //해당파라미터를 int로 캐스팅한 후 변수에 대입
  	   }
    	
    	List<BoardVO> list = boardService.FreeBoardList(page);
    	int rowNum = boardService.getRowNum("free");

        mav.addObject("list",list);
        mav.addObject("rowNum", rowNum);
        mav.addObject("page", page);

        return mav;
    }
    
    @RequestMapping(value="/boardWriteForm.do") 
    public String boardWriteForm(){
    	return "webTemplete.jsp?nextPage=board_write_form";
    }
    
    @RequestMapping(value="/boardAdd.do") 
    public String boardWrite(String writer_id, String category, String title, String contents, String anonymous, String closed){
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
    public ModelAndView boardDetail(int board_no, String count_id){
        ModelAndView mav = new ModelAndView();
       // boardService.updateClicks(board_no);
        flagService.getFlagCount(board_no, count_id);
        BoardVO vo = boardService.getBoardDetail(board_no);
        List<CommentsVO> commentsList = commentsService.getComments(board_no);
        mav.addObject("vo",vo);
        mav.addObject("commentsList",commentsList);
        mav.setViewName("webTemplete.jsp?nextPage=board_view");
    
        return mav;
    }
    
    @RequestMapping(value="/UpdateForm.do") 
    public ModelAndView UpdateForm(int board_no){
        ModelAndView mav = new ModelAndView();
        BoardVO vo = boardService.getBoardDetail(board_no);
        mav.addObject("vo",vo);
        mav.setViewName("webTemplete.jsp?nextPage=board_modify_form");

        return mav;
    }
    
    @RequestMapping(value="/deleteBoard.do") 
    public String guestbookdelete(int board_no, String board_category){
    	
        boardService.deleteBoard(board_no);
        
        if(board_category.equals("notice")){
            return "redirect:/noticeBoard.do";
        }
        else if(board_category.equals("complain")){
            return "redirect:/complainBoard.do";
        }
        else 
        	return "redirect:/freeBoard.do";
    }

    @RequestMapping("/updateBoard.do") 
    public String updateBoard(int board_no, String title, String contents, String anonymous, String closed){
    
    	BoardVO board = new BoardVO();
    	
    	board.setBoard_no(board_no);
    	board.setTitle(title);
    	board.setContents(contents);
   
    	if (anonymous == null) 
            board.setAnonymous("IDENTIFIED");
        else 
            board.setAnonymous(anonymous);
        if (closed == null) 
            board.setClosed("OPEN");
        else 
            board.setClosed(closed);
    	
        boardService.updateBoard(board);
    
        return "redirect:/noticeBoard.do";
    }
    
    @RequestMapping("/search.do") 
    public ModelAndView search(String condition, String str, HttpServletRequest request){
        ModelAndView mav=new ModelAndView("webTemplete.jsp?nextPage=searchPage");
        List<BoardVO> searchList = null;
        List<BoardVO> allSearchList = null;
        String category = request.getParameter("category");
        
        int page = 0;    //기본 페이지 번호를 0으로 설정
    	if(request.getParameter("page") != null){   //넘어온 파라미터가 있다면
  		   page = Integer.parseInt(request.getParameter("page"));   //해당파라미터를 int로 캐스팅한 후 변수에 대입
  	   }

        try {
            searchList=boardService.searchBoard(condition, str, category, page);
            allSearchList = boardService.allSearchBoard(condition, str, category);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        mav.addObject("searchList", searchList);
        mav.addObject("allSearchList", allSearchList);
        mav.addObject("currentCategory", category);
        mav.addObject("page", page);
        mav.addObject("condition", condition);
        mav.addObject("str", str);
        mav.addObject("category", category);

        return mav;
    }
    
    @RequestMapping("/addGood.do") 
    public String addGood(int board_no,String good_id){
    	System.out.println("good");
    	flagService.getFlag(board_no, good_id);
    	
       return "redirect:/boardDetail.do?board_no="+board_no+"&count_id="+good_id;
    }
    
    @RequestMapping("/addBad.do") 
    public String addBad(int board_no,String bad_id){
    	flagService.getFlagBad(board_no, bad_id);
    	
        return "redirect:/boardDetail.do?board_no="+board_no+"&count_id="+bad_id;
    }
}