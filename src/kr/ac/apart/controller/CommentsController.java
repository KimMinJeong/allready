package kr.ac.apart.controller;

import kr.ac.apart.service.CommentsService;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("CommentsController") 
public class CommentsController{

    @Autowired 
    private CommentsService commentsService;

    @RequestMapping(value="/addComments.do") 
    public @ResponseBody String addComments(int board_no, String writer_id, String contents){

        commentsService.addComments(board_no, writer_id, contents);

        JSONObject obj = new JSONObject();

        obj.put("writerId", writer_id);
        obj.put("contents", contents);
        obj.put("commentsRegDate", commentsService.getCommentsRegDate());
        obj.put("maxCommentNo", commentsService.getMaxCommentsNo());
        
        return obj.toString();
    }
    
    @RequestMapping(value="/deleteComments.do") 
    public @ResponseBody String deleteComments(int commentsNo){

        commentsService.deleteComments(commentsNo);

        JSONObject obj = new JSONObject();

        return obj.toString();
    }
}