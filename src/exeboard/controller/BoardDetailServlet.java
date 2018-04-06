package exeboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exeboard.model.service.ExeBoardService;
import exeboard.model.vo.ExeBoard;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/bdetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 게시글 상세보기 처리용 컨트롤러		

		String ecode = request.getParameter("ecode");
		int currentPage = Integer.parseInt(request.getParameter("page"));

		ExeBoardService bservice = new ExeBoardService();

		bservice.addReadCount(ecode);
		// 해당 게시글의 조회수 1 증가 처리
		ExeBoard board = new ExeBoardService().selectBoard(ecode);
		
		System.out.println(board.getSportname());
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if (board != null) {
			view = request.getRequestDispatcher("html/ij/exeboardDetailView.jsp");
			request.setAttribute("board", board);
			request.setAttribute("currentPage", currentPage);
			
			view.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			
			out.println("게시글상세보기실패");
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
