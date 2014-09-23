package kr.ac.apart.dao;

import kr.ac.apart.vo.ParkingVO;

public interface ParkingDAO {
    public String getParking_info(ParkingVO pv);
    public void updateIsFull(ParkingVO pv);
    public int getFloorCount(String floor);
    public int getParkCount();
    public int getSectionCount(ParkingVO parking);
}