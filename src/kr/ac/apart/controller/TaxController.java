package kr.ac.apart.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ac.apart.service.TaxService;
import kr.ac.apart.service.UserService;
import kr.ac.apart.vo.BoardVO;
import kr.ac.apart.vo.TaxVO;
import kr.ac.apart.vo.UserVO;
import kr.ac.apart.vo.VisitorVO;

import net.sf.json.JSONObject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("taxController")
public class TaxController {
	@Autowired
	private TaxService taxService;
	
	@Autowired
	private UserService userService;

    @SuppressWarnings("deprecation")

    @RequestMapping(value="/user_tax.do")
    public ModelAndView tax(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        UserVO vo = (UserVO) session.getAttribute("UserFlag");
        List<TaxVO> OneTax = taxService.getOneTax(vo.getUser_id());
        
    	if(vo == null){
    		mav.setViewName("emptyLoginSession");
    	}
    	else{
    		mav.addObject("OneTax", OneTax);
    		mav.setViewName("webTemplete.jsp?nextPage=user_tax");
    	}
    	
        URL url;
        URL url2;
        ////  -- 전체 관리세 --
        try {
            url = new URL("http://www.k-apt.go.kr/user/mment/mment_main_list.mn");
            Document doc = Jsoup.parse(url, 8000);
            Element korea_tax = doc.select("table[class=board02]").first();
            
            mav.addObject("korea_tax", korea_tax);
        } catch (IOException e) {
            e.printStackTrace();
        }

        ////  -- 단지별 관리세 --
        String targetURL = "http://www.k-apt.go.kr/user/mment/mment_main_list.mn";
        String urlParameters = "executeName=AptAddressList&A1_SIDO=%EA%B2%BD%EA%B8%B0&A1_GUGUN=%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EB%8F%99%EA%B5%AC&A1_DONG=%EC%9E%A5%ED%95%AD2%EB%8F%99&A1_CODE=A41038201";
        HttpURLConnection connection = null;
        DataOutputStream wr = null;
        BufferedReader rd = null;
        
        try {
            url2 = new URL(targetURL);
            
            connection = (HttpURLConnection) url2.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
            connection.setRequestProperty("Content-Language", "ko-KR");
            connection.setRequestProperty("charset", "UTF-8");

            connection.setUseCaches (false);
            connection.setDoInput(true);
            connection.setDoOutput(true);

            wr = new DataOutputStream (connection.getOutputStream ());
            
            wr.writeBytes (urlParameters);
            wr.flush ();

            //Get Response	
            rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8")); //inputstream에서 utf-8로 변환
            String line;
            StringBuffer response = new StringBuffer();
            boolean startOk = false;
            boolean endOk = false;
            
            while ((line = rd.readLine()) != null) {
                if (line.indexOf("<table class=\"board02\">") > 0) 
                    startOk = true;
                if (startOk) {
                    if (line.indexOf("</table>") > 0) {
                        endOk = true;
                        response.append(line);
                        response.append('\r');
                        break;
                    }
                    if (!endOk) {
                        response.append(line);
                        response.append('\r');
                    }
                }
                mav.addObject("dangi_tax", response.toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (connection != null) {
                connection.disconnect();
            }
            if (rd != null) {
                try {
                    rd.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if (wr != null) {
                try {
                    wr.close ();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        return mav;
    }
    
    @RequestMapping(value="/AddTaxForm.do")
    public ModelAndView AddTaxForm(){
    	ModelAndView mav = new ModelAndView();
    	List<TaxVO> taxList = taxService.getTaxList();
    	
    	mav.addObject("taxList", taxList);
    	mav.setViewName("webTemplete.jsp?nextPage=tax_write_form");
    	
    	return mav;
    }
    
    @RequestMapping(value="/TaxWriteForm.do")
    public ModelAndView TaxWrite(String user_id, int year, int month, int basic_tax,
		int electric_tax, int water_tax, int heating_tax, int internet_tax){
    	ModelAndView mav = new ModelAndView();
    	
    	try{
	    	TaxVO tax_vo = taxService.addTax(user_id, year, month, basic_tax, electric_tax, water_tax, heating_tax, internet_tax);
	    	List<TaxVO> taxList = taxService.getTaxList();
	    	
	    	mav.addObject("tax_vo", tax_vo);
	    	mav.addObject("taxList", taxList);
	    	mav.setViewName("webTemplete.jsp?nextPage=tax_view");
    	}
    	catch(Exception e){
    		mav.setViewName("DuplicatePage");
    	}
    	return mav;
    }
}