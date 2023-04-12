package kr.or.ddit.prod.dao;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdDao {
	
	public List<ProdVO> selectNameByGu(String gu);
	public ProdVO selectProdById(String id);
	
}
