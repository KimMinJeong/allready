package kr.ac.apart.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class UserDAOImpl {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
}
