package kr.ac.apart.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.apart.dao.ParkingDAO;
import kr.ac.apart.vo.ParkingVO;

@Repository("parkingDao") public class ParkingDAOImpl implements ParkingDAO {

    @Autowired 
    private SqlMapClientTemplate sqlMapClientTemplate;

    @Override 
    public String getParking_info(ParkingVO pv) {
        return (String) sqlMapClientTemplate.queryForObject("getIsFull",pv);
    }
    public void updateIsFull(ParkingVO pv) {
        //		System.out.println(pv);
        sqlMapClientTemplate.update("updateIsFull", pv);
    }
    @Override 
    public int getFloorCount(String floor) {
        return (int)sqlMapClientTemplate.queryForObject("getFloorCount", floor);
    }
    @Override 
    public int getParkCount() {
        return (int)sqlMapClientTemplate.queryForObject("getParkCount");
    }
    @Override 
    public int getSectionCount(ParkingVO parking) {
        return (int)sqlMapClientTemplate.queryForObject("getSectionCount", parking);
    }
}