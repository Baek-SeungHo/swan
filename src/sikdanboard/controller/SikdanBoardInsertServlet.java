package sikdanboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/SikdanBoardInsertServlet")
public class SikdanBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SikdanBoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
				SikdanBorad sb = new SikdanBorad();
				sb.setBoard_write(request.getParameter("board_write"));
				sb.setBoard_title(request.getParameter("board_title"));
				sb.setBoard_content(request.getParameter("board_content"));
			

				
				response.setContentType("text/html; charset=utf-8");

				if (new SikdanBoardService().insertBoard(sb) > 0) {
					response.sendRedirect("/semi/SikdanBoradListServlet?page=1");
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
