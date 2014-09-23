package kr.ac.apart.daoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.apart.dao.CCTVDAO;

@Repository("CCTVDao") 
public class CCTVDAOImpl implements CCTVDAO {
    @Autowired 
    private SqlMapClientTemplate sqlMapClientTemplate;
}