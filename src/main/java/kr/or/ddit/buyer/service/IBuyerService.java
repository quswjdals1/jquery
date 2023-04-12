package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.vo.BuyerVO;

public interface IBuyerService {
	//전체 아이디와 이름을 조회
	
	public List<BuyerVO> selectIdName();
	
	//상세보기
	public BuyerVO selectById(String id);
}
