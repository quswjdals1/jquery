package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao dao;
	private int cnt;

	private MemberDaoImpl() {

	}

	public static IMemberDao getInstance() {
		if(dao==null) {
			dao = new MemberDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<MemberVO> selectAllMember() {
		// TODO Auto-generated method stub
		
		SqlSession session = null;
		List<MemberVO> list =null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("selectAllMember");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}

		return list;
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		cnt = session.insert("insertMember",vo);
		session.commit();
		session.close();
		
		
		return cnt;
	}

	@Override
	public String idCheck(String id) {
		String res = null;
		
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		res = session.selectOne("idCheck",id);
		session.close();
		return res;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		// TODO Auto-generated method stub
		
		List<ZipVO> list = null;
		
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		list=session.selectList("selectByDong",dong);
		return list;
	}
	

}
