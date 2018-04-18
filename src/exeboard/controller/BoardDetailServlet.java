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
@WebServlet("/edetail")
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

		String ecode = request.getParameter("ecode");
		ExeBoardService bservice = new ExeBoardService();

		bservice.addReadCount(ecode);

		ExeBoard board = new ExeBoardService().selectBoard(ecode);

		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if (board != null) {
			view = request.getRequestDispatcher("html/ij/boardDetail.jsp");
			request.setAttribute("board", board);

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
