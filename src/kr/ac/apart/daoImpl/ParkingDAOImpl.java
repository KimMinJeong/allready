package kr.ac.apart.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.apart.dao.ParkingDAO;
import kr.ac.apart.vo.ParkingVO;

@Repository("parkingDao")
public class ParkingDAOImpl implements ParkingDAO{
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	@Override
	public String getParking_info(int parking_no) {
		return (String) sqlMapClientTemplate.queryForObject("getIsFull", parking_no);
	}
	public void updateIsFull(ParkingVO pv) {
		sqlMapClientTemplate.update("updateIsFull", pv);
	}
}
