package kr.ac.apart.serviceImpl;

import kr.ac.apart.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl {
	@Autowired
	private BoardDAO boardDao;
	

}
