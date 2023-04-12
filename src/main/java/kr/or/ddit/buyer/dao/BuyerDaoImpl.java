package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

public class BuyerDaoImpl implements IBuyerDao {
	private static IBuyerDao dao;
	
	private BuyerDaoImpl() {
		
	}
	
	public static IBuyerDao getInstance() {
		if(dao==null) {
			dao = new BuyerDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<BuyerVO> selectIdName() {
		// TODO Auto-generated method stub
		SqlSessionFactory factory = MybatisSqlSessionFactory.getSessionFactory();
		SqlSession session = factory.openSession();
		List<BuyerVO> list = session.selectList("buyer.selectIdName");
		session.close();
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		// TODO Auto-generated method stub
		SqlSessionFactory factory = MybatisSqlSessionFactory.getSessionFactory();
		SqlSession session = factory.openSession();
		BuyerVO buyerVO = session.selectOne("buyer.selectById",id);
		session.close();
		return buyerVO;
	}

}
