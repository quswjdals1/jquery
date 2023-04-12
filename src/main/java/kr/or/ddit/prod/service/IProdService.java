package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdService {
	public List<ProdVO> selectNameByGu(String gu);
	public ProdVO selectProdById(String id);
	
}
