package sikdanboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sikdanboard.model.service.SikdanBoardService;
import sikdanboard.model.vo.SikdanBorad;

/**
 * Servlet implementation class SikdanBoardDetailViewServlet
 */
@WebServlet("/SikdanBoardDetailViewServlet")
public class SikdanBoardDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SikdanBoardDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String board_num = request.getParameter("board_num");

		SikdanBoardService sbs = new SikdanBoardService();

		sbs.addReadCount(Integer.parseInt(board_num));
		SikdanBorad sb = new SikdanBoardService().selectBoard(Integer.parseInt(board_num));

		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if (sb != null) {
			view = request.getRequestDispatcher("html/jh/sikdanboardDetailView.jsp");
			request.setAttribute("board", sb);

			view.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();

			out.println("����");
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
