package kr.ac.apart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.UserService;
import kr.ac.apart.service.VisitorService;
import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.VisitorVO;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("visitorController")
public class VisitorController {

    @Autowired 
    private VisitorService visitorService;
    
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user_visitor.do") //유저의 방문페이지 
    public String user_visitor(HttpSession session){
    	UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		return "emptyLoginSession";
    	}
    	else{
    		return "redirect:/getVisitorList.do";
    	}    
    }

    @RequestMapping(value = "/manage_visitor.do") //관리자의 방문페이지
    public ModelAndView manage_visitor(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=manage_visitManage");
    	}
    	int page = 0;    //기본 페이지 번호를 0으로 설정
    	if(request.getParameter("page") != null){   //넘어온 파라미터가 있다면
  		   page = Integer.parseInt(request.getParameter("page"));   //해당파라미터를 int로 캐스팅한 후 변수에 대입
  	   }
    	System.out.println("aa123 : " + request.getParameter("checkUser"));
    	mav.addObject("getUserId", request.getParameter("checkUser"));
        mav.addObject("visitRecord", visitorService.getVisitorListManager(page)); //방문기록리스트가져오기
        mav.addObject("visitorList", visitorService.getVisitorListAll()); //등록방문객리스트가져오기
        mav.addObject("page", page);   //페이지번호
        mav.addObject("countVisitRecord", visitorService.countVisitRecord());  //전체 visitRecord의 갯수
        
        return mav;
    }

    @RequestMapping(value = "/addVisitor.do") //nomal user의 방문객 추가
    public String addVisitor(String fixed, String visitor_name, String business, HttpSession session){
        UserVO userVO = (UserVO) session.getAttribute("UserFlag");
        String user_id = userVO.getUser_id(); //현재 로그인 중인 user의 id 가져오기
        VisitorVO visitorVO = new VisitorVO();

        if (fixed != null) { //fixed 체크되면 on, 체크 안되면 null
            visitorVO = visitorService.insert(user_id, visitor_name, business, fixed);
        } else if (fixed == null) {
            visitorVO = visitorService.insert(user_id, visitor_name, business, null);
        }
        
        visitorService.addVisitor(visitorVO);

        return "redirect:/getVisitorList.do";
    }

    @RequestMapping(value = "/addVisitorManager.do")
    public ModelAndView addVisitorManager(String user_id, String visitor_name, String business){
    	ModelAndView mav = new ModelAndView("redirect:/manage_visitor.do");
    	
    	UserVO vo = userService.getOne(user_id);
    	System.out.println("vo : " + vo);
    	if(vo == null){
    		System.out.println("null 입니다.");
    		mav.addObject("checkUser", true);
    	}
    	else if(vo != null){
    		mav.addObject("checkUser", vo);
    		VisitorVO visitorVO = visitorService.insert(user_id, visitor_name, business, null);
            visitorService.addVisitorManager(visitorVO);
    	}

    	return mav;
    }
    
    @RequestMapping(value = "/insertVisit.do")
    public ModelAndView insertVisit(int user_no){
    	ModelAndView mav = new ModelAndView("redirect:/manage_visitor.do");
    	
    	visitorService.addVisitRecord(user_no);

    	return mav;
    }

    @RequestMapping(value = "/getVisitorList.do")
    public ModelAndView getVisitorList(HttpSession session){ //id에 해당하는 방문객정보 session으로 가지고 있기
    	ModelAndView mav = new ModelAndView();
    	UserVO userVO = (UserVO) session.getAttribute("UserFlag");

    	if(userVO == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=user_visitor");

    		String id = userVO.getUser_id(); //현재 로그인 중인 유저 id
    		List < VisitorVO > visitorList = null;

    		try {
    			visitorList = visitorService.getVisitorList(id);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		mav.addObject("VisitorFlag", visitorList);
    	}

    	return mav;
    }

    @RequestMapping(value = "/updateVisitor.do") //noramal이 방문객 삭제를 눌렀을 때
    public @ResponseBody String updateVisitor(int visitordNo){
    	
    	visitorService.updateVisitor(visitordNo);
    	
        JSONObject obj = new JSONObject();
        
        return obj.toString();
    }

    @RequestMapping(value = "/getVisitor.do") //고정방문객 검색
    public @ResponseBody String getVisitor(ModelMap model, String userId3) throws Throwable{
        List < VisitorVO > visitorList = null;
        try {
            visitorList = visitorService.getVisitorList(userId3);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        JSONObject obj = new JSONObject();
        obj.put("visitorListModel", visitorList);
        
        return obj.toString();
    }

    @RequestMapping(value = "/deleteVisitRecord.do") //방문객리스트 삭제
    public @ResponseBody String deleteVisitRecord(int visitRecordNo){
        
        JSONObject obj = new JSONObject();
        
        visitorService.deleteVisitRecord(visitRecordNo);

        return obj.toString();
    }
    
    @RequestMapping(value = "/visitorModify.do")
    public @ResponseBody String visitorModify(int visitRecordNo, int visitorNo, String visitorId, String visitorName, String visitorBusiness, String visitorRegDate){
    
    	visitorService.modifyVisitor(visitorNo, visitorId, visitorName, visitorBusiness);
    	visitorService.modifyVisitRecord(visitRecordNo, visitorNo, visitorRegDate);
    	
    	JSONObject obj = new JSONObject();
    	
    	obj.put("visitorId", visitorId);
    	obj.put("visitorName", visitorName);
    	obj.put("visitorBusiness", visitorBusiness);
    	obj.put("visitorRegDate", visitorRegDate);
    	
    	return obj.toString();
    }
    
    //===========================================================================================
    /*@RequestMapping(value = "/addVisitorManager.do") //manager가 방문객 추가할 때 
    public @ResponseBody String addVisitorManager(String user_id, String visitor_name, String business, HttpServletResponse response, HttpServletRequest request) throws Exception{
        //String은 view를 뿌려주는? 가져다주는 애! 앞에 @ResponseBody 를 붙여주면 view를 넘겨주지않고 데이터만? 넘겨준다.
        System.out.println("addVisitorManager.do start!!!");

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        JSONObject obj = new JSONObject();

        VisitorVO visitorVO = visitorService.insert(user_id, visitor_name, business, null);
        visitorService.addVisitorManager(visitorVO);

        obj.put("add", visitorVO);
        obj.put("add2", visitorService.getRegDate());
        obj.put("recordNo", visitorService.getMaxVisitRecordNo());

        System.out.println(obj.toString());

        return obj.toString();
    }*/
    
    /*@RequestMapping(value = "/insertVisit.do") //검색된 방문객 방문객 리스트에 넣기
    public @ResponseBody String insertVisit(int insertUserNo, String insertUserId, String insertVisitorName, String insertBusiness, HttpServletResponse response, HttpServletRequest request) throws Exception {
        System.out.println("insertVisit.do start!!!");

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        JSONObject obj = new JSONObject();

        visitorService.addVisitRecord(insertUserNo);

        obj.put("user_id", insertUserId);
        obj.put("visitor_name", insertVisitorName);
        obj.put("business", insertBusiness);
        obj.put("regdate", visitorService.getRegDate());
        obj.put("recordNo", visitorService.getMaxVisitRecordNo());

        System.out.println("obj.toString : " + obj.toString());

        return obj.toString();
    }*/
}