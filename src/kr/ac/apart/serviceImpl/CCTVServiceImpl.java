package kr.ac.apart.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.apart.dao.CCTVDAO;
import kr.ac.apart.service.CCTVService;

@Service("CCTVService")
public class CCTVServiceImpl implements CCTVService{
	@Autowired
	private CCTVDAO cctvdao;

}
