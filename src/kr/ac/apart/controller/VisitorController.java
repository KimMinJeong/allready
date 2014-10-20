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

    @RequestMapping(value = "/user_visitor.do") //������ �湮������ 
    public String user_visitor(HttpSession session){
    	UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		return "emptyLoginSession";
    	}
    	else{
    		return "redirect:/getVisitorList.do";
    	}    
    }

    @RequestMapping(value = "/manage_visitor.do") //�������� �湮������
    public ModelAndView manage_visitor(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=manage_visitManage");
    	}
    	int page = 0;    //�⺻ ������ ��ȣ�� 0���� ����
    	if(request.getParameter("page") != null){   //�Ѿ�� �Ķ���Ͱ� �ִٸ�
  		   page = Integer.parseInt(request.getParameter("page"));   //�ش��Ķ���͸� int�� ĳ������ �� ������ ����
  	   }
    	System.out.println("aa123 : " + request.getParameter("checkUser"));
    	mav.addObject("getUserId", request.getParameter("checkUser"));
        mav.addObject("visitRecord", visitorService.getVisitorListManager(page)); //�湮��ϸ���Ʈ��������
        mav.addObject("visitorList", visitorService.getVisitorListAll()); //��Ϲ湮������Ʈ��������
        mav.addObject("page", page);   //��������ȣ
        mav.addObject("countVisitRecord", visitorService.countVisitRecord());  //��ü visitRecord�� ����
        
        return mav;
    }

    @RequestMapping(value = "/addVisitor.do") //nomal user�� �湮�� �߰�
    public String addVisitor(String fixed, String visitor_name, String business, HttpSession session){
        UserVO userVO = (UserVO) session.getAttribute("UserFlag");
        String user_id = userVO.getUser_id(); //���� �α��� ���� user�� id ��������
        VisitorVO visitorVO = new VisitorVO();

        if (fixed != null) { //fixed üũ�Ǹ� on, üũ �ȵǸ� null
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
    		System.out.println("null �Դϴ�.");
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
    public ModelAndView getVisitorList(HttpSession session){ //id�� �ش��ϴ� �湮������ session���� ������ �ֱ�
    	ModelAndView mav = new ModelAndView();
    	UserVO userVO = (UserVO) session.getAttribute("UserFlag");

    	if(userVO == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.setViewName("webTemplete.jsp?nextPage=user_visitor");

    		String id = userVO.getUser_id(); //���� �α��� ���� ���� id
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

    @RequestMapping(value = "/updateVisitor.do") //noramal�� �湮�� ������ ������ ��
    public @ResponseBody String updateVisitor(int visitordNo){
    	
    	visitorService.updateVisitor(visitordNo);
    	
        JSONObject obj = new JSONObject();
        
        return obj.toString();
    }

    @RequestMapping(value = "/getVisitor.do") //�����湮�� �˻�
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

    @RequestMapping(value = "/deleteVisitRecord.do") //�湮������Ʈ ����
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
    /*@RequestMapping(value = "/addVisitorManager.do") //manager�� �湮�� �߰��� �� 
    public @ResponseBody String addVisitorManager(String user_id, String visitor_name, String business, HttpServletResponse response, HttpServletRequest request) throws Exception{
        //String�� view�� �ѷ��ִ�? �������ִ� ��! �տ� @ResponseBody �� �ٿ��ָ� view�� �Ѱ������ʰ� �����͸�? �Ѱ��ش�.
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
    
    /*@RequestMapping(value = "/insertVisit.do") //�˻��� �湮�� �湮�� ����Ʈ�� �ֱ�
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