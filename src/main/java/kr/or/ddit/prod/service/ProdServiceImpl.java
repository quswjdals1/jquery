package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService {
	
	private static IProdService service;
	private static IProdDao dao;
	
	private ProdServiceImpl() {
		dao= ProdDaoImpl.getInstance();
	}
	
	public static IProdService getInstance() {
		if(service==null) {
			service = new ProdServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<ProdVO> selectNameByGu(String gu) {
		// TODO Auto-generated method stub
		return dao.selectNameByGu(gu);
	}

	@Override
	public ProdVO selectProdById(String id) {
		// TODO Auto-generated method stub
		return dao.selectProdById(id);
	}
	

}
