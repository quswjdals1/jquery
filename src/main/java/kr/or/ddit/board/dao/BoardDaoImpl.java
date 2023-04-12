package kr.or.ddit.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

public class BoardDaoImpl implements IBoardDao {
	private static BoardDaoImpl dao;
	
	private BoardDaoImpl() {
		
	}
	
	public static BoardDaoImpl getInstance() {
		if(dao==null) {
			
			dao= new BoardDaoImpl();
		}
		return dao;
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertBoard",boardVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int deleteBoard(int num) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.delete("deleteBoard",num);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int upadateBoard(BoardVO boardVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.update("updateBoard",boardVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int updateHit(int num) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.update("updateHit",num);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<BoardVO> res = session.selectList("selectByPage",map);
		session.close();
		return res;
	}

	@Override
	public int insertReply(ReplyVO replyVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.insert("insertReply",replyVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int deleteReply(int renum) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.delete("deleteReply",renum);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int updateReply(ReplyVO replyVO) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.update("updateReply",replyVO);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		int res = session.selectOne("totalCount",map);
		session.close();
		return res;
	}

	@Override
	public List<ReplyVO> selectReply(int bonum) {
		List<ReplyVO> list = null;
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		list = session.selectList("selectReply",bonum);
		session.close();
				
		return list;
	}

	
}
