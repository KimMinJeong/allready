package kr.ac.apart.dao;

import kr.ac.apart.vo.ParkingVO;

public interface ParkingDAO {
	public String getParking_info(int parking_no);
	public void updateIsFull(ParkingVO pv);
}
