package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;

/**
 * Servlet implementation class ReplyUpdate
 */
@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String cont = request.getParameter("cont");
		String renum = request.getParameter("renum");
		
		IBoardService service = BoardServiceImpl.getInstance();
		ReplyVO replyVO = new ReplyVO();
		replyVO.setRenum(Integer.parseInt(renum));
		replyVO.setCont(cont);
		int res = service.updateReply(replyVO);
		request.setAttribute("result", res);
		
		
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
	}

}
