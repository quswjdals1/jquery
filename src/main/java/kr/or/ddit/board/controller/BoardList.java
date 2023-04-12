package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;


@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		BoardServiceImpl service = BoardServiceImpl.getInstance();
		
		//페이지 처리에 필요한 값들을 계산
		PageVO pvo = service.pageInfo(page, stype, sword);
		
		//service- list를 select결과값 받기
		Map<String, Object>map = new HashMap<>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		map.put("sword", sword);
		map.put("stype", stype);
		
		List<BoardVO> list = service.selectByPage(map);
		
		request.setAttribute("list", list);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());
		
		request.getRequestDispatcher("/boardview/boardList.jsp").forward(request, response);
	}

}
