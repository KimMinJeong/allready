package kr.ac.apart.daoImpl;

import kr.ac.apart.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
}
