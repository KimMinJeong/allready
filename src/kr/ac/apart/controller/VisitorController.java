package kr.ac.apart.controller;

<<<<<<< HEAD
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
=======
import java.util.List;

>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.apart.service.VisitorService;
import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.VisitorVO;

<<<<<<< HEAD
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.dom4j.VisitorSupport;
=======
import net.sf.json.JSONObject;

>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
=======
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("visitorController")
public class VisitorController {
<<<<<<< HEAD
	
	@Autowired
	private VisitorService visitorService;

	@RequestMapping(value="/user_visitor.do")      //유저의 방문페이지 
	public String user_visitor(){
		/*return "webTemplete.jsp?nextPage=user_visitor";*/
		return "redirect:/getVisitorList.do";
	}
	
	@RequestMapping(value="/manage_visitor.do")    //관리자의 방문페이지
	public ModelAndView manage_visitor(){
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_visitManage");
		mav.addObject("visitRecord", visitorService.getVisitorListManager());  //방문기록리스트가져오기
		mav.addObject("visitorList", visitorService.getVisitorListAll());      //등록방문객리스트가져오기
		
		return mav;
	}
	
	@RequestMapping(value="/addVisitor.do")      //nomal user의 방문객 추가
	public String addVisitor(String fixed, String visitor_name, String business, HttpSession session){
		UserVO userVO = (UserVO)session.getAttribute("UserFlag");
		String user_id = userVO.getUser_id();    //현재 로그인 중인 user의 id 가져오기
		VisitorVO visitorVO = new VisitorVO();
		
		if(fixed != null){     //fixed 체크되면 on, 체크 안되면 null
			visitorVO = visitorService.insert(user_id, visitor_name, business, fixed);
		}
		else if(fixed == null){
			visitorVO = visitorService.insert(user_id, visitor_name, business, null);
		}
		visitorService.addVisitor(visitorVO);

		return "redirect:/getVisitorList.do";
	}
	
	@RequestMapping(value="/addVisitorManager.do")   //manager가 방문객 추가할 때 
	public @ResponseBody String addVisitorManager(String user_id, String visitor_name, String business, HttpServletResponse response,HttpServletRequest request) throws Exception {
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
	}
	
	@RequestMapping(value="/insertVisit.do")  //검색된 방문객 방문객 리스트에 넣기
	public @ResponseBody String insertVisit(int insertUserNo, String insertUserId, String insertVisitorName, String insertBusiness, HttpServletResponse response,HttpServletRequest request) throws Exception{
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
	}
	
	@RequestMapping(value="/getVisitorList.do")
	public ModelAndView getVisitorList(HttpSession session){   //id에 해당하는 방문객정보 session으로 가지고 있기
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_visitor");
		UserVO userVO = (UserVO)session.getAttribute("UserFlag");
		String id = userVO.getUser_id();     //현재 로그인 중인 유저 id
		List<VisitorVO> visitorList = null;
		
		try{
			visitorList = visitorService.getVisitorList(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.addObject("VisitorFlag", visitorList);
		
		return mav;		
	}
	
	@RequestMapping(value="/updateVisitor.do")    //noramal이 방문객 삭제를 눌렀을 때
	public String updateVisitor(String name){
		visitorService.updateVisitor(name);
		
		return "redirect:/getVisitorList.do";
	}
	
//	@RequestMapping(value="/deleteVisitor.do")     //normal의 방문객 삭제
//	public String deleteVisitor(String name){
//		visitorService.deleteVisitor(name);
//		
//		return "redirect:/getVisitorList.do";
//	}
	
	@RequestMapping(value="/getVisitor.do")  //고정방문객 검색
	public @ResponseBody String getVisitor(ModelMap model, String userId3) throws Throwable{
		System.out.println("getVisitor");
		List<VisitorVO> visitorList = null;
		try{
			visitorList = visitorService.getVisitorList(userId3);
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject obj = new JSONObject();
		obj.put("visitorListModel", visitorList);
		
		System.out.println(obj.toString());
		return obj.toString();
	}
	
	@RequestMapping(value="/deleteVisitRecord")  //방문객리스트 삭제
	public @ResponseBody void deleteVisitRecord(String visitRecordNo){
		System.out.println("deleteVisitRecord!");
		JSONObject obj = new JSONObject();
		visitorService.deleteVisitRecord(visitRecordNo);
	}
	
//	@RequestMapping(value="/getVisitor.do")     //고정방문객 검색MAV
//	ModelAndView getVisitor(String user_id){
//		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_visitManage");
//		List<VisitorVO> visitorList = null;
//		try{
//			visitorList = visitorService.getVisitorList(user_id);
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		mav.addObject("VisitorManagerFlag", visitorList);
//
//		return mav;
//	}
=======
   
   @Autowired
   private VisitorService visitorService;

   @RequestMapping(value="/user_visitor.do")      //유저의 방문페이지 
   public String user_visitor(){
      /*return "webTemplete.jsp?nextPage=user_visitor";*/
      return "redirect:/getVisitorList.do";
   }
   
   @RequestMapping(value="/manage_visitor.do")    //관리자의 방문페이지
   public ModelAndView manage_visitor(){
      ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_visitManage");
      mav.addObject("visitRecord", visitorService.getVisitorListManager());  //방문기록리스트가져오기
      mav.addObject("visitorList", visitorService.getVisitorListAll());      //등록방문객리스트가져오기
      
      return mav;
   }
   
   @RequestMapping(value="/addVisitor.do")      //nomal user의 방문객 추가
   public String addVisitor(String fixed, String visitor_name, String business, HttpSession session){
      UserVO userVO = (UserVO)session.getAttribute("UserFlag");
      String user_id = userVO.getUser_id();    //현재 로그인 중인 user의 id 가져오기
      VisitorVO visitorVO = new VisitorVO();
      
      if(fixed != null){     //fixed 체크되면 on, 체크 안되면 null
         visitorVO = visitorService.insert(user_id, visitor_name, business, fixed);
      }
      else if(fixed == null){
         visitorVO = visitorService.insert(user_id, visitor_name, business, null);
      }
      visitorService.addVisitor(visitorVO);

      return "redirect:/getVisitorList.do";
   }
   
   @RequestMapping(value="/addVisitorManager.do")   //manager가 방문객 추가할 때 
   public @ResponseBody String addVisitorManager(String user_id, String visitor_name, String business, HttpServletResponse response,HttpServletRequest request) throws Exception {
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
   }
   
   @RequestMapping(value="/insertVisit.do")  //검색된 방문객 방문객 리스트에 넣기
   public @ResponseBody String insertVisit(int insertUserNo, String insertUserId, String insertVisitorName, String insertBusiness, HttpServletResponse response,HttpServletRequest request) throws Exception{
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
   }
   
   @RequestMapping(value="/getVisitorList.do")
   public ModelAndView getVisitorList(HttpSession session){   //id에 해당하는 방문객정보 session으로 가지고 있기
      ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_visitor");
      UserVO userVO = (UserVO)session.getAttribute("UserFlag");
      String id = userVO.getUser_id();     //현재 로그인 중인 유저 id
      List<VisitorVO> visitorList = null;
      
      try{
         visitorList = visitorService.getVisitorList(id);
      }catch(Exception e){
         e.printStackTrace();
      }
      mav.addObject("VisitorFlag", visitorList);
      
      return mav;      
   }
   
   @RequestMapping(value="/updateVisitor.do")    //noramal이 방문객 삭제를 눌렀을 때
   public String updateVisitor(String name){
      visitorService.updateVisitor(name);
      
      return "redirect:/getVisitorList.do";
   }
   
//   @RequestMapping(value="/deleteVisitor.do")     //normal의 방문객 삭제
//   public String deleteVisitor(String name){
//      visitorService.deleteVisitor(name);
//      
//      return "redirect:/getVisitorList.do";
//   }
   
   @RequestMapping(value="/getVisitor.do")  //고정방문객 검색
   public @ResponseBody String getVisitor(ModelMap model, String userId3) throws Throwable{
      System.out.println("getVisitor");
      List<VisitorVO> visitorList = null;
      try{
         visitorList = visitorService.getVisitorList(userId3);
      }catch(Exception e){
         e.printStackTrace();
      }
      JSONObject obj = new JSONObject();
      obj.put("visitorListModel", visitorList);
      
      System.out.println(obj.toString());
      return obj.toString();
   }
   
   @RequestMapping(value="/deleteVisitRecord.do")  //방문객리스트 삭제
   public @ResponseBody String deleteVisitRecord(int visitRecordNo){
      System.out.println("deleteVisitRecord!");
      JSONObject obj = new JSONObject();
      visitorService.deleteVisitRecord(visitRecordNo);
      
      return obj.toString();
   }
   
//   @RequestMapping(value="/getVisitor.do")     //고정방문객 검색MAV
//   ModelAndView getVisitor(String user_id){
//      ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_visitManage");
//      List<VisitorVO> visitorList = null;
//      try{
//         visitorList = visitorService.getVisitorList(user_id);
//      }catch(Exception e){
//         e.printStackTrace();
//      }
//      mav.addObject("VisitorManagerFlag", visitorList);
//
//      return mav;
//   }
>>>>>>> fd3712788e26ece27a4b50de01c30310b581baa2
}