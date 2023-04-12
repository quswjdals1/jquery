package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public class BoardServiceImpl implements IBoardService {
	private static BoardServiceImpl service;
	private static BoardDaoImpl dao;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	public static BoardServiceImpl getInstance() {
		if(service==null) {
			service= new BoardServiceImpl();
		}
		return service;
	}
	@Override
	public int insertBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return dao.insertBoard(boardVO);
	}

	@Override
	public int deleteBoard(int num) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(num);
	}

	@Override
	public int upadateBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return dao.upadateBoard(boardVO);
	}

	@Override
	public int updateHit(int num) {
		// TODO Auto-generated method stub
		return dao.updateHit(num);
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage(map);
	}

	@Override
	public int insertReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return dao.insertReply(replyVO);
	}

	@Override
	public int deleteReply(int renum) {
		// TODO Auto-generated method stub
		return dao.deleteReply(renum);
	}

	@Override
	public int updateReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return dao.updateReply(replyVO);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totalCount(map);
	}

	
	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		
		//전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<>();
		map.put("stype", stype);
		map.put("sword", sword);
		int totalCount = totalCount(map);
		
		//전체 페이지 수 구하기
		int totaPage= (int)Math.ceil((double)totalCount/PageVO.getPerList());
		
		//start,end 구하기
		int start = (page-1)*PageVO.getPerList()+1;
		int end = start+PageVO.getPerList()-1;
		if(end>totalCount) end = totalCount;
		
		//시작페이지 끝페이지
		int perPage=PageVO.getPerPage();
		int startPage = (page-1) /perPage*perPage+1;
		int endPage = startPage+perPage-1;
		if(endPage>totaPage) {
			endPage=totaPage;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setStart(start);
		pageVO.setEnd(end);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setTotalPage(totaPage);
		return pageVO;
	}

	@Override
	public List<ReplyVO> selectReply(int bonum) {
		// TODO Auto-generated method stub
		return dao.selectReply(bonum);
	}

}
