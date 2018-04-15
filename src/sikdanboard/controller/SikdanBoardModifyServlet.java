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
 * Servlet implementation class SikdanBoardInsertServlet
 */
@WebServlet("/SikdanBoardModifyServlet")
public class SikdanBoardModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SikdanBoardModifyServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("utf-8");
				SikdanBorad sb = new SikdanBorad();
				
				sb.setBoard_title(request.getParameter("board_title"));
				sb.setBoard_content(request.getParameter("board_content"));
				sb.setBoard_num(Integer.parseInt(request.getParameter("board_num")));

				
				response.setContentType("text/html; charset=utf-8");

				if (new SikdanBoardService().updateBoard(sb) > 0) {
					//RequestDispatcher view = request.getRequestDispatcher("html/jh/sikdanboardWriteForm.jsp");
					response.sendRedirect("/semi/SikdanBoradListServlet?page=1");
					//view.forward(request, response);
				} else {

					PrintWriter out = response.getWriter();

					out.println("ㅇㅇ");
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
