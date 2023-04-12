package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;


@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송데이터 받기 - bonum
		int bonum = Integer.parseInt(request.getParameter("bonum"));
		
		//service 객체 얻기
		IBoardService service = BoardServiceImpl.getInstance();
		
		//service 메소드 호출 - 결과값 받기
		List<ReplyVO>list = service.selectReply(bonum);
		
		//결과값을 request에 저장하기
		request.setAttribute("list", list);
		
		//view페이지로 이동
		request.getRequestDispatcher("/boardview/replyList.jsp").forward(request, response);
		
	}

}
