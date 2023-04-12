package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IBoardDao {
	//글쓰기 - 실행된 행의 갯수 대신 시퀀스 값을 리턴
	public int insertBoard(BoardVO boardVO);
	//글삭제
	public int deleteBoard(int num);
	//글수정
	public int upadateBoard(BoardVO boardVO);
	//조회수 증가
	public int updateHit(int num);
	//리스트-검색 포함
	public List<BoardVO> selectByPage(Map<String,Object>map);
	//댓글쓰기
	public int insertReply(ReplyVO replyVO);
	//댓글 삭제
	public int deleteReply(int renum);
	//댓글 수정
	public int updateReply(ReplyVO replyVO);
	//댓글 리스트
	public List<ReplyVO> selectReply(int bonum);
	//페이지 처리

	//전체 글 갯수 구하기
	public int totalCount(Map<String,Object>map);
}
