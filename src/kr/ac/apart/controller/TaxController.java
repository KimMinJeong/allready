package kr.ac.apart.controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("taxController")
public class TaxController {

	@RequestMapping(value="/user_tax.do")
	public ModelAndView tax(){
		ModelAndView mav = new ModelAndView("webTemplete.jsp?nextPage=user_tax");
		
		URL url;
		URL url2;
		////  -- 傈眉 包府技 --
		try {
			url = new URL("http://www.k-apt.go.kr/user/mment/mment_main_list.mn");
			Document doc = Jsoup.parse(url, 8000);
			Element korea_tax = doc.select("table[class=board02]").first();
			mav.addObject("korea_tax", korea_tax);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		////  -- 窜瘤喊 包府技 --
		String targetURL = "http://www.k-apt.go.kr/user/mment/mment_list08.xmn";
		String urlParameters ="DATE_KB=OCCU_DATE&S_YEAR1=2014&A1_NAME=&A1_NAME_HCODE=&A1_SIDO=%EA%B2%BD%EA%B8%B0&A1_GUGUN=%EA%B0%80%ED%8F%89%EA%B5%B0&A1_DONG=%EA%B0%80%ED%8F%89%EC%9D%8D&A1_CODE=A47770201&searchFlag=Y";
		HttpURLConnection connection = null;

		try {
			url2 = new URL(targetURL);
			connection =(HttpURLConnection)url2.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
			connection.setRequestProperty("Content-Language", "UTF-8");  

			connection.setUseCaches (false);
			connection.setDoInput(true);
			connection.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream (connection.getOutputStream ());
			wr.writeBytes (urlParameters);
			wr.flush ();

			//Get Response	
			InputStream is = connection.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is));
			String line;
			StringBuffer response = new StringBuffer();      
			boolean startOk = false;
			boolean endOk = false;

			while((line = rd.readLine()) != null) {
				if(line.indexOf("<table class=\"board02\">") > 0) 
					startOk = true;
				if(startOk)
				{ 
					if(line.indexOf("</table>") > 0)
					{
						endOk = true;
						response.append(line);
						response.append('\r');
						break;
					}
					if(!endOk)
					{
						response.append(line);
						response.append('\r');
					}
				}
				mav.addObject("dangi_tax", response.toString());
			}
			rd.close();
			wr.close ();

		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(connection != null) {
				connection.disconnect(); 
			}
		}
		return mav;
	}
}
