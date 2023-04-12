package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

public class BuyerServiceImpl implements IBuyerService{

	private static IBuyerService service;
	private static IBuyerDao dao;
	
	private BuyerServiceImpl() {
		dao=BuyerDaoImpl.getInstance();
	}

	
	public static IBuyerService getInstance() {
		if(service==null) {
			service = new BuyerServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<BuyerVO> selectIdName() {
		// TODO Auto-generated method stub
		return dao.selectIdName();
	}

	@Override
	public BuyerVO selectById(String id) {
		// TODO Auto-generated method stub
		return dao.selectById(id);
	}

}
