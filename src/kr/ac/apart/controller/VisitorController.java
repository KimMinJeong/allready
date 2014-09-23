package kr.ac.apart.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

    @RequestMapping(value = "/user_visitor.do") //������ �湮������ 
    public String user_visitor() {
        return "redirect:/getVisitorList.do";
    }

    @RequestMapping(value = "/manage_visitor.do") //�������� �湮������
    public ModelAndView manage_visitor() {
        ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=manage_visitManage");
        mav.addObject("visitRecord", visitorService.getVisitorListManager()); //�湮��ϸ���Ʈ��������
        mav.addObject("visitorList", visitorService.getVisitorListAll()); //��Ϲ湮������Ʈ��������
        return mav;
    }

    @RequestMapping(value = "/addVisitor.do") //nomal user�� �湮�� �߰�
    public String addVisitor(String fixed, String visitor_name, String business, HttpSession session) {
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

    @RequestMapping(value = "/addVisitorManager.do") //manager�� �湮�� �߰��� �� 
    public @ResponseBody String addVisitorManager(String user_id, String visitor_name, String business, HttpServletResponse response, HttpServletRequest request) throws Exception {
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
    }

    @RequestMapping(value = "/insertVisit.do") //�˻��� �湮�� �湮�� ����Ʈ�� �ֱ�
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
    }

    @RequestMapping(value = "/getVisitorList.do")
    public ModelAndView getVisitorList(HttpSession session) { //id�� �ش��ϴ� �湮������ session���� ������ �ֱ�
        ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_visitor");
        UserVO userVO = (UserVO) session.getAttribute("UserFlag");
        String id = userVO.getUser_id(); //���� �α��� ���� ���� id
        List < VisitorVO > visitorList = null;

        try {
            visitorList = visitorService.getVisitorList(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.addObject("VisitorFlag", visitorList);
        return mav;
    }

    @RequestMapping(value = "/updateVisitor.do") //noramal�� �湮�� ������ ������ ��
    public String updateVisitor(String name) {
        visitorService.updateVisitor(name);

        return "redirect:/getVisitorList.do";
    }

    @RequestMapping(value = "/getVisitor.do") //�����湮�� �˻�
    public @ResponseBody String getVisitor(ModelMap model, String userId3) throws Throwable {
        System.out.println("getVisitor");
        List < VisitorVO > visitorList = null;
        try {
            visitorList = visitorService.getVisitorList(userId3);
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONObject obj = new JSONObject();
        obj.put("visitorListModel", visitorList);

        System.out.println(obj.toString());
        return obj.toString();
    }

    @RequestMapping(value = "/deleteVisitRecord.do") //�湮������Ʈ ����
    public @ResponseBody String deleteVisitRecord(int visitRecordNo) {
        System.out.println("deleteVisitRecord!");
        JSONObject obj = new JSONObject();
        visitorService.deleteVisitRecord(visitRecordNo);
        return obj.toString();
    }
}