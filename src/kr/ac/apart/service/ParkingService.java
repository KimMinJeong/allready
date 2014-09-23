package kr.ac.apart.service;


import kr.ac.apart.vo.ParkingVO;

public interface ParkingService {
	public Boolean isFull(ParkingVO pv) throws Exception;
	public void updateParking(ParkingVO pv) throws Exception;
}
