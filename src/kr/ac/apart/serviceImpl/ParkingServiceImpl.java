package kr.ac.apart.serviceImpl;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.ParkingDAO;
import kr.ac.apart.service.ParkingService;
import kr.ac.apart.vo.ParkingVO;

@Service("parkingService")
public class ParkingServiceImpl implements ParkingService{
	@Autowired
	private ParkingDAO parkingDao;

	@Override
	public Boolean isFull(ParkingVO pv) throws Exception {
		String result=parkingDao.getParking_info(pv);
		if(result.equals("FULL"))
			return true;
		else
			return false;
	}

	@Override
	public void updateParking(ParkingVO pv){
		parkingDao.updateIsFull(pv);
//		.txt파일로 저장하는 코드		
//		FileReader fr = null;
//		BufferedReader br = null;
//		String s =null;
//		System.out.println("ok");
//		try{
//			fr = new FileReader("D:\\LSG\\workspace\\Apart\\WebContent\\parking_info\\data.txt");
//			br = new BufferedReader(fr);
//			s = null;
//			while((s=br.readLine())!=null)
//			{
//				System.out.println(s);
//				pv.setIsfull(s);
//				System.out.println(pv);
//				parkingDao.updateIsFull(pv);
//			}
//			br.close();
//			fr.close();
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
	}
}
