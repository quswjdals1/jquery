package kr.or.ddit.lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

public class LprodDaoImpl implements ILprodDao {
	private static ILprodDao dao;
	
	private LprodDaoImpl() {
		
	}
	
	public static ILprodDao getInstance() {
		if(dao==null) {
			dao=new LprodDaoImpl();
		}
		return dao;
	}

	@Override
	public List<LprodVO> selectAll() {
		// TODO Auto-generated method stub
		SqlSession session=null;
		List<LprodVO> list=null;
		
		try {
			 session= MybatisSqlSessionFactory.getSqlSession();
			 list= session.selectList("lprod.selectAll");
		} finally {
			session.close();
		}
		
		
		
		
		return list;
	}

}
