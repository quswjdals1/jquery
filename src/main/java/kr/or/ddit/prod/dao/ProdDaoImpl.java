package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {
	
	private static IProdDao dao;
	
	private ProdDaoImpl() {
		
	}
	
	public static IProdDao getInstance() {
		if(dao==null) {
			dao=new ProdDaoImpl();
		}
		return dao;
	}

	@Override
	public List<ProdVO> selectNameByGu(String gu) {

		SqlSessionFactory factory = MybatisSqlSessionFactory.getSessionFactory();
		SqlSession session = factory.openSession();
		List<ProdVO> list = session.selectList("selectNameByGu",gu);
		session.close();
		return list;
	}

	@Override
	public ProdVO selectProdById(String id) {
		// TODO Auto-generated method stub
		SqlSessionFactory factory = MybatisSqlSessionFactory.getSessionFactory();
		SqlSession session = factory.openSession();
		ProdVO prodVO= session.selectOne("selectProdById",id);
		session.close();
		return prodVO;
	}

}
