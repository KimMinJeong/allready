package kr.ac.apart.serviceImpl;

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

}
