package kr.ac.apart.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class UserServiceImpl {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

}
